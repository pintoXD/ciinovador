`timescale 1us/1ns
module PT2262_ENCODER(
    input logic clk, reset,
    input logic [7:0] A,
    input logic [3:0] D,
    output logic sync,
    output logic cod_o
);

logic [7:0] INTERPRETED_ADDR, F_BIT_LOCATOR;
ADDRESS_INTERPRETER addr_interpreter(
    .A(A),
    .INTERPRETED_ADDR(INTERPRETED_ADDR),
    .F_BIT_LOCATOR(F_BIT_LOCATOR)
);

// Instantiate an oscillator that creates a 12kHz oscillation clock from the 3MHz input clock
logic osc_clk; // Oscillator output clock 
logic osc_rst; // Oscillator reset signal
CLOCK_DIVIDER #(
        .DIVIDER(250)
    )internal_oscillator(
        .INPUT_CLK(clk), 
        .RST(osc_rst), 
        .OUTPUT_CLK(osc_clk) 
    );

// Instantiates the bit generator module to generate the signals that represent the 0, 1 and F bits according
// to the PT2262 protocol.

/*  
    A few disclaimers about the bit generator working:  
    * It has an enable pin that turns possible to keep generating the same bit forever or until a the enable ping is pulled down. 
      Or until the reset signal is pulled down. Whichever happens first.
    * Once the generation of bit starts, it does not end until all of the two high pulses are generated. This means that, even if
      the input_bit control signal changes on a requesting to generate another type of bit, the current bit being generated will not
      be interrupted.  
      Similar process occurs when the enable pin is pulled down while the bit is being generated. The bit generation will not be interrupted. 
*/

logic bit_gen_rst; // Reset signal for the bit generator
logic bit_gen_enb; // Enable signal for the bit generator
logic [1:0] bit_gen_input; // Input signal for select the type of the bit that must be generated
logic bit_gen_output; // Output signal that represents the generated bit

BIT_GENERATOR signal_creator(
    .osc_clk(osc_clk),
    .rst(bit_gen_rst),
    .enable_generation(mock_ENB_GENERATION),
    .input_bit(mock_INPUT_BIT),
    .output_signal(bit_gen_output)
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
    GENERATE_SYNC = 8'h0E
} ENCODER_FSM_STATE;

ENCODER_FSM_STATE current_state, next_state;

// A counter that counts the number of high pulses created byt the bit generator.
// This is going to be used to drive the FSM state changing.
// If two pulses were detected this means that a bit was already generated and we can proceed
// to the generation of the next bit.
logic [1:0] bit_gen_pulse_count;
always_ff @(posedge bit_gen_output, posedge reset) begin : bit_generated_pulse_counter
    if (reset) begin
        bit_gen_pulse_count <= 2'b00;
    end else begin
        if (bit_gen_output) begin
            bit_gen_pulse_count <= bit_gen_pulse_count + 1;
        end else if (bit_gen_pulse_count == 2) begin
            bit_gen_pulse_count <= 2'b00;
        end
    end
end


always_comb begin : encoder_fsm
    next_state = current_state;
    if(reset) begin
        next_state = RESET_MODULES;
    end else begin
        case(current_state)
            RESET_MODULES: begin
                next_state = INITIALIZE_OSCILLATOR;
            end

            INITIALIZE_OSCILLATOR: begin
                osc_rst = 1'b1;
                next_state = INITIALIZE_BIT_GENERATOR;
            end

            INITIALIZE_BIT_GENERATOR: begin
                bit_gen_rst = 1'b1;
                next_state = IDLE;
            end

            // IDLE: begin
            //     if(sync) begin
            //         next_state = INITIAL_STATE;
            //     end else begin
            //         next_state = IDLE;
            //     end
            // end
            // INITIAL_STATE: begin
            //     next_state = GENERATE_A0;
            // end
            GENERATE_A0: begin
                if (bit_gen_pulse_count == 2) begin
                    next_state = GENERATE_A1;
                end
            end

            GENERATE_A1: begin
                if (bit_gen_pulse_count == 2) begin
                    next_state = GENERATE_A2;
                end
            end

            GENERATE_A2: begin
                if (bit_gen_pulse_count == 2) begin
                    next_state = GENERATE_A3;
                end
            end

            GENERATE_A3: begin
                if (bit_gen_pulse_count == 2) begin
                    next_state = GENERATE_A4;
                end
            end

            GENERATE_A4: begin
                if (bit_gen_pulse_count == 2) begin
                    next_state = GENERATE_A5;
                end
            end

            GENERATE_A5: begin
                if (bit_gen_pulse_count == 2) begin
                    next_state = GENERATE_A6;
                end
            end

            GENERATE_A6: begin
                if (bit_gen_pulse_count == 2) begin
                    next_state = GENERATE_A7;
                end
            end

            GENERATE_A7: begin
                if (bit_gen_pulse_count == 2) begin
                    next_state = GENERATE_D0;
                end
            end

            GENERATE_D0: begin
                if (bit_gen_pulse_count == 2) begin
                    next_state = GENERATE_D1;
                end
            end

            GENERATE_D1: begin
                if (bit_gen_pulse_count == 2) begin
                    next_state = GENERATE_D2;
                end
            end

            GENERATE_D2: begin
                if (bit_gen_pulse_count == 2) begin
                    next_state = GENERATE_D3;
                end
            end

            GENERATE_D3: begin
                if (bit_gen_pulse_count == 2) begin
                    next_state = GENERATE_SYNC;
                end
            end

            GENERATE_SYNC: begin
                if (bit_gen_pulse_count == 2) begin
                    next_state = IDLE;
                end
            end
        endcase
    end
end

always_ff @(posedge clk, posedge reset ) begin : encoder_fsm_ff
    if(reset) begin
        osc_rst <= 1'b0; // Oscillator resets on low
        bit_gen_rst <= 1'b0; // Bit generator resets on low
        bit_gen_enb <= 1'b0; // Bit generation is disabled
    end else begin
        case(current_state)
            RESET_MODULES: begin
                osc_rst <= 1'b0; // Oscillator resets on low
                bit_gen_rst <= 1'b0; // Bit generator resets on low
                bit_gen_enb <= 1'b0; // Bit generation is disabled
            end

            INITIALIZE_OSCILLATOR: begin
                osc_rst = 1'b1;
            end

            INITIALIZE_BIT_GENERATOR: begin
                bit_gen_rst = 1'b1;
            end

            GENERATE_A0: begin
                bit_gen_enb <= 1'b1;
                if(F_BIT_LOCATOR[0]) // Checking for a bit F existance has the higher priority of all things. 
                    bit_gen_input <= 2'b10;
                else // If no bit F exists, we can proceed to request the generation of a bit 1 ou bit 0.
                    bit_gen_input <= INTERPRETED_ADDR[0] ? 2'b01 : 2'b00;            
            end
        endcase
    end
end


always_ff @(posedge clk) begin : encoder_state_changer
    current_state <= next_state;
end

endmodule