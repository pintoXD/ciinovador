`timescale 1us/1ns
module BIT_GENERATOR(
    input logic osc_clk, rst, enable_generation,
    input logic input_bit,
    output logic output_signal
);

typedef enum logic[7:0] {  
    IDLE = 8'h00,
    INITIAL_STATE = 8'h01,
    GENERATE_BIT_1 = 8'h02,
    GENERATE_BIT_0 = 8'h04,
    GENERATE_BIT_F = 8'h08,
    CHECK_CONTINUOUS_GEN = 8'h10
} FSM_STATE;


FSM_STATE current_state, next_state;
logic [4:0] pulse_counter;
logic enable_pulse_counting;
logic is_first_run;

// Updates the current state
always_ff @(posedge osc_clk) begin : state_manager
    current_state <= next_state;
end

// Manages the pulse counter
always_ff @(posedge osc_clk, posedge rst) begin : pulse_counter_ff
    if(enable_pulse_counting) begin
        pulse_counter <= pulse_counter + 1;
    end else begin
        pulse_counter <= 0;
    end
end 

always_comb begin : magic_manager
    next_state = current_state;

    if(~rst) begin
        next_state = INITIAL_STATE;
    end else begin
        case (current_state)
            IDLE: begin
                if(enable_generation) begin
                    next_state = INITIAL_STATE;
                end else begin
                    next_state = IDLE;
                end
            end

            INITIAL_STATE: begin
                if(input_bit === 1'b1) begin
                    next_state = GENERATE_BIT_1;
                end else if (input_bit === 1'b0) begin
                    next_state = GENERATE_BIT_0;
                end else if (input_bit === 1'bx) begin
                    next_state = GENERATE_BIT_F;
                end else begin
                    next_state = INITIAL_STATE;
                end
            end

            GENERATE_BIT_0: begin
                if (pulse_counter == 31) begin
                    next_state = enable_generation ? INITIAL_STATE : IDLE;
                end else begin
                    next_state = GENERATE_BIT_0;
                end
            end
            GENERATE_BIT_1: begin
                if (pulse_counter == 31) begin
                    next_state = enable_generation ? INITIAL_STATE : IDLE;
                end else begin
                    next_state = GENERATE_BIT_1;
                end
            end
            GENERATE_BIT_F: begin
                if (pulse_counter == 31) begin
                    next_state = enable_generation ? INITIAL_STATE : IDLE;
                end else begin
                    next_state = GENERATE_BIT_F;
                end
            end
        endcase


    end
end


always_ff @(posedge osc_clk, negedge rst) begin: magic_manager_ff
    if(~rst) begin
        output_signal <= 0;
        enable_pulse_counting <= 0;
        is_first_run <= 1;
    end else begin
        case (current_state)
            IDLE: begin 
                output_signal <= 0;
                enable_pulse_counting <= 0;
                is_first_run <= 1;
            end

            INITIAL_STATE: begin
                if (is_first_run) begin
                    output_signal <= 0;
                    is_first_run <= 0;
                end else begin
                    output_signal <= 1;
                end
                enable_pulse_counting <= 1;
            end
                
            GENERATE_BIT_0: begin
                    if(pulse_counter < 32) begin
                        if(pulse_counter < 4) begin
                            output_signal <= 1;
                        end else if(pulse_counter > 15 && pulse_counter < 20) begin
                            output_signal <= 1;
                        end else begin
                            output_signal <= 0;
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
                    end
            end
        endcase
    end
end




// always_ff @(posedge osc_clk, negedge rst) begin : BIT_MANAGEMENT
     
//     if(~rst)begin
//         pulse_counter <= 0;
//         output_signal <= 1;    
//     end else begin
//         if(pulse_counter < 4)begin
//             output_signal <= 1;    
//         end else if (pulse_counter > 15 && pulse_counter < 20) begin
//             output_signal <= 1;    
//         end else begin
//             output_signal <= 0;
//         end

//         pulse_counter <= pulse_counter + 1;

//     end

// end



endmodule