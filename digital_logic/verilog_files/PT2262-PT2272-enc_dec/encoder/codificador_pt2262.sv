`timescale 1us/1ns
module PT2262_ENCODER(
    input logic clk, reset,
    input logic [7:0] A,
    input logic [3:0] D,
    output logic sync,
    output logic cod_o
);

typedef enum logic[7:0] {  
    IDLE = 8'h00,
    INITIAL_STATE = 8'h01,
    GENERATE_A0 = 8'h02,
    GENERATE_A1 = 8'h03,
    GENERATE_A2 = 8'h04,
    GENERATE_A3 = 8'h05,
    GENERATE_A4 = 8'h06,
    GENERATE_A5 = 8'h07,
    GENERATE_A6 = 8'h08,
    GENERATE_A7 = 8'h09,
    GENERATE_D0 = 8'h0A,
    GENERATE_D1 = 8'h0B,
    GENERATE_D2 = 8'h0C,
    GENERATE_D3 = 8'h0D,
    GENERATE_SYNC = 8'h0E,
    RESET_MODULES = 8'h0F,
    INITIALIZE_OSCILLATOR = 8'h10,
    INITIALIZE_BIT_GENERATOR = 8'h11
} ENCODER_FSM_STATE;

ENCODER_FSM_STATE current_state, next_state;

logic [7:0] INTERPRETED_ADDR, F_BIT_LOCATOR;
logic osc_clk; // Oscillator output clock 
logic osc_rst; // Oscillator reset signal
logic bit_gen_rst; // Reset signal for the bit generator
logic bit_gen_enb; // Enable signal for the bit generator
logic [1:0] bit_gen_input; // Input signal for select the type of the bit that must be generated
logic bit_gen_output; // Output signal that represents the generated bit
logic bit_generated_flag; // Flag that indicates that a bit was generated
logic past_osc_clk;
logic osc_clk_rose;
logic bit_sent_flag;


assign osc_rst = ~reset; // Oscillator resets on low
// assign bit_gen_rst = ~reset; // Bit generator resets on low

ADDRESS_INTERPRETER addr_interpreter(
    .A(A),
    .INTERPRETED_ADDR(INTERPRETED_ADDR),
    .F_BIT_LOCATOR(F_BIT_LOCATOR)
);

// Instantiate an oscillator that creates a 12kHz oscillation clock from the 3MHz input clock
CLOCK_DIVIDER #(
        .DIVIDER(250)
    )internal_oscillator(
        .INPUT_CLK(clk), 
        .RST(osc_rst), 
        // .RST(osc_rst), 
        .OUTPUT_CLK(osc_clk) 
    );

/*  

    Instantiates the bit generator module to generate the signals that represent the 0, 1 and F bits according
    to the PT2262 protocol.

    A few disclaimers about the bit generator working:  
    * It has an enable pin that turns possible to keep generating the same bit forever or until a the enable ping is pulled down. 
      Or until the reset signal is pulled down. Whichever happens first.
    * Once the generation of bit starts, it does not end until all of the two high pulses are generated. This means that, even if
      the input_bit control signal changes on a requesting to generate another type of bit, the current bit being generated will not
      be interrupted.  
      Similar process occurs when the enable pin is pulled down while the bit is being generated. The bit generation will not be interrupted. 

*/
BIT_GENERATOR signal_creator(
    .osc_clk(osc_clk),
    .rst(bit_gen_rst),
    // .rst(bit_gen_rst),
    .enable_generation(bit_gen_enb),
    .input_bit(bit_gen_input),
    .output_signal(bit_gen_output),
    .bit_sent(bit_sent_flag)
);

assign cod_o = (bit_gen_input != 2'b11) ? bit_gen_output : 0; // Drives the cod_o output only and only if the bit being generated is not a sync bit.
assign sync = (bit_gen_input == 2'b11) ? bit_gen_output : 0; // Drives the sync output only and only if the bit being generated is a sync bit.

// A counter that counts the number of high pulses created byt the bit generator.
// This is going to be used to drive the FSM state changing.
// If two pulses were detected this means that a bit was already generated and we can proceed
// to the generation of the next bit.
// logic [1:0] bit_gen_pulse_count;
// always_ff @(posedge bit_gen_output, posedge clk, posedge reset) begin : bit_generated_pulse_counter
//     if (reset) begin
//         bit_gen_pulse_count <= 2'b00;
//     end else begin
//         if (osc_clk_rose && bit_gen_pulse_count == 1)
//             bit_gen_pulse_count <= 2'b00;
//         else
//             bit_gen_pulse_count <= bit_gen_pulse_count + 1;
//     end
// end



always@(posedge clk)
begin : save_past_osc_clk
    past_osc_clk <= osc_clk;
end

assign osc_clk_rose = ( (osc_clk==1) && (past_osc_clk==0));



always_comb begin : encoder_fsm

    next_state = current_state;

    if(reset) begin
        // next_state = RESET_MODULES;
        next_state = INITIALIZE_BIT_GENERATOR;
        bit_generated_flag = 1;
        bit_gen_rst = 1'b0; // Bit generator resets on low
        bit_gen_enb = 1'b0; // Bit generation is disabled
    end else begin
        case(current_state)
            RESET_MODULES: begin
                next_state = INITIALIZE_OSCILLATOR;
            end

            INITIALIZE_OSCILLATOR: begin
                if (osc_clk_rose) begin
                    next_state = INITIALIZE_BIT_GENERATOR;
                end

            end

            INITIALIZE_BIT_GENERATOR: begin
                bit_gen_rst = 1'b1; // Bit generator resets on low
                if (osc_clk_rose)
                    next_state = GENERATE_A0;
            end


            IDLE: begin
                if(sync) begin
                    next_state = INITIAL_STATE;
                end else begin
                    next_state = IDLE;
                end
            end

            GENERATE_A0: begin
                bit_generated_flag = 0; // Control flag to prevent sending the same bit more than once.
                bit_gen_enb = 1'b1; // Enable the bit generation

                if (bit_sent_flag && osc_clk_rose) begin
                    bit_generated_flag = 1;
                    next_state = GENERATE_A1;
                end
                
                if (!bit_generated_flag) begin
                    if(F_BIT_LOCATOR[0]) // Checking for a bit F existance has the higher priority of all things. 
                        bit_gen_input = 2'b10;
                    else // If no bit F exists, we can proceed to request the generation of a bit 1 ou bit 0.
                        bit_gen_input = INTERPRETED_ADDR[0] ? 2'b01 : 2'b00;            
                end


            end

            GENERATE_A1: begin
                bit_generated_flag = 0;

                if (bit_sent_flag && osc_clk_rose) begin
                    bit_generated_flag = 1;
                    next_state = GENERATE_A2;
                end

                if (!bit_generated_flag) begin
                    if(F_BIT_LOCATOR[1]) // Checking for a bit F existance has the higher priority of all things. 
                        bit_gen_input = 2'b10;
                    else // If no bit F exists, we can proceed to request the generation of a bit 1 ou bit 0.
                        bit_gen_input = INTERPRETED_ADDR[1] ? 2'b01 : 2'b00;            
                end


            end

            GENERATE_A2: begin
                bit_generated_flag = 0;
                if (bit_sent_flag && osc_clk_rose) begin
                    bit_generated_flag = 1;
                    next_state = GENERATE_A3;
                end


                if (!bit_generated_flag) begin
                    if(F_BIT_LOCATOR[2]) // Checking for a bit F existance has the higher priority of all things. 
                        bit_gen_input = 2'b10;
                    else // If no bit F exists, we can proceed to request the generation of a bit 1 ou bit 0.
                        bit_gen_input = INTERPRETED_ADDR[2] ? 2'b01 : 2'b00;            
                end
            end

            GENERATE_A3: begin
                bit_generated_flag = 0;
                if (bit_sent_flag && osc_clk_rose) begin
                    bit_generated_flag = 1;
                    next_state = GENERATE_A4;
                end


                if (!bit_generated_flag) begin
                    if(F_BIT_LOCATOR[3]) // Checking for a bit F existance has the higher priority of all things. 
                        bit_gen_input = 2'b10;
                    else // If no bit F exists, we can proceed to request the generation of a bit 1 ou bit 0.
                        bit_gen_input = INTERPRETED_ADDR[3] ? 2'b01 : 2'b00;            
                end
            end

            GENERATE_A4: begin
                bit_generated_flag = 0;
                if (bit_sent_flag && osc_clk_rose) begin
                    bit_generated_flag = 1;
                    next_state = GENERATE_A5;
                end

                if (!bit_generated_flag) begin
                    if(F_BIT_LOCATOR[4]) // Checking for a bit F existance has the higher priority of all things. 
                        bit_gen_input = 2'b10;
                    else // If no bit F exists, we can proceed to request the generation of a bit 1 ou bit 0.
                        bit_gen_input = INTERPRETED_ADDR[4] ? 2'b01 : 2'b00;            
                end
                
            end

            GENERATE_A5: begin
                bit_generated_flag = 0;
                if (bit_sent_flag && osc_clk_rose) begin
                    bit_generated_flag = 1;
                    next_state = GENERATE_A6;
                end

                if (!bit_generated_flag) begin
                    if(F_BIT_LOCATOR[5]) // Checking for a bit F existance has the higher priority of all things. 
                        bit_gen_input = 2'b10;
                    else // If no bit F exists, we can proceed to request the generation of a bit 1 ou bit 0.
                        bit_gen_input = INTERPRETED_ADDR[5] ? 2'b01 : 2'b00;            
                end

            end

            GENERATE_A6: begin
                bit_generated_flag = 0;
                if (bit_sent_flag && osc_clk_rose) begin
                    bit_generated_flag = 1;
                    next_state = GENERATE_A7;
                end

                if (!bit_generated_flag) begin
                    if(F_BIT_LOCATOR[6]) // Checking for a bit F existance has the higher priority of all things. 
                        bit_gen_input = 2'b10;
                    else // If no bit F exists, we can proceed to request the generation of a bit 1 ou bit 0.
                        bit_gen_input = INTERPRETED_ADDR[6] ? 2'b01 : 2'b00;            
                end
            end

            GENERATE_A7: begin
                bit_generated_flag = 0;
                if (bit_sent_flag && osc_clk_rose) begin
                    bit_generated_flag = 1;
                    next_state = GENERATE_D0;
                end

                if (!bit_generated_flag) begin
                    if(F_BIT_LOCATOR[7]) // Checking for a bit F existance has the higher priority of all things. 
                        bit_gen_input = 2'b10;
                    else // If no bit F exists, we can proceed to request the generation of a bit 1 ou bit 0.
                        bit_gen_input = INTERPRETED_ADDR[7] ? 2'b01 : 2'b00;            
                end
            end

            GENERATE_D0: begin
                bit_generated_flag = 0;
                if (bit_sent_flag && osc_clk_rose) begin
                    bit_generated_flag = 1;
                    next_state = GENERATE_D1;
                end

                if (!bit_generated_flag) begin
                    bit_gen_input = D[0] ? 2'b01 : 2'b00;            
                end

            end

            GENERATE_D1: begin
                bit_generated_flag = 0;
                if (bit_sent_flag && osc_clk_rose) begin
                    bit_generated_flag = 1;
                    next_state = GENERATE_D2;
                end

                if (!bit_generated_flag) begin
                    bit_gen_input = D[1] ? 2'b01 : 2'b00;            
                end
            end

            GENERATE_D2: begin
                bit_generated_flag = 0;
                if (bit_sent_flag && osc_clk_rose) begin
                    bit_generated_flag = 1;
                    next_state = GENERATE_D3;
                end

                if (!bit_generated_flag) begin
                    bit_gen_input = D[2] ? 2'b01 : 2'b00;            
                end
            end

            GENERATE_D3: begin
                bit_generated_flag = 0;
                if (bit_sent_flag && osc_clk_rose) begin
                    bit_generated_flag = 1;
                    next_state = GENERATE_SYNC;
                end

                if (!bit_generated_flag) begin
                    bit_gen_input = D[3] ? 2'b01 : 2'b00;            
                end
            end

            GENERATE_SYNC: begin
                bit_generated_flag = 0;
                if (bit_sent_flag && osc_clk_rose) begin
                   bit_generated_flag = 1;
                   next_state = GENERATE_A0;
                end

                if (!bit_generated_flag) begin
                    bit_gen_input = 2'b11;            
                end    

            end
        endcase
    end
end


always_ff @(posedge clk, posedge reset) begin : encoder_state_changer
    if(reset) begin
        current_state <= RESET_MODULES;
    end else begin
        current_state <= next_state;
    end
end

endmodule