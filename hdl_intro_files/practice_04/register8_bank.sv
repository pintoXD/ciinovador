`timescale 1ns/1ps
module register8_bank(
    input logic clk, rst, we3,
    input logic [2:0]wa3,
    input logic [2:0]ra1, ra2,
    input logic [7:0]wd3,
    output logic [7:0] rd1, rd2

);

logic [7:0]X_in_word [7:0]; // Eight 8-bit arrays in a UNPACKED way a.k.a not in a contiguous interval of memory;
logic [7:0]X_out_word [7:0]; // Eight 8-bit arrays in a UNPACKED way a.k.a not in a contiguous interval of memory;


/*
    The following generate block creates 8 instances of the register8 module.
    Its input are the X_in_word unpacked array and its output is the X_out_word unpacked array.
*/
genvar i;
generate
    for(i=0; i<8; i=i+1) begin
        // In the following step we are creating an instance of the register8 module.
        // This register8 is being addressed according to the index i. So if i = 2, the address of register X2 will be 2 or 3'b010.
        register8 X(.clk(clk), .reset(1'b1), .in_word(X_in_word[i]), .out_word(X_out_word[i]));
    end
endgenerate

always_ff @(posedge clk) begin
    if(~rst) begin
        /*
            This If-Else block is exectuted whenever the rst signal is put the LOW state.
            The X_in_word is filled with 0's. 
            As this array is also the input of the instantiated register8 modules, its values are reseted as well.
        */
            int ind;
            for(ind=0; ind<8; ind=ind+1) begin
                X_in_word[ind] <= 8'b0;
            end
    end
     
    else if(we3) begin
        /*

            We have 8 register8 modules instantiated.
            To save a word in one of this instances, we use the X_in_word array.
            Each element of this array represents the input of a register8 instance. 
            As wa3 goes from 3'b000 to 3'b111, it means that wa3 assumes the decimal values from 0 to 7.
            This means that using wa3 as an index of the X_in_word array it's the same as using a decimal 
            number from 0 to 7 as an index.
        
        */
        X_in_word[wa3] <= wd3;
    end
end


always_comb 
begin
    rd1 = X_out_word[ra1];
    rd2 = X_out_word[ra2];
end



endmodule
