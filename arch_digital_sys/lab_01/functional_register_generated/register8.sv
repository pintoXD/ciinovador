`timescale 1ns/1ps
module register8(
    input logic clk, reset,
    input logic [7:0]in_word,
    output logic [7:0]out_word
);

always_ff@(posedge clk)begin
    if (~reset)
        begin
            out_word <= 8'b0;
        end
    else
        begin
            out_word <= in_word;
        end
end

endmodule
