`timescale 1us/1ns
module BIT_GENERATOR(
    input logic osc_clk, rst,
    input logic input_bit,
    input logic [2:0] bit_type,
    output logic output_signal
);


logic [4:0] pulse_counter;

always_ff @(osc_clk) begin : BIT_MANAGEMENT
     
    if(~rst)begin
        pulse_counter <= 0;
        output_signal <= 0;    
    end else begin
        if(pulse_counter < 4)begin
            output_signal <= 1;    
        end else if (pulse_counter > 15 && pulse_counter < 20) begin
            output_signal <= 1;    
        end else begin
            output_signal <= 0;
        end

        pulse_counter <= pulse_counter + 1;

    end





end



endmodule