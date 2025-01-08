`timescale 1us/1ns
module decodificador_pt2272(
    input clk, // 3MHz conforme especificação
    input reset, // reset ativo alto
    input [7:0] A, // endereço de entrada, trinário
    input cod_i,  // dado codificado de entrada
    output [3:0] D, // dado recebido registrado
    output dv       // sinalização de novo dado valido recebido, sincrono ao mesmo dominio de clock da saída "D"
);


typedef enum logic[7:0] {  
    IDLE = 8'h00,
    COUNTS_HIGH_PULSE = 8'h01,
    COUNTS_LOW_PULSE = 8'h02,
    BIT_1_DETECTED = 8'h03,
    BIT_0_DETECTED = 8'h04,
    BIT_F_DETECTED = 8'h05,
    BIT_SYNC_DETECTED = 8'h06,
    INITIAL_STATE = 8'h1F,
    PULSE_COUNTING = 8'h20

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

assign osc_rst = ~reset; // Oscillator resets on low

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
// const logic [5:0] BIDIR_SHIFTREG_SIZE = 26;
parameter int BIDIR_SHIFTREG_SIZE = 26;
// Inputs
logic BIDIR_SHIFTREG_ENABLER;
logic BIDIR_SHIFTREG_SERIAL_IN;
logic [BIDIR_SHIFTREG_SIZE-1:0] BIDIR_SHIFTREG_PARALLEL_IN;
logic [2:0] BIDIR_SHIFTREG_OP_MODE;
logic [1:0] BIDIR_SHIFTREG_PT2272_BIT_IN;

// Outputs
logic [BIDIR_SHIFTREG_SIZE-1:0] BIDIR_SHIFTREG_PARALLEL_OUT;
logic BIDIR_SHIFTREG_RIGHT_SHIFT_OUT;
logic BIDIR_SHIFTREG_LEFT_SHIFT_OUT;

// Instantiate the shiftreg
BIDIR_SHIFTREG #(BIDIR_SHIFTREG_SIZE) RCVD_DATA_SHIFTREG (
    .enable(BIDIR_SHIFTREG_ENABLER),
    .shift_in(BIDIR_SHIFTREG_SERIAL_IN),
    .d(BIDIR_SHIFTREG_PARALLEL_IN),
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

always_ff @(posedge cod_i, posedge reset) begin : SAVE_PAST_cod_i
    if(reset)
        PREVIOUS_cod_i <= 0;
    else
        PREVIOUS_cod_i <= cod_i;
end

assign cod_i_ROSE = ((cod_i==1) && (PREVIOUS_cod_i==1));
assign cod_i_FELL = ((cod_i==0) && (PREVIOUS_cod_i==1));

always_ff @(posedge osc_clk, posedge reset_counters) begin : PULSE_COUNTING_FF
    if(reset_counters)begin
        HIGH_PULSE_COUNTING <= 0;
        LOW_PULSE_COUNTING <= 0;
    end else begin
        if(cod_i_ROSE)
            HIGH_PULSE_COUNTING <= HIGH_PULSE_COUNTING + 1;
        else if(cod_i_FELL)
            LOW_PULSE_COUNTING <= LOW_PULSE_COUNTING + 1;
    end
end



always_comb begin : DECODER_FSM_COMB_BLOCK
    next_state = current_state;
    if(reset)begin
        next_state = INITIAL_STATE;
        reset_counters = 1;
    end else begin
        unique case(current_state)
            INITIAL_STATE: begin
                if(cod_i_ROSE)begin
                    reset_counters = 0;
                    next_state = PULSE_COUNTING;
                end
                else
                    next_state = INITIAL_STATE;
            end

            IDLE: begin
                if(cod_i_ROSE)
                    next_state = COUNTS_HIGH_PULSE;
                else if (cod_i_FELL)
                    next_state = COUNTS_LOW_PULSE;
                 else 
                    next_state = IDLE;
            end
            
            PULSE_COUNTING: begin
                if(HIGH_PULSE_COUNTING == 24 && LOW_PULSE_COUNTING == 7) begin// BIT 1
                    reset_counters = 1;
                    next_state = BIT_1_DETECTED; 
                end else if(HIGH_PULSE_COUNTING == 8 && LOW_PULSE_COUNTING == 23) begin// BIT 0
                    reset_counters = 1;
                    next_state = BIT_0_DETECTED; 
                end else if(HIGH_PULSE_COUNTING == 16 && LOW_PULSE_COUNTING == 15) begin// BIT F
                    reset_counters = 1;
                    next_state = BIT_F_DETECTED;
                end else if(HIGH_PULSE_COUNTING == 4 && LOW_PULSE_COUNTING == 127) begin // BIT SYNC
                    reset_counters = 1;
                    next_state = BIT_SYNC_DETECTED;
                end else
                    next_state = PULSE_COUNTING;
            end

            COUNTS_HIGH_PULSE: begin
                if (cod_i_FELL)begin
                    next_state = COUNTS_LOW_PULSE;
                end else begin
                    next_state = COUNTS_HIGH_PULSE;
                end
            end

            COUNTS_LOW_PULSE: begin
                if(cod_i_ROSE)begin
                    next_state = COUNTS_HIGH_PULSE;
                end else begin
                    next_state = COUNTS_LOW_PULSE;
                end
            end

            BIT_1_DETECTED: begin
                reset_counters = 0;
                next_state = INITIAL_STATE;
            end

            BIT_0_DETECTED: begin
                reset_counters = 0;
                next_state = INITIAL_STATE;
            end

            BIT_F_DETECTED: begin
                reset_counters = 0;
                next_state = INITIAL_STATE;
            end

            BIT_SYNC_DETECTED: begin
                reset_counters = 0;
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
        // reset_counters <= 1;
        BIDIR_SHIFTREG_PARALLEL_IN <= 26'b0; // Initialize the shift register with 0
        BIDIR_SHIFTREG_SERIAL_IN <= 0; // Shift in 0 to the shift register by default.
        BIDIR_SHIFTREG_PT2272_BIT_IN <= 2'b00; // Shift in 00 to the shift register by default.
        BIDIR_SHIFTREG_OP_MODE <= 3'b011;   // Load mode to loads a 0 to the shift register
        BIDIR_SHIFTREG_ENABLER <= 1; // Enable the shift register to load the 0 data.
        // HIGH_PULSE_COUNTING <= 0; // Reset the high pulse counting
        // LOW_PULSE_COUNTING <= 0; // Reset the low pulse counting
    end else begin
        unique case(current_state)
            IDLE: begin
                BIDIR_SHIFTREG_OP_MODE <= 3'b000; // Turns shift right mode on
                BIDIR_SHIFTREG_PT2272_BIT_IN <= 2'b00; // Shift in 00 to the shift register by default.
                BIDIR_SHIFTREG_ENABLER <= 0;   // Disable the shift register data loading.
            end

            INITIAL_STATE: begin
                // reset_counters <= 0;
                BIDIR_SHIFTREG_OP_MODE <= 3'b000; // Turns shift right mode on
                BIDIR_SHIFTREG_ENABLER <= 0;   // Disable the shift register data loading.
            end

            PULSE_COUNTING: begin
                if (next_state == BIT_0_DETECTED || next_state == BIT_1_DETECTED || next_state == BIT_F_DETECTED || next_state == BIT_SYNC_DETECTED) begin
                    // reset_counters <= 1;
                end
                // if(HIGH_PULSE_COUNTING == 24 && LOW_PULSE_COUNTING == 7) // BIT 1
                //     next_state = BIT_1_DETECTED; 
                // else if(HIGH_PULSE_COUNTING == 8 && LOW_PULSE_COUNTING == 23) // BIT 0
                //     next_state = BIT_0_DETECTED;
                // else if(HIGH_PULSE_COUNTING == 16 && LOW_PULSE_COUNTING == 15) // BIT F
                //     next_state = BIT_F_DETECTED;
                // else if(HIGH_PULSE_COUNTING == 4 && LOW_PULSE_COUNTING == 127) // BIT SYNC
                //     next_state = BIT_SYNC_DETECTED;
            end

            COUNTS_HIGH_PULSE: begin
            end

            COUNTS_LOW_PULSE: begin
            end

            BIT_1_DETECTED: begin
                // reset_counters <= 0;
                BIDIR_SHIFTREG_ENABLER <= 1; // Enable the shift register to load the data.
                BIDIR_SHIFTREG_OP_MODE <= 3'b100; // Turns shift right PT2272_BIT mode on
                BIDIR_SHIFTREG_PT2272_BIT_IN <= 2'b11; // Shift in 11 to the shift register
            end

            BIT_0_DETECTED: begin
                // reset_counters <= 0;
                BIDIR_SHIFTREG_ENABLER <= 1; // Enable the shift register to load the data.
                BIDIR_SHIFTREG_OP_MODE <= 3'b100; // Turns shift right PT2272_BIT mode on
                BIDIR_SHIFTREG_PT2272_BIT_IN <= 2'b00; // Shift in 00 to the shift register
            end

            BIT_F_DETECTED: begin
                // reset_counters <= 0;
                BIDIR_SHIFTREG_ENABLER <= 1; // Enable the shift register to load the data.
                BIDIR_SHIFTREG_OP_MODE <= 3'b100; // Turns shift right PT2272_BIT mode on
                BIDIR_SHIFTREG_PT2272_BIT_IN <= 2'b10; // Shift in 10 to the shift register
            end

            BIT_SYNC_DETECTED: begin
                // reset_counters <= 0;
                BIDIR_SHIFTREG_ENABLER <= 1; // Enable the shift register to load the data.
                BIDIR_SHIFTREG_OP_MODE <= 3'b100; // Turns shift right PT2272_BIT mode on
                BIDIR_SHIFTREG_PT2272_BIT_IN <= 2'b01; // Shift in 01 to the shift register
            end

            default: begin
            end
        endcase
    end
end


always_ff @(posedge osc_clk) begin : decoder_state_changer
    current_state <= next_state;
end


endmodule