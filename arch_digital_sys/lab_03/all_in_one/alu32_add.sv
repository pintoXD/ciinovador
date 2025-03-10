`timescale 1ns/1ps
module alu32_add(
    input logic [31:0] SrcA, SrcB,
    output logic [31:0] ALUResult
);

    assign ALUResult = SrcA + SrcB;

endmodule
