`timescale 1us/1ns
module control(
    input logic [5:0] ctrl_Funct_Field, ctrl_opcode,
    input logic ctrl_Zero,
    output logic ctrl_MemtoReg, ctrl_MemWrite,
    output logic ctrl_PCSrc, ctrl_ALUSrc,
    output logic ctrl_RegDst, ctrl_RegWrite,
    output logic ctrl_Jump,
    output logic [2:0] ctrl_ALUcontrol_output
);

    logic [1:0] ctrl_ALUOp;
    logic branch;

    main_decoder main_decoder_inst(
    .opcode(ctrl_opcode),
    .MemtoReg(ctrl_MemtoReg),
    .MemWrite(ctrl_MemWrite),
    .Branch(ctrl_Branch),
    .ALUSrc(ctrl_ALUSrc),
    .RegDst(ctrl_RegDst),
    .RegWrite(ctrl_RegWrite),
    .Jump(ctrl_Jump),
    .ALUOp(ctrl_ALUOp)
    // .MemRead(ctrl_MemRead),
    );

    ALU_decoder ALU_decoder_inst(
        .Funct_Field(ctrl_Funct_Field),
        .ALUop(ctrl_ALUOp),
        .ALUcontrol_output(ctrl_ALUcontrol_output)
    );

    assign ctrl_PCSrc = branch & ctrl_Zero;

endmodule
