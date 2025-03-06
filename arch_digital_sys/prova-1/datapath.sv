module datapath(
    input logic datapath_RegDst, //####
    input logic datapath_ALUSrc,
    input logic datapath_MemtoReg,
    input logic datapath_RegWrite,
    input logic datapath_MemRead,
    input logic datapath_MemWrite,
    input logic datapath_Branch,
    input logic datapath_ALUOp1,
    input logic datapath_ALUOp0,
    input logic [3:0] datapath_ALUcontrol_output,
    input logic [31:0] datapath_mips_instruction,
    output logic [5:0] datapath_Funct_Field,
    output logic [5:0] datapath_opcode
);


logic [31:0] PC;
logic mips_instruction
logic [1:0] ula32control = {datapath_ALUOp1, datapath_ALUOp0};
logic regbank_wa5;

always_comb begin :
    if(RegDst)
        regbank_wa5 = datapath_mips_instruction[15:11];
    else
        regbank_wa5 = datapath_mips_instruction[20:16];
end



register32_bank reg32_bank_inst(
    .clk(),
    .rst(),
    .we5(datapath_RegWrite), //Write Enable
    .wa5(regbank_wa5), //Write Address
    .ra1(datapath_mips_instruction[25:21]), //Read Register 1
    .ra2(datapath_mips_instruction[20:16]), //Read Register 2
    .wd32(), //Write Data
    .rd1(w_rd1SrcA), //Read Data 1
    .rd2(w_rd2)      //Read Data 2
);


ula32 ula32_inst(
    .SrcA(),
    .SrcB(),
    .ULAControl(ula32control),
    .ULAResult(),
    .FlagZ()
);







endmodule