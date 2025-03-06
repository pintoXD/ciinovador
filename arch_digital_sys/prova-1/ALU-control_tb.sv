`timescale 1us/1ns

module ALU_control_tb();

    logic [1:0] mocked_ALUop;
    logic [5:0] mocked_Funct_Field;
    logic [3:0] dut_ALUcontrol_output;


    ALU_control DUT(
        .ALUop(mocked_ALUop),
        .Funct_Field(mocked_Funct_Field),
        .ALUcontrol_output(dut_ALUcontrol_output)
    );

    initial begin
        #10;
        mocked_ALUop = 2'b00;
        mocked_Funct_Field = 6'b111111;
        #10;
        assert (dut_ALUcontrol_output == 4'b0010) 
        else   $fatal(1, "Given Op %b and Funct_Field %b did not produce the expected output. Output is: %b", mocked_ALUop, mocked_Funct_Field, dut_ALUcontrol_output);

        #100;
        mocked_ALUop = 2'b01;
        mocked_Funct_Field = 6'b111111;
        #10;
        assert (dut_ALUcontrol_output == 4'b0110) 
        else  $fatal(1, "Given Op %b and Funct_Field %b did not produce the expected output. Output is: %b", mocked_ALUop, mocked_Funct_Field, dut_ALUcontrol_output);

        #100;
        mocked_ALUop = 2'b10;
        mocked_Funct_Field = 6'b100000;
        #10;
        assert (dut_ALUcontrol_output == 4'b0010) 
        else  $fatal(1, "Given Op %b and Funct_Field %b did not produce the expected output. Output is: %b", mocked_ALUop, mocked_Funct_Field, dut_ALUcontrol_output);

       #100;
        mocked_ALUop = 2'b10;
        mocked_Funct_Field = 6'b100010;
        #10;
        assert (dut_ALUcontrol_output == 4'b0110) 
        else  $fatal(1, "Given Op %b and Funct_Field %b did not produce the expected output. Output is: %b", mocked_ALUop, mocked_Funct_Field, dut_ALUcontrol_output);
       
       #100;
        mocked_ALUop = 2'b1x;
        mocked_Funct_Field = 6'bxx0000;
        #10;
        assert (dut_ALUcontrol_output == 4'b0010) 
        else  $fatal(1, "Given Op %b and Funct_Field %b did not produce the expected output. Output is: %b", mocked_ALUop, mocked_Funct_Field, dut_ALUcontrol_output);
       
       #100;
        mocked_ALUop = 2'b1x;
        mocked_Funct_Field = 6'bxx0010;
        #10;
        assert (dut_ALUcontrol_output == 4'b0110) 
        else  $fatal(1, "Given Op %b and Funct_Field %b did not produce the expected output. Output is: %b", mocked_ALUop, mocked_Funct_Field, dut_ALUcontrol_output);
       
       #100;
        mocked_ALUop = 2'bx1;
        mocked_Funct_Field = 6'bxxxxxx;
        #10;
        assert (dut_ALUcontrol_output == 4'b0010) 
        else  $fatal(1, "Given Op %b and Funct_Field %b did not produce the expected output. Output is: %b", mocked_ALUop, mocked_Funct_Field, dut_ALUcontrol_output);


        #300;

    end


endmodule