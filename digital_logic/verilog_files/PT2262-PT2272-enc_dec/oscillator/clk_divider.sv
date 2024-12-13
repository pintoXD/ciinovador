
`timescale 1us/1ns
//Implementing a D-type Flip-Flop to be used as a clock/frequency divider
module CLK_DIVIDER_BY_2(
    input logic clk, rst,
    input logic D,
    output logic clk_divided,
    output logic Q

);


    always_ff @(posedge clk, posedge rst) begin : DIV_FF
        if(~rst) begin
            Q <= 1'b0;
        end
        else begin
            Q <= D;
        end
    end

endmodule