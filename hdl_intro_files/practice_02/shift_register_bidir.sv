`timescale 1ns/1ps

module shift_register_bidir ( 
    input logic clk, reset_n, load_shift, right_left, 
    input logic [3:0] data_in, 
    output logic[3:0] q_out
    );
always_ff @ (posedge clk or negedge reset_n)
    begin
        if ( ~reset_n)
            q_out <= '0;//equivalent to 4’b0000
        else if (load_shift)
            q_out <= data_in;
        else if (right_left)
            q_out <= (data_in >> 1);
        else
            q_out <= (data_in << 1);
    end
endmodule
