`timescale 1us/1ns
module decodificador_pt2272(
    input logic clk, // 3MHz conforme especificação
    input logic reset, // reset ativo alto
    input logic [7:0] A, // endereço de entrada, trinário
    input logic cod_i,  // dado codificado de entrada
    output logic [3:0] D, // dado recebido registrado
    output logic dv       // sinalização de novo dado valido recebido, sincrono ao mesmo dominio de clock da saída "D"
);


typedef enum logic[2:0] {  
    INITIAL_STATE = 3'b000,
    BIT_1_DETECTED = 3'b001,
    BIT_0_DETECTED = 3'b010,
    BIT_F_DETECTED = 3'b011,
    BIT_SYNC_DETECTED = 3'b100,
    PULSE_COUNTING = 3'b101

} DECODER_FSM_STATE;

/*****************************************
*
* control variables
*
******************************************/
DECODER_FSM_STATE current_state, next_state;
logic [4:0] HIGH_PULSE_COUNTING;
logic [7:0] LOW_PULSE_COUNTING;
logic reset_counters;

/*****************************************
*
* Instantiate an oscillator that creates a 12kHz 
* oscillation clock from the 3MHz input clock
*
******************************************/

logic osc_clk;
logic osc_rst;

assign osc_rst = reset; // Oscillator resetting

CLOCK_DIVIDER #(
    .DIVIDER(250)
)internal_oscillator(
    .INPUT_CLK(clk), 
    .RST(osc_rst), 
    // .RST(osc_rst), 
    .OUTPUT_CLK(osc_clk) 
);

/*****************************************
*
* internal bidirectional shift register
* with serial input and parallel output
*
******************************************/
// Parameters
const logic [4:0] BIDIR_SHIFTREG_SIZE = 26;
// parameter int BIDIR_SHIFTREG_SIZE = 26;
// Inputs
// logic BIDIR_SHIFTREG_ENABLER;
logic BIDIR_SHIFTREG_RESET;
// logic BIDIR_SHIFTREG_SERIAL_IN;
// logic [25:0] BIDIR_SHIFTREG_PARALLEL_IN;
logic [2:0] BIDIR_SHIFTREG_OP_MODE;
logic [1:0] BIDIR_SHIFTREG_PT2272_BIT_IN;

// Outputs
logic [25:0] BIDIR_SHIFTREG_PARALLEL_OUT;
logic BIDIR_SHIFTREG_RIGHT_SHIFT_OUT;
logic BIDIR_SHIFTREG_LEFT_SHIFT_OUT;

// Instantiate the shiftreg
BIDIR_SHIFTREG RCVD_DATA_SHIFTREG (
    .enable(osc_clk),
    .reset(BIDIR_SHIFTREG_RESET),
    .shift_in(1'b0),
    .d(26'h0),
    .PT2272_BIT(BIDIR_SHIFTREG_PT2272_BIT_IN),
    .OP(BIDIR_SHIFTREG_OP_MODE),
    .q(BIDIR_SHIFTREG_PARALLEL_OUT),
    .shift_out_right(BIDIR_SHIFTREG_RIGHT_SHIFT_OUT),
    .shift_out_left(BIDIR_SHIFTREG_LEFT_SHIFT_OUT)
);

/*****************************************
*
* cod_i rising and falling edge detection
*
******************************************/
logic PREVIOUS_cod_i;
logic cod_i_ROSE;
logic cod_i_FELL;
logic current_cod_i;

/*****************************************
*
* Address Interpreter instantiation
*
******************************************/

logic [7:0] INTERPRETED_ADDR, F_BIT_LOCATOR;
logic [7:0] internal_interpreted_addr, internal_f_bit_locator;

ADDRESS_INTERPRETER addr_translator(
    .A(A),
    .INTERPRETED_ADDR(INTERPRETED_ADDR),
    .F_BIT_LOCATOR(F_BIT_LOCATOR)
);


assign current_cod_i = cod_i;

always_ff @(posedge cod_i, posedge reset) begin : SAVE_PAST_cod_i
    if(reset)
        PREVIOUS_cod_i <= 0;
    else
        PREVIOUS_cod_i <= current_cod_i;
end

assign cod_i_ROSE = ((cod_i==1) && (PREVIOUS_cod_i==1));
assign cod_i_FELL = ((cod_i==0) && (PREVIOUS_cod_i==1));

always_ff @(posedge osc_clk, posedge reset) begin : PULSE_COUNTING_FF
    if(reset)begin
        HIGH_PULSE_COUNTING <= 0;
        LOW_PULSE_COUNTING <= 0;
    end else begin
        if (reset_counters) begin //Has higher priority than the counting operations.
            HIGH_PULSE_COUNTING <= 0;
            LOW_PULSE_COUNTING <= 0;
        end else if(cod_i_ROSE)
            HIGH_PULSE_COUNTING <= HIGH_PULSE_COUNTING + 1;
        else if(cod_i_FELL)
            LOW_PULSE_COUNTING <= LOW_PULSE_COUNTING + 1;
    end
end



always_comb begin : DECODER_FSM_COMB_BLOCK
    next_state = current_state;
    if(reset)begin
        next_state = INITIAL_STATE;
        // reset_counters = 1;
    end else begin
        unique case(current_state)
            INITIAL_STATE: begin
                if(cod_i_ROSE)begin
                    // reset_counters = 0;
                    next_state = PULSE_COUNTING;
                end
                else
                    next_state = INITIAL_STATE;
            end
           
            PULSE_COUNTING: begin
                if(HIGH_PULSE_COUNTING == 24 && LOW_PULSE_COUNTING == 6) begin// BIT 1
                    // reset_counters = 1;
                    next_state = BIT_1_DETECTED; 
                end else if(HIGH_PULSE_COUNTING == 8 && LOW_PULSE_COUNTING == 22) begin// BIT 0
                    // reset_counters = 1;
                    next_state = BIT_0_DETECTED; 
                end else if(HIGH_PULSE_COUNTING == 16 && LOW_PULSE_COUNTING == 14) begin// BIT F
                    // reset_counters = 1;
                    next_state = BIT_F_DETECTED;
                end else if(HIGH_PULSE_COUNTING == 4 && LOW_PULSE_COUNTING == 122) begin // BIT SYNC
                    // reset_counters = 1;
                    next_state = BIT_SYNC_DETECTED;
                end else
                    next_state = PULSE_COUNTING;
            end

            BIT_1_DETECTED: begin
                // reset_counters = 0;
                next_state = INITIAL_STATE;
            end

            BIT_0_DETECTED: begin
                // reset_counters = 0;
                next_state = INITIAL_STATE;
            end

            BIT_F_DETECTED: begin
                // reset_counters = 0;
                next_state = INITIAL_STATE;
            end

            BIT_SYNC_DETECTED: begin
                // reset_counters = 0;
                next_state = INITIAL_STATE;
            end

            default: begin
                next_state = INITIAL_STATE;
            end

        endcase
    end
end

always_ff @(posedge osc_clk, posedge reset) begin : DECODER_FSM_FF_BLOCK
    if(reset) begin
        reset_counters <= 0;
        BIDIR_SHIFTREG_RESET <= 1;
    end else begin
        unique case(current_state)
            INITIAL_STATE: begin
                BIDIR_SHIFTREG_OP_MODE <= 3'b000; // Turns shift right mode on
                BIDIR_SHIFTREG_RESET <= 0;
            end

            PULSE_COUNTING: begin
                if (next_state == BIT_0_DETECTED || next_state == BIT_1_DETECTED || next_state == BIT_F_DETECTED || next_state == BIT_SYNC_DETECTED) begin
                    reset_counters <= 1;
                end
            end

            BIT_1_DETECTED: begin
                reset_counters <= 0;
                BIDIR_SHIFTREG_OP_MODE <= 3'b101; // Turns shift right PT2272_BIT mode on
                BIDIR_SHIFTREG_PT2272_BIT_IN <= 2'b11; // Shift in 11 to the shift register
            end

            BIT_0_DETECTED: begin
                reset_counters <= 0;
                BIDIR_SHIFTREG_OP_MODE <= 3'b101; // Turns shift right PT2272_BIT mode on
                BIDIR_SHIFTREG_PT2272_BIT_IN <= 2'b00; // Shift in 00 to the shift register
            end

            BIT_F_DETECTED: begin
                reset_counters <= 0;
                BIDIR_SHIFTREG_OP_MODE <= 3'b101; // Turns shift right PT2272_BIT mode on
                BIDIR_SHIFTREG_PT2272_BIT_IN <= 2'b10; // Shift in 10 to the shift register
            end

            BIT_SYNC_DETECTED: begin
                reset_counters <= 0;
                BIDIR_SHIFTREG_OP_MODE <= 3'b101; // Turns shift right PT2272_BIT mode on
                BIDIR_SHIFTREG_PT2272_BIT_IN <= 2'b01; // Shift in 01 to the shift register
            end

            default: begin
            end
        endcase
    end
end

logic [8:0] i;
logic flag_dv;

always_ff @(posedge osc_clk, posedge reset) begin : RECEIVER_ADDRESS_REGISTERING_AND_VALIDATION
    if(reset)begin
        dv <= 0;
        flag_dv <= 0;
        internal_f_bit_locator <= 8'b00000000;
        internal_interpreted_addr <= 8'b00000000;
    end
    else begin
        if (current_state == BIT_SYNC_DETECTED)begin
            flag_dv <= 1; // Assumes that the received world is valid. 
            for (i = 0; i < 8; i++) begin 
                if(BIDIR_SHIFTREG_PARALLEL_OUT[((2*i) + 1 + 2)] == 1 && BIDIR_SHIFTREG_PARALLEL_OUT[((2*i) + 2)] == 0) begin //Checks the existance of an F bit.
                    // 2'b10 is the token for an F bit on this decoder
                    // BIDIR_SHIFTREG_PARALLEL_OUT[((2*i) + 1 + 2)] == 1 && BIDIR_SHIFTREG_PARALLEL_OUT[((2*i) + 2)] == 0
                    // The above line means something like BIDIR_SHIFTREG_PARALLEL_OUT[1] == 1 && BIDIR_SHIFTREG_PARALLEL_OUT[0] == 0 when we have a 2'b10 combination on the received data.
                    // This means that there's an F bit on the received data.
                    // Ass there is an F bit, assume 0 for this internal_interpreted_addr bit and process the current F bit on internal_f_bit_locator array
                    internal_interpreted_addr[i] <= 0;
                    internal_f_bit_locator[i] <= 1;

                    if(F_BIT_LOCATOR[i] != 1)begin 
                        //It interpreted that an F bit was receiveid. Doing a check with the real F_locator to verify 
                        //if we really have an F bit here.
                        flag_dv <= 0;
                    end
                end else if(BIDIR_SHIFTREG_PARALLEL_OUT[((2*i) + 1 + 2)] == 0 && BIDIR_SHIFTREG_PARALLEL_OUT[((2*i) + 2)] == 0)begin 
                    // /*If there is no F bit, proceed with a different approach of interpretation
                    // /* in this case, 00 represents a real 0 bit and 11 representes a real bit 1
                    internal_interpreted_addr[i] <= BIDIR_SHIFTREG_PARALLEL_OUT[(2*i) + 2];
                    internal_f_bit_locator[i] <= 0;

                    if(INTERPRETED_ADDR[i] != BIDIR_SHIFTREG_PARALLEL_OUT[(2*i) + 2])begin
                        flag_dv <= 0;
                    end
                end else if(BIDIR_SHIFTREG_PARALLEL_OUT[((2*i) + 1 + 2)] == 1 && BIDIR_SHIFTREG_PARALLEL_OUT[((2*i) + 2)] == 1)begin 
                    // If there is no F bit, proceed with a different approach of interpretation
                    // In this case, 00 represents a real 0 bit and 11 representes a real bit 1
                    internal_interpreted_addr[i] <= BIDIR_SHIFTREG_PARALLEL_OUT[(2*i) + 2];
                    internal_f_bit_locator[i] <= 0;

                    if(INTERPRETED_ADDR[i] != BIDIR_SHIFTREG_PARALLEL_OUT[(2*i) + 2])begin
                        flag_dv <= 0;
                    end
                end 

            end
        end else if (current_state == INITIAL_STATE && flag_dv == 1) begin
            D[0] <= BIDIR_SHIFTREG_PARALLEL_OUT[25] & BIDIR_SHIFTREG_PARALLEL_OUT[24];
            D[1] <= BIDIR_SHIFTREG_PARALLEL_OUT[23] & BIDIR_SHIFTREG_PARALLEL_OUT[22];
            D[2] <= BIDIR_SHIFTREG_PARALLEL_OUT[21] & BIDIR_SHIFTREG_PARALLEL_OUT[20];
            D[3] <= BIDIR_SHIFTREG_PARALLEL_OUT[19] & BIDIR_SHIFTREG_PARALLEL_OUT[18];
            dv <= 1;
            flag_dv <= 0;
        end else if(flag_dv == 0) begin
            dv <= 0;
        end
    end
end

always_ff @(posedge osc_clk, posedge reset) begin : decoder_state_changer
    if(reset)
        current_state <= INITIAL_STATE;
    else
        current_state <= next_state;
end


endmodule