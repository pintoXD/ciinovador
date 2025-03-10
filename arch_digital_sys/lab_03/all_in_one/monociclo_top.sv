/* verilator lint_off UNUSEDSIGNAL */
`timescale 1ns/1ps
module monociclo_top(
    input logic clk, reset,
    output logic [31:0] TOP_WriteData, TOP_DataAddr,
    output logic TOP_MemWrite
);

logic [31:0] aux_PC, aux_Instruction_Word, aux_ReadData;

singlecycle mips(
    .clk(clk),
    .reset(reset),
    .SC_ProgramCounter(aux_PC),
    .SC_Instruction_Word(aux_Instruction_Word),
    .SC_MemWrite(TOP_MemWrite),
    .SC_ALUResult(TOP_DataAddr),
    .SC_WriteData(TOP_WriteData),
    .SC_ReadData(aux_ReadData)
);

instr_memory instr_mem(
    .addr(aux_PC[7:2]),
    .instr(aux_Instruction_Word)
);

data_memory data_mem(
    .clk(clk),
    .we(TOP_MemWrite),
    .addr(TOP_DataAddr),
    .data_in(TOP_WriteData),
    .data_out(aux_ReadData)
);


endmodule
