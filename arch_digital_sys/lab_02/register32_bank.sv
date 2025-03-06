`timescale 1ns/1ps
module register32_bank(
    input logic clk, rst, we5,
    input logic [4:0]wa5, 
    input logic [4:0]ra1, ra2,
    input logic [31:0]wd32, //Input for a 32-bit word
    output logic [31:0] rd1, rd2 //Output for 32-bit words

);

logic [31:0]X32_in_word [31:0]; // Thirty two 32-bit arrays in a UNPACKED way a.k.a not in a contiguous interval of memory;
logic [31:0]X32_out_word [31:0]; // Thirty two 32-bit arrays in a UNPACKED way a.k.a not in a contiguous interval of memory;

/*
    The following generate block creates 32 instances of the register32 module.
    Its input are the X32_in_word unpacked array and its output is the X32_out_word unpacked array.
*/
genvar i;
generate
    for(i=0; i<32; i=i+1) begin
        // In the following step we are creating an instance of the register32 module.
        // This register32 is being addressed according to the index i. So if i = 2, the address of register X2 will be 2 or 8'h2.
        register32 X(.clk(clk), .reset(1'b1), .in_word(X32_in_word[i]), .out_word(X32_out_word[i]));
    end
endgenerate

endmodule