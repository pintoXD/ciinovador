`timescale 1ns/1ps
module register32_bank(
    input logic clk, 
    input logic we5,
    input logic [4:0]wa5, 
    input logic [4:0]ra1, ra2,
    input logic [31:0]wd32, //Input for a 32-bit word
    output logic [31:0] rd1, rd2 //Output for 32-bit words

);

logic [31:0] reg_bank[31:0];

always_ff @(clk) begin
    if (we5) begin
        reg_bank[wa5] <= wd32;
    end

end

always_comb begin
    //This if block is necessary to comply with the requirement
    //that no word is written on address 0, and this address is already
    //loaded with 0 value.
    if(ra1 != 0) begin
        rd1 = reg_bank[ra1];
    end else begin
        rd1 = 32'b0;
    end


    if(ra2 != 0) begin
        rd2 = reg_bank[ra2];
    end else begin
        rd2 = 32'b0;
    end
end



endmodule