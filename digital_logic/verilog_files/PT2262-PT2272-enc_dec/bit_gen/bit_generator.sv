/*
    This module receives a bit and generates a signal that represents the given
    bit according to the pt2262 protocol. It receives a 12kHz clock, control signals
    to select what bit should be generated and an enable bit generation signal. 

    It outputs the signals tha represents the desired bit.

*/

`timescale 1us/1ns
module BIT_GENERATOR(
    input logic osc_clk, rst, enable_generation,
    input logic [1:0] input_bit,
    output logic bit_sent,
    output logic output_signal
);

typedef enum bit[2:0] {  
    IDLE = 3'b000,
    INITIAL_STATE = 3'b001,
    GENERATE_BIT_1 = 3'b010,
    GENERATE_BIT_0 = 3'b011,
    GENERATE_BIT_F = 3'b100,
    GENERATE_BIT_SYNC_0 = 3'b101
} FSM_STATE;


FSM_STATE current_state, next_state;
logic [4:0] pulse_counter;
logic [6:0] pulse_counter_sync;
logic enable_pulse_counting;
logic enable_pulse_counting_sync;
logic is_first_run;

// Updates the current state
always_ff @(posedge osc_clk) begin : state_manager
    current_state <= next_state;
end

// Manages the pulse counter for bits 0, 1 and F
always_ff @(posedge osc_clk) begin : pulse_counter_ff
    if(enable_pulse_counting) begin
        pulse_counter <= pulse_counter + 1;
    end else begin
        pulse_counter <= 0;
    end
end 

// Manages the pulse counter for bit SYNC
always_ff @(posedge osc_clk) begin : pulse_counter_sync_ff
    if(enable_pulse_counting_sync) begin
        pulse_counter_sync <= pulse_counter_sync + 1;
    end else begin
        pulse_counter_sync <= 0;
    end
end 


// assign bit_sent = (current_state != IDLE && current_state != INITIAL_STATE) ? 1 : 0;

// always_ff @(posedge osc_clk) begin : bit_sent_manager
//     if(current_state != IDLE && current_state != INITIAL_STATE) begin
//         bit_sent <= 1;
//     end else begin
//         bit_sent <= 0;
//     end
// end



always_comb begin : magic_manager
    next_state = current_state;
    bit_sent = 0;
    if(rst) begin
        next_state = IDLE;
    end else begin
        unique case (current_state)
            IDLE: begin
                if(enable_generation) begin
                    next_state = INITIAL_STATE;
                end else begin
                    next_state = IDLE;
                end
            end

            INITIAL_STATE: begin
                // bit_sent = 0;

                // if(input_bit == 2'b00) begin
                //     next_state = GENERATE_BIT_0;
                // end else if (input_bit == 2'b01) begin
                //     next_state = GENERATE_BIT_1;
                // end else if (input_bit == 2'b10) begin
                //     next_state = GENERATE_BIT_F;
                // end else if (input_bit == 2'b11) begin
                //     next_state = GENERATE_BIT_SYNC_0;
                // end 

                unique case (input_bit)
                    2'b00: next_state = GENERATE_BIT_0;
                    2'b01: next_state = GENERATE_BIT_1;
                    2'b10: next_state = GENERATE_BIT_F;
                    2'b11: next_state = GENERATE_BIT_SYNC_0;
                    // default: next_state = next_state;
                endcase


                // else begin
                //     next_state = INITIAL_STATE;
                // end
            end

            GENERATE_BIT_0: begin
                if (pulse_counter == 31) begin
                    bit_sent = 1;
                    next_state = enable_generation ? INITIAL_STATE : IDLE;
                end else begin
                    next_state = GENERATE_BIT_0;
                end
            end

            GENERATE_BIT_1: begin
                if (pulse_counter == 31) begin
                    bit_sent = 1;
                    next_state = enable_generation ? INITIAL_STATE : IDLE;
                end else begin
                    next_state = GENERATE_BIT_1;
                end
            end

            GENERATE_BIT_F: begin
                if (pulse_counter == 31) begin
                    bit_sent = 1;
                    next_state = enable_generation ? INITIAL_STATE : IDLE;
                end else begin
                    next_state = GENERATE_BIT_F;
                end
            end

            GENERATE_BIT_SYNC_0: begin
                if (pulse_counter_sync == 127) begin
                    bit_sent = 1;
                    next_state = enable_generation ? INITIAL_STATE : IDLE;
                end else begin
                    next_state = GENERATE_BIT_SYNC_0;
                end
            end

            default: begin
                next_state = next_state;
            end
        endcase


    end
end


always_ff @(posedge osc_clk, posedge rst) begin: magic_manager_ff
    if(rst) begin
        output_signal <= 0;
        enable_pulse_counting <= 0;
        enable_pulse_counting_sync <= 0;
        is_first_run <= 1;
        // bit_sent <= 0;
    end else begin
        case (current_state)
            IDLE: begin 
                output_signal <= 0;
                enable_pulse_counting <= 0;
                enable_pulse_counting_sync <= 0;
                is_first_run <= 1;
            end

            INITIAL_STATE: begin
                // bit_sent <= 0;

                // Some sort of a workaround to solve the problem of the very first HIGH pulse 
                // being sent with one more clock cycle than the expected.
                if (is_first_run) begin
                    output_signal <= 0;
                    is_first_run <= 0;
                end else begin
                    output_signal <= 1;
                end

                // Enabling the pulse counting for the SYNC bit    
                if (input_bit == 2'b11) begin
                    enable_pulse_counting_sync <= 1;
                    is_first_run <= 1;
                    enable_pulse_counting <= 0;
                    // output_signal <= 0;
                end 
                // else begin
                //     enable_pulse_counting_sync <= 0;
                // end

                // Enabling the pulse counting for the ordinary bits
                if (input_bit != 2'b11) begin 
                    enable_pulse_counting <= 1;
                    enable_pulse_counting_sync <= 0;
                end
            end
                
            GENERATE_BIT_0: begin
                    if(pulse_counter < 32) begin
                        if(pulse_counter < 4) begin
                            output_signal <= 1;
                        end else if(pulse_counter > 15 && pulse_counter < 20) begin
                            output_signal <= 1;
                        end else begin
                            output_signal <= 0;
                            // bit_sent <= 1;
                        end
                    end
            end
            GENERATE_BIT_1: begin
                    if(pulse_counter < 31) begin
                        if(pulse_counter < 12) begin
                            output_signal <= 1;
                        end else if(pulse_counter > 15 && pulse_counter < 28) begin
                            output_signal <= 1;
                        end else begin
                            output_signal <= 0;
                        end
                    end else if (pulse_counter == 31) begin
                        output_signal <= 0;
                        // bit_sent <= 1;
                    end
            end
            GENERATE_BIT_F: begin
                    if(pulse_counter < 31) begin
                        if(pulse_counter < 4) begin
                            output_signal <= 1;
                        end else if(pulse_counter > 15 && pulse_counter < 28) begin
                            output_signal <= 1;
                        end else begin
                            output_signal <= 0;
                        end
                    end else if (pulse_counter == 31) begin
                        output_signal <= 0;
                        // bit_sent <= 1;
                    end
            end
            GENERATE_BIT_SYNC_0: begin //Generates HIGH por 4 oscillator cycles and a LOW for 124 oscillator cycles
                    if(pulse_counter < 128) begin
                        if(pulse_counter_sync < 3) begin
                            output_signal <= 1;
                        end else begin
                            output_signal <= 0;
                            // bit_sent <= 1; 
                        end
                    end
            end
        endcase
    end
end


endmodule
