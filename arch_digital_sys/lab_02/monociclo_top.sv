module monociclo_top (
);
    
    logic [31:0] mips_instruction;
    logic [5:0] ctrl_Funct_Field;
    logic [5:0] ctrl_opcode;
    logic ctrl_RegDst;
    logic ctrl_ALUSrc;
    logic ctrl_MemtoReg;
    logic ctrl_RegWrite;
    logic ctrl_MemRead;
    logic ctrl_MemWrite;
    logic ctrl_Branch;
    logic ctrl_ALUOp1;
    logic ctrl_ALUOp0;
    logic [3:0] ctrl_ALUcontrol_output;

    control control_inst(
        .ctrl_Funct_Field(ctrl_Funct_Field),
        .ctrl_opcode(ctrl_opcode),
        .ctrl_RegDst(ctrl_RegDst),
        .ctrl_ALUSrc(ctrl_ALUSrc),
        .ctrl_MemtoReg(ctrl_MemtoReg),
        .ctrl_RegWrite(ctrl_RegWrite),
        .ctrl_MemRead(ctrl_MemRead),
        .ctrl_MemWrite(ctrl_MemWrite),
        .ctrl_Branch(ctrl_Branch),
        .ctrl_ALUOp1(ctrl_ALUOp1),
        .ctrl_ALUOp0(ctrl_ALUOp0),
        .ctrl_ALUcontrol_output(ctrl_ALUcontrol_output)
    );


endmodule