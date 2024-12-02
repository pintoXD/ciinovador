`timescale 1ns/1ps
module register32_bank(
    input logic clk, rst, we3,
    input logic [4:0]wa3, //Write address. Is an andress of 8-bit word (0 to 255). But for now, only from 0 to 31 is accepted. 
    input logic [4:0]ra1, ra2, //Read address. Is an andress of 8-bit word (0 to 255). But for now, only from 0 to 31 is accepted.
    input logic [31:0]wd3, //Input for a 32-bit word
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

always_ff @(posedge clk) begin
    if(~rst) begin
        /*
            This If-Else block is exectuted whenever the rst signal is put the LOW state.
            The X32_in_word is filled with 0's. 
            As this array is also the input of the instantiated register8 modules, its values are reseted as well.
        */
            int indexer;
            for(indexer = 0; indexer < 32; indexer = indexer + 1) begin
                X32_in_word[indexer] <= 32'h0;
            end
    end
     
    else if(we3 && wa3 != 5'h00) begin
        X32_in_word[wa3] <= wd3;
    end
end


always_comb 
begin
    rd1 = X32_out_word[ra1];
    rd2 = X32_out_word[ra2];
end



endmodule