/* verilator lint_off UNUSEDSIGNAL */
`timescale 1ns/1ps
module leftshift2(
    input logic [31:0] SrcA, 
    output logic [31:0] ALUResult
);

    assign ALUResult = {SrcA[29:0], 2'b00};
endmodule
