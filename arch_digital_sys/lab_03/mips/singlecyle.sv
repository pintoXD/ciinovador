module singlecycle(
    input logic clk, reset,
    output logic [31:0] SC_ProgramCounter,
    input logic [31:0] SC_Instruction_Word,
    output logic SC_MemWrite,
    output logic [31:0] SC_ALUResult,
    output logic [31:0] SC_WriteData
    input logic [31:0] SC_ReadData,


);


logic aux_MemToReg, aux_PCSrc, aux_ALUSrc, aux_RegDst, aux_RegWrite;
logic aux_MemWrite, aux_Jump, aux_Zero;
logic [2:0] aux_ALUControl;

control ControlUnit(
    .ctrl_opcode(SC_Instruction_Word[31:26]),
    .ctrl_Funct_Field(SC_Instruction_Word[5:0]), 
    .ctrl_Zero(aux_Zero),
    .ctrl_MemtoReg(aux_MemToReg), 
    .ctrl_MemWrite(aux_MemWrite),
    .ctrl_PCSrc(aux_PCSrc), 
    .ctrl_ALUSrc(aux_ALUSrc),
    .ctrl_RegDst(aux_RegDst), 
    .ctrl_RegWrite(aux_RegWrite),
    .ctrl_Jump(aux_Jump),
    .ctrl_ALUcontrol_output(aux_ALUControl)
);

datapath DatapathUnit(
    .clk(clk),
    .reset(reset),
    .DP_MemtoReg(aux_MemToReg),
    .DP_PCSrc(aux_PCSrc),
    .DP_ALUSrc(aux_ALUSrc),
    .DP_RegDst(aux_RegDst),
    .DP_RegWrite(aux_RegWrite),
    .DP_Jump(aux_Jump),
    .DP_ALUControl(aux_ALUControl),
    .DP_InstructionWord(SC_Instruction_Word),
    .DP_ReadData(SC_ReadData),
    .DP_Zero(aux_Zero),
    .DP_ProgramCounter(SC_ProgramCounter)
    .DP_ALUResult(SC_ALUResult),
    .DP_WriteData(SC_WriteData)
);



endmodule