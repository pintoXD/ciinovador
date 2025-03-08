`timescale 1us/1ns
module control_tb (
);
    logic [5:0] mock_ctrl_Funct_Field;
    logic [5:0] mock_opcode;
    logic OUT_ctrl_RegDst;
    logic OUT_ctrl_ALUSrc;
    logic OUT_ctrl_MemtoReg;
    logic OUT_ctrl_RegWrite;
    logic OUT_ctrl_MemRead;
    logic OUT_ctrl_MemWrite;
    logic OUT_ctrl_Branch;
    logic [1:0] OUT_ctrl_ALUOp;
    logic [3:0] OUT_ctrl_ALUcontrol_output;

control DUT(
    .ctrl_Funct_Field(mock_ctrl_Funct_Field),
    .ctrl_opcode(mock_opcode),
    .ctrl_RegDst(OUT_ctrl_RegDst),
    .ctrl_ALUSrc(OUT_ctrl_ALUSrc),
    .ctrl_MemtoReg(OUT_ctrl_MemtoReg),
    .ctrl_RegWrite(OUT_ctrl_RegWrite),
    .ctrl_MemRead(OUT_ctrl_MemRead),
    .ctrl_MemWrite(OUT_ctrl_MemWrite),
    .ctrl_Branch(OUT_ctrl_Branch),
    .ctrl_ALUOp(OUT_ctrl_ALUOp),
    .ctrl_ALUcontrol_output(OUT_ctrl_ALUcontrol_output)
);

function void display_output();
    $display("OUT_ctrl_RegDst = %0b", OUT_ctrl_RegDst);
    $display("OUT_ctrl_ALUSrc = %0b", OUT_ctrl_ALUSrc);
    $display("OUT_ctrl_MemtoReg = %0b", OUT_ctrl_MemtoReg);
    $display("OUT_ctrl_RegWrite = %0b", OUT_ctrl_RegWrite);
    $display("OUT_ctrl_MemRead = %0b", OUT_ctrl_MemRead);
    $display("OUT_ctrl_MemWrite = %0b", OUT_ctrl_MemWrite);
    $display("OUT_ctrl_Branch = %0b", OUT_ctrl_Branch);
    $display("OUT_ctrl_ALUOp = %0b", OUT_ctrl_ALUOp);
    $display("OUT_ctrl_ALUcontrol_output = %0b", OUT_ctrl_ALUcontrol_output);
endfunction

initial begin
    #10;

    mock_ctrl_Funct_Field = 6'b100000;
    mock_opcode = 6'b000000;
    #1;
    $display("Trying ADD instruction");
    $display("Test 1: Inputing opcode 6'b%0b and Funct_Field 6'b%0b", mock_opcode, mock_ctrl_Funct_Field);
    // $display("Expected output: RegDst = 1, ALUSrc = 0, MemtoReg = 0, RegWrite = 1, MemRead = 0, MemWrite = 0, Branch = 0, ALUOp = 01, ALUcontrol_output = 0010");
    #10;
    display_output();
    #10;

    mock_ctrl_Funct_Field = 6'b100010;
    mock_opcode = 6'b000000;
    #1;
    $display("Trying SUB instruction");
    $display("Test 2: Inputing opcode 6'b%0b and Funct_Field 6'b%0b", mock_opcode, mock_ctrl_Funct_Field);
    #10;
    display_output();
    #10;

    mock_ctrl_Funct_Field = 6'b000000;
    mock_opcode = 6'b100011;
    #1;
    $display("Trying LW instruction");
    $display("Test 3: Inputing opcode 6'b%0b and Funct_Field 6'b%0b", mock_opcode, mock_ctrl_Funct_Field);
    #10;
    display_output();
    #10;

    mock_ctrl_Funct_Field = 6'b000000;
    mock_opcode = 6'b101011;
    #1;
    $display("Trying SW instruction");
    $display("Test 4: Inputing opcode 6'b%0b and Funct_Field 6'b%0b", mock_opcode, mock_ctrl_Funct_Field);
    #10;
    display_output();
    #10;

    mock_ctrl_Funct_Field = 6'b000000;
    mock_opcode = 6'b000100;
    #1;
    $display("Trying BEQ instruction");
    $display("Test 5: Inputing opcode 6'b%0b and Funct_Field 6'b%0b", mock_opcode, mock_ctrl_Funct_Field);
    #10;
    display_output();
    #10;
    
end



endmodule
