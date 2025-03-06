`timescale 1us/1ns
module main_control_tb ();
    logic [5:0] mocked_opcode;
    logic dut_RegDst;
    logic dut_ALUSrc;
    logic dut_MemtoReg;
    logic dut_RegWrite;
    logic dut_MemRead;
    logic dut_MemWrite;
    logic dut_Branch;
    logic dut_ALUOp1;
    logic dut_ALUOp0;


    main_control DUT(
        .opcode(mocked_opcode),
        .RegDst(dut_RegDst),
        .ALUSrc(dut_ALUSrc),
        .MemtoReg(dut_MemtoReg),
        .RegWrite(dut_RegWrite),
        .MemRead(dut_MemRead),
        .MemWrite(dut_MemWrite),
        .Branch(dut_Branch),
        .ALUOp1(dut_ALUOp1),
        .ALUOp0(dut_ALUOp0)
    );



    initial begin
        #10;
        mocked_opcode = 6'b000000;
        #10;
        assert (             
            dut_RegDst == 1 && 
            dut_ALUSrc == 0 && 
            dut_MemtoReg == 0 && 
            dut_RegWrite == 1 && 
            dut_MemRead == 0 && 
            dut_MemWrite == 0 && 
            dut_Branch == 0 && 
            dut_ALUOp1 == 1 && 
            dut_ALUOp0 == 0)
        else   
            $fatal(1, "The given opcode did not compute the expected output.");
        
        #100;

        mocked_opcode = 6'b100011;
        #10;
        assert (             
            dut_RegDst == 0 && 
            dut_ALUSrc == 1 && 
            dut_MemtoReg == 1 && 
            dut_RegWrite == 1 && 
            dut_MemRead == 1 && 
            dut_MemWrite == 0 && 
            dut_Branch == 0 && 
            dut_ALUOp1 == 0 && 
            dut_ALUOp0 == 0)
        else   
            $fatal(1, "The given opcode did not compute the expected output.");

        #100;

        mocked_opcode = 6'b101011;
        #10;
        assert (             
            dut_RegDst === 1'bx && 
            dut_ALUSrc == 1 && 
            dut_MemtoReg === 1'bx && 
            dut_RegWrite == 0 && 
            dut_MemRead == 0 && 
            dut_MemWrite == 1 && 
            dut_Branch == 0 && 
            dut_ALUOp1 == 0 && 
            dut_ALUOp0 == 0)
        else   
            $fatal(1, "The given opcode did not compute the expected output.");
        
        #100;

        mocked_opcode = 6'b000100;
        #10;
        assert (             
            dut_RegDst === 1'bx && 
            dut_ALUSrc == 1 && 
            dut_MemtoReg === 1'bx && 
            dut_RegWrite == 0 && 
            dut_MemRead == 0 && 
            dut_MemWrite == 0 && 
            dut_Branch == 1 && 
            dut_ALUOp1 == 0 && 
            dut_ALUOp0 == 1)
        else   
            $fatal(1, "The given opcode did not compute the expected output.");


        #100;

        mocked_opcode = 6'b111111;
        #10;
        assert (             
            dut_RegDst == 1 && 
            dut_ALUSrc == 0 && 
            dut_MemtoReg == 0 && 
            dut_RegWrite == 1 && 
            dut_MemRead == 0 && 
            dut_MemWrite == 0 && 
            dut_Branch == 0 && 
            dut_ALUOp1 == 1 && 
            dut_ALUOp0 == 0)
        else   
            $fatal(1, "The given opcode did not compute the expected output.");

        #300;

    end



endmodule