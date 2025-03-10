`timescale 1ns/1ps
module program_counter(
    input logic clk, rst,
    input logic [31:0] in_word,
    input logic [31:0] out_word
);

always_ff @( posedge clk, posedge rst ) begin : blockName
    if (rst) begin
        out_word <= 32'b0;
    end else begin
        out_word <= in_word;
    end
end

endmodule
