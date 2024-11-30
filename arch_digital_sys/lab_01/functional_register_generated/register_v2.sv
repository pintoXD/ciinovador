/* verilator lint_off DECLFILENAME */
`timescale 1ns/1ps
module register8_bank_v2(
    input logic clk, rst, we3,
    input logic [2:0]wa3,
    input logic [2:0]ra1, ra2,
    input logic [7:0]wd3,
    output logic [7:0] rd1, rd2

);

logic [7:0]X_in_word [7:0]; // Eight 8-bit arrays in a UNPACKED way a.k.a not in a contiguous interval of memory;
logic [7:0]X_out_word [7:0]; // Eight 8-bit arrays in a UNPACKED way a.k.a not in a contiguous interval of memory;

genvar i;
generate
    for(i=0; i<8; i=i+1) begin
        register8 X(.clk(clk), .reset(1'b1), .in_word(X_in_word[i]), .out_word(X_out_word[i]));
    end
endgenerate

always_ff @(posedge clk) begin
    if(~rst) begin
            int ind;
            for(ind=0; ind<8; ind=ind+1) begin
                X_in_word[ind] <= 8'b0;
            end
    end
     
    else if(we3) begin
        X_in_word[wa3] <= wd3;
    end
end


always_comb 
begin
    rd1 = X_out_word[ra1];
    rd2 = X_out_word[ra2];
end



endmodule
