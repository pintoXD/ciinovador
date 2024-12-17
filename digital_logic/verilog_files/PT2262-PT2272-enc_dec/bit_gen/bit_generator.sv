`timescale 1us/1ns
module BIT_GENERATOR(
    input logic osc_clk, rst, enable_generation,
    input logic input_bit,
    input logic [2:0] bit_type,
    output logic output_signal
);

/*typedef enum logic [31:0] {
    IDLE = 32'h00000000,
    BIT_0 = 32'h00000001,
    BIT_1 = 32'h00000002,
    BIT_2 = 32'h00000004,
    BIT_3 = 32'h00000008,
    BIT_4 = 32'h00000010,
    BIT_5 = 32'h00000020,
    BIT_6 = 32'h00000040,
    BIT_7 = 32'h00000080,
    BIT_8 = 32'h00000100,
    BIT_9 = 32'h00000200,
    BIT_10 = 32'h00000400,
    BIT_11 = 32'h00000800,
    BIT_12 = 32'h00001000,
    BIT_13 = 32'h00002000,
    BIT_14 = 32'h00004000,
    BIT_15 = 32'h00008000,
    BIT_16 = 32'h00010000,
    BIT_17 = 32'h00020000,
    BIT_18 = 32'h00040000,
    BIT_19 = 32'h00080000,
    BIT_20 = 32'h00100000,
    BIT_21 = 32'h00200000,
    BIT_22 = 32'h00400000,
    BIT_23 = 32'h00800000,
    BIT_24 = 32'h01000000,
    BIT_25 = 32'h02000000,
    BIT_26 = 32'h04000000,
    BIT_27 = 32'h08000000,
    BIT_28 = 32'h10000000,
    BIT_29 = 32'h20000000,
    BIT_30 = 32'h40000000,
    BIT_31 = 32'h80000000
} BIT_T;*/

typedef enum logic[7:0] {  
    IDLE = 8'h00,
    INITIAL_STATE = 8'h01,
    GENERATE_BIT_1 = 8'h02,
    GENERATE_BIT_0 = 8'h04,
    GENERATE_BIT_F = 8'h08,
    BIT_4 = 8'h10,
    BIT_5 = 8'h20,
    BIT_6 = 8'h40,
    BIT_7 = 8'h80
} FSM_STATE;


FSM_STATE current_state, next_state;
logic [4:0] pulse_counter;
logic past_clk;
logic clk_rose_up;
logic enable_pulse_counting;




// Updates the past_clk state to help on the rising edge computing.
always_ff @(osc_clk) begin: clk_change_detector
    past_clk <= osc_clk;
end

// Detects the rising edge of the clock given from the internal oscillator.
// always_comb begin : rising_edge_detector
assign clk_rose_up = ((osc_clk == 1) && (past_clk == 0));    
// end

// Updates the current state
always_ff @(posedge osc_clk) begin : state_manager
    current_state <= next_state;
end

// Manages the pulse counter
always_ff @(posedge osc_clk, negedge rst) begin : pulse_counter_ff
    if(~rst) begin
        pulse_counter <= 0;
    end else begin
        if(enable_pulse_counting) begin
            pulse_counter = pulse_counter + 1;
        end else begin
            pulse_counter <= 0;
        end
    end
end 

always_comb begin : magic_manager
    if(~rst) begin
        next_state = IDLE;
        output_signal = 0;
        enable_pulse_counting = 0;
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
                end else if (input_bit === 1'bz) begin
                    next_state = GENERATE_BIT_F;
                end else begin
                    next_state = IDLE;
                end
            end
            GENERATE_BIT_1: begin
                if (!enable_pulse_counting) begin
                    enable_pulse_counting = 1;
                end
                
                if(clk_rose_up && pulse_counter < 31) begin
                    if(pulse_counter < 4) begin
                        output_signal = 1;
                    end else if(pulse_counter > 15 && pulse_counter < 20) begin
                        output_signal = 1;
                    end else begin
                        output_signal = 0;
                    end
                end else if (clk_rose_up && pulse_counter == 31) begin
                    output_signal = 0;
                    enable_pulse_counting = 0;
                    next_state = IDLE;
                end

                next_state = GENERATE_BIT_1;

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