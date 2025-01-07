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
    BIT_SYNC_DETECTED = 8'h06
    
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
* internal bidirectional shift register
* with serial input and parallel output
*
******************************************/
    // Parameters
    logic [3:0] BIDIR_SHIFTREG_SIZE = 13;
    // Inputs
    logic BIDIR_SHIFTREG_ENABLER;
    logic BIDIR_SHIFTREG_SERIAL_IN;
    logic [BIDIR_SHIFTREG_SIZE-1:0] BIDIR_SHIFTREG_PARALLEL_IN;
    logic [1:0] BIDIR_SHIFTREG_OP_MODE;

    // Outputs
    logic [BIDIR_SHIFTREG_SIZE-1:0] BIDIR_SHIFTREG_PARALLEL_OUT;
    logic BIDIR_SHIFTREG_RIGHT_SHIFT_OUT;
    logic BIDIR_SHIFTREG_LEFT_SHIFT_OUT;

    // Instantiate the shiftreg
    BIDIR_SHIFTREG #(BIDIR_SHIFTREG_SIZE) RCVD_DATA_SHIFTREG (
        .enable(BIDIR_SHIFTREG_ENABLER),
        .shift_in(BIDIR_SHIFTREG_SERIAL_IN),
        .d(BIDIR_SHIFTREG_PARALLEL_IN),
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
always@(posedge clk)
begin : SAVE_PAST_cod_i
    PREVIOUS_cod_i <= cod_i;
end

assign cod_i_ROSE = ( (cod_i==1) && (PREVIOUS_cod_i==0));
assign cod_i_FELL = ( (cod_i==0) && (PREVIOUS_cod_i==1));


// always_ff @(posedge clk, posedge reset_counters) begin : INPUT_SIGNAL_COUNTER
//     if(reset_counters) begin
//         HIGH_PULSE_COUNTING <= 0;
//         LOW_PULSE_COUNTING <= 0;
//     end
//     else begin
//         if(cod_i_ROSE)begin //Maybe this won't work as expected because this signal changes too fast and it's not synchronized with the clock.
//             HIGH_PULSE_COUNTING <= HIGH_PULSE_COUNTING + 1;
//         end
//         if(cod_i_FELL)begin
//             LOW_PULSE_COUNTING <= LOW_PULSE_COUNTING + 1;
//         end
//     end
// end



always_comb begin  : DECODER_FSM_COMB_BLOCK
    next_state = current_state;
    if(reset)begin
        // do_something
    end else begin
        case(current_state)
            IDLE: begin
                if(cod_i_ROSE)
                    next_state = COUNTS_HIGH_PULSE;
                else if (cod_i_FELL)
                    next_state = COUNTS_LOW_PULSE;
                 else 
                    next_state = IDLE;
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
                    if(HIGH_PULSE_COUNTING == 24 && LOW_PULSE_COUNTING == 8) // BIT 1
                        next_state = BIT_1_DETECTED;
                    else if(HIGH_PULSE_COUNTING == 8 && LOW_PULSE_COUNTING == 24) // BIT 0
                        next_state = BIT_0_DETECTED;
                    else if(HIGH_PULSE_COUNTING == 16 && LOW_PULSE_COUNTING == 16) // BIT F
                        next_state = BIT_F_DETECTED;
                    else if(HIGH_PULSE_COUNTING == 4 && LOW_PULSE_COUNTING == 128) // BIT SYNC
                        next_state = BIT_SYNC_DETECTED;
                    else
                        next_state = COUNTS_LOW_PULSE;
                end
            end

            BIT_1_DETECTED: begin
                // do_something
            end

            BIT_0_DETECTED: begin
                // do_something
            end

            BIT_F_DETECTED: begin
                // do_something
            end

            BIT_SYNC_DETECTED: begin
                // do_something
            end

        endcase
    end
end

always_ff @(posedge clk, posedge reset) begin : DECODER_FSM_FF_BLOCK
    if(reset) begin
        
        BIDIR_SHIFTREG_PARALLEL_IN <= 13'b0; // Initialize the shift register with 0
        BIDIR_SHIFTREG_SERIAL_IN <= 0; // Shift in 0 to the shift register by default.
        BIDIR_SHIFTREG_OP_MODE <= 2'b11;   // Load mode to loads a 0 to the shift register
        BIDIR_SHIFTREG_ENABLER <= 1; // Enable the shift register to load the 0 data.
        HIGH_PULSE_COUNTING <= 0; // Reset the high pulse counting
        LOW_PULSE_COUNTING <= 0; // Reset the low pulse counting

    end else begin
        case(current_state)
            IDLE: begin
                BIDIR_SHIFTREG_OP_MODE <= 2'b10; // Turns shift right mode on
                BIDIR_SHIFTREG_SERIAL_IN <= 0; // Shift in 0 to the shift register by default.
                BIDIR_SHIFTREG_ENABLER <= 0;   // Disable the shift register data loading.
                HIGH_PULSE_COUNTING <= 0; // Reset the high pulse counting
                LOW_PULSE_COUNTING <= 0; // Reset the low pulse counting
            end

            COUNTS_HIGH_PULSE: begin
                HIGH_PULSE_COUNTING <= HIGH_PULSE_COUNTING + 1;
            end

            COUNTS_LOW_PULSE: begin
                LOW_PULSE_COUNTING <= LOW_PULSE_COUNTING + 1;
            end

            BIT_1_DETECTED: begin
                BIDIR_SHIFTREG_PARALLEL_IN <= {BIDIR_SHIFTREG_PARALLEL_IN[11:0], 1'b1};
                BIDIR_SHIFTREG_SERIAL_IN <= 0;
                BIDIR_SHIFTREG_OP_MODE <= 2'b11;
                BIDIR_SHIFTREG_ENABLER <= 1;
            end

            BIT_0_DETECTED: begin
                BIDIR_SHIFTREG_PARALLEL_IN <= {BIDIR_SHIFTREG_PARALLEL_IN[11:0], 1'b0};
                BIDIR_SHIFTREG_SERIAL_IN <= 0;
                BIDIR_SHIFTREG_OP_MODE <= 2'b11;
                BIDIR_SHIFTREG_ENABLER <= 1;
            end

            BIT_F_DETECTED: begin
                BIDIR_SHIFTREG_PARALLEL_IN <= {BIDIR_SHIFTREG_PARALLEL_IN[11:0], 1'bx};
                BIDIR_SHIFTREG_SERIAL_IN <= 0;
                BIDIR_SHIFTREG_OP_MODE <= 2'b11;
                BIDIR_SHIFTREG_ENABLER <= 1;
            end

            BIT_SYNC_DETECTED: begin
                BIDIR_SHIFTREG_PARALLEL_IN <= {BIDIR_SHIFTREG_PARALLEL_IN[11:0], 1'b0};
                BIDIR_SHIFTREG_SERIAL_IN <= 0;
                BIDIR_SHIFTREG
            end
        endcase
    end
end



always_ff @(posedge clk, posedge reset) begin : decoder_state_changer
    if(reset) begin
        current_state <= IDLE;
    end else begin
        current_state <= next_state;
    end
end






endmodule