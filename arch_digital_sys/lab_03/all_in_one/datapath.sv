`timescale 1ns/1ps
module datapath(
    input logic clk, reset,
    input logic DP_MemToReg, DP_PCSrc,
    input logic DP_ALUSrc, DP_RegDst,
    input logic DP_RegWrite, DP_Jump,
    input logic [2:0] DP_ALUControl,
    input logic [31:0] DP_Instruction_Word,
    input logic [31:0] DP_ReadData,

    output logic DP_Zero,
    output logic [31:0] DP_ProgramCounter,
    output logic [31:0] DP_ALUResult,
    output logic [31:0] DP_WriteData
);

logic [4:0] aux_WriteReg;
logic [31:0] aux_ProgramCounter_Next;
logic [31:0] aux_ProgramCounter_Next_Branch;
logic [31:0] aux_ProgramCounter_FourAdded;
logic [31:0] aux_ProgramCounter_Branch;
logic [31:0] SrcA, SrcB, Result, SignImm, SignImmShifted;


/*
*
* Here begins the logic behind the Program Counter values updating
*
*/

program_counter PC_Inst(
    .clk(clk),
    .rst(reset),
    .in_word(aux_ProgramCounter_Next),
    .out_word(DP_ProgramCounter)
);

alu32_add PC_Inst_Add_Four(
    .SrcA(DP_ProgramCounter),
    .SrcB(32'b100),
    .ALUResult(aux_ProgramCounter_FourAdded)
);

//Gets the given immediate and extend it from 16 to 32 bits
sign_extend SignExtender(
    .in_word(DP_Instruction_Word[15:0]),
    .out_word(SignImm)
);


//This block divides the immediate value by 4
leftshift2 Immediate_Shifter(
    .SrcA(SignImm),
    .ALUResult(SignImmShifted)
);

alu32_add PC_Inst_Add_Branch(
    .SrcA(aux_ProgramCounter_FourAdded),
    .SrcB(SignImmShifted),
    .ALUResult(aux_ProgramCounter_Branch)
);

// Handles PC updating without considering J_type instructions
mux2to1_32bit PC_BranchMux(
    .Select(DP_PCSrc),
    .Data0(aux_ProgramCounter_FourAdded),
    .Data1(aux_ProgramCounter_Branch),
    .DataOut(aux_ProgramCounter_Next_Branch)
);

mux2to1_32bit PC_Mux(
    .Select(DP_Jump),
    .Data0(aux_ProgramCounter_Next_Branch),
    .Data1({aux_ProgramCounter_FourAdded[31:28], DP_Instruction_Word[25:0], 2'b00}),
    .DataOut(aux_ProgramCounter_Next)
);


/*
*
* Here begins the logic behind the management of registers values
*
*/

register32_bank Register_Bank(
    .clk(clk),
    .we5(DP_RegWrite),
    .ra1(DP_Instruction_Word[25:21]),
    .ra2(DP_Instruction_Word[20:16]),
    .wa5(aux_WriteReg),
    .wd32(Result), //The result between the ALU output or the memory output
    .rd1(SrcA),
    .rd2(DP_WriteData)
);

//Mux that determines wich destiny register will be used
mux2to1_5bit WriteRegMux(
    .Select(DP_RegDst),
    .Data0(DP_Instruction_Word[20:16]),
    .Data1(DP_Instruction_Word[15:11]),
    .DataOut(aux_WriteReg)
);


mux2to1_32bit ResultMux(
    .Select(DP_MemToReg),
    .Data0(DP_ALUResult), // If 0, gets data from alu out
    .Data1(DP_ReadData), // If 1, gets data from memory
    .DataOut(Result)
);


/*
*
* Here begins the logic behind the ALU operations
*
*/

mux2to1_32bit ALU_SrcBMux(
    .Select(DP_ALUSrc),
    .Data0(DP_WriteData),
    .Data1(SignImm),
    .DataOut(SrcB)
);

alu32 ALU(
    .SrcA(SrcA),
    .SrcB(SrcB),
    .ALUControl(DP_ALUControl),
    .ALUResult(DP_ALUResult),
    .FlagZ(DP_Zero)
);



endmodule
