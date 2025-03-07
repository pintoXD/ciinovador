module control(
    input logic [5:0] ctrl_Funct_Field,
    input logic [5:0] ctrl_opcode,
    output logic ctrl_RegDst,
    output logic ctrl_ALUSrc,
    output logic ctrl_MemtoReg,
    output logic ctrl_RegWrite,
    output logic ctrl_MemRead,
    output logic ctrl_MemWrite,
    output logic ctrl_Branch,
    output logic ctrl_ALUOp1,
    output logic ctrl_ALUOp0,
    output logic [3:0] ctrl_ALUcontrol_output
);


    main_control main_control_inst(
    .opcode(ctrl_opcode),
    .RegDst(ctrl_RegDst),
    .ALUSrc(ctrl_ALUSrc),
    .MemtoReg(ctrl_MemtoReg),
    .RegWrite(ctrl_RegWrite),
    .MemRead(ctrl_MemRead),
    .MemWrite(ctrl_MemWrite),
    .Branch(ctrl_Branch),
    .ALUOp1(ctrl_ALUOp1),
    .ALUOp0(ctrl_ALUOp0)
    );

    ALU_control ALU_control_inst(
        .ALUop(ctrl_ALUop),
        .Funct_Field(ctrl_Funct_Field),
        .ALUcontrol_output(ctrl_ALUcontrol_output)
    );


endmodule