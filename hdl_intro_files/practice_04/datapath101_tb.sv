`timescale 1ns/1ps
module datapath101_tb();

    logic [2:0] mocked_ra1 = 3'b000;
    logic [2:0] mocked_ra2 = 3'b000;
    logic[2:0] mocked_wa3 = 3'b000;
    logic mocked_we3 = 1'b0;
    logic [7:0] mocked_wd3 = 'b0;
    logic [7:0] mock_constante = 'b0;
    logic [2:0] mock_ULAControl = 3'b000;
    logic mock_select_src = 1'b0;

    logic test_clk, test_reset;
    logic [7:0] dut_ULAResult;
    logic dut_FlagZ;
    
    datapath101 DUT(
        .ra1(mocked_ra1),
        .ra2(mocked_ra2),
        .wa3(mocked_wa3),
        .we3(mocked_we3),
        .wd3(mocked_wd3),
        .constante(mock_constante),
        .ULAControl(mock_ULAControl),
        .select_src(mock_select_src),

        .clk(test_clk),
        .rst(test_reset),
        
        .ULAResult(dut_ULAResult),
        .FlagZ(dut_FlagZ)
    );

    initial begin
        test_clk = 1'b0;
        forever begin
            #5 test_clk = ~test_clk;
        end
    end

    initial begin
        $dumpfile("datapath101_tb.vcd");
        $dumpvars(0, datapath101_tb);

        @(posedge test_clk);
        test_reset = 1'b0;
        #10 
        test_reset = 1'b1;
        #10

        //Test Case 0
        assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1 && DUT.w_rd1SrcA == 8'b0) else $fatal(0, "Test Case 0 failed");
        #10


        /* 
             Set #1 of tests: Writing on registers
                Test Cases 1 to 9 covers the writing process on each of the registers, X1 to X7, present on the register bank. 
                Some tests to cover the writing withtou premission cases were also created. 
                Further tests should be presented on the next sets test cases.
        */


        //Test Case 1 - Write to register X1
        @(posedge test_clk);
        mocked_we3 = 1'b1;
        mocked_wd3 = 8'h5A;
        mocked_wa3 = 3'b001; //==> Register X1
        #30
        mocked_we3 = 1'b0;
        assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal(1, "Test Case 1 failed");

        
        //Test Case 2 - Write to register X2
        @(posedge test_clk);
        mocked_we3 = 1'b1;
        mocked_wd3 = 8'h5B;
        mocked_wa3 = 3'b010;   //==> Register X2
        #20
        mocked_we3 = 1'b0;
        assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal(2, "Test Case 2 failed");

        //Test Case 3 - Write to register X3.
        @(posedge test_clk);
        mocked_we3 = 1'b1;
        mocked_wd3 = 8'h5C;
        mocked_wa3 = 3'b011; //==> Register X3
        #20
        mocked_we3 = 1'b0;
        assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal(3, "Test Case 3 failed");
        
        //Test Case 4 - Write to register X4 with rd1 unchanged from the previous test case.
        @(posedge test_clk);
        mocked_we3 = 1'b1;
        mocked_wd3 = 8'h5D;
        mocked_wa3 = 3'b100; //==> Register X4
        #20
        mocked_we3 = 1'b0;
        assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal(4, "Test Case 4 failed");

        //Test Case 5 - Write to register X5.
        @(posedge test_clk);
        mocked_we3 = 1'b1;
        mocked_wd3 = 8'h5E;
        mocked_wa3 = 3'b101; //==> Register X5
        #20
        mocked_we3 = 1'b0;
        assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal(5, "Test Case 5 failed");

        //Test Case 6 - Write to register X6.
        @(posedge test_clk);
        mocked_we3 = 1'b1;
        mocked_wd3 = 8'h5F;
        mocked_wa3 = 3'b110; //==> Register X6
        #20
        mocked_we3 = 1'b0;
        assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal(6, "Test Case 6 failed");

        //Test Case 6 - Write to register X7.
        @(posedge test_clk);
        mocked_we3 = 1'b1;
        mocked_wd3 = 8'h50;
        mocked_wa3 = 3'b111; //==> Register X7
        #20
        mocked_we3 = 1'b0;
        assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal(6, "Test Case 6 failed");

        

        /*
            Set #2: Adding two numbers previously stored on registers.
                This set of test cases aims to verify the correctness of the addition
                arithmetic operation between two numbers previously stored on the register bank.
        */
        
        //Test Case 7 - Reading and adding the values from registers X1 and X2
        @(posedge test_clk);
        mocked_ra1 = 3'b001; //==> Register X1
        mocked_ra2 = 3'b010; //==> Register X2
        mock_select_src = 1'b0;
        mock_ULAControl = 3'b000; //==> Addition operation
        $display("HERE: ", $time);
        #30
        assert(dut_ULAResult == 8'hB5 && dut_FlagZ == 1'b0) else $fatal(7, "Test Case 7 failed ", $time);

        //Test Case 8 - Reading and adding the values from registers X3 and X4
        @(posedge test_clk);
        mocked_ra1 = 3'b011; //==> Register X3
        mocked_ra2 = 3'b100; //==> Register X4
        mock_select_src = 1'b0;
        mock_ULAControl = 3'b000; //==> Addition operation
        #10
        assert(dut_ULAResult == 8'hB9 && dut_FlagZ == 1'b0) else $fatal(8, "Test Case 8 failed");

        //Test Case 9 - Reading and adding the values from registers X5 and X6
        @(posedge test_clk);
        mocked_ra1 = 3'b101; //==> Register X5
        mocked_ra2 = 3'b110; //==> Register X6
        mock_select_src = 1'b0;
        mock_ULAControl = 3'b000; //==> Addition operation
        #10
        assert(dut_ULAResult == 8'hBD && dut_FlagZ == 1'b0) else $fatal(9, "Test Case 9 failed");

        //Test Case 10 - Reading and adding the values from registers X7 and X0
        @(posedge test_clk);
        mocked_ra1 = 3'b111; //==> Register X7
        mocked_ra2 = 3'b000; //==> Register X0
        mock_select_src = 1'b0;
        mock_ULAControl = 3'b000; //==> Addition operation
        #10
        assert(dut_ULAResult == 8'h50 && dut_FlagZ == 1'b0) else $fatal(10, "Test Case 10 failed");

        //Test Case 11 - Reading and adding the values from registers X7 and variable constante
        @(posedge test_clk);
        mocked_ra1 = 3'b111; //==> Register X7
        mock_constante = 8'hAF; //==> Constant value
        mock_select_src = 1'b1; //==> Selecting the constant value
        mock_ULAControl = 3'b000; //==> Addition operation
        #10
        assert(dut_ULAResult == 8'hFF && dut_FlagZ == 1'b0) else $fatal(11, "Test Case 11 failed");

        /* 
            Set#3: Subtraction between two numbers previously stored on registers.
                This set of test cases aims to verify the correctness of the subtraction
                arithmetic operation between two numbers previously stored on the register bank.
        */

        //Test Case 12 - Reading and subtracting the values from registers X3 and X1 where X1 < X3
        @(posedge test_clk);
        mocked_ra1 = 3'b011; //==> Register X3
        mocked_ra2 = 3'b001; //==> Register X1
        mock_select_src = 1'b0;
        mock_ULAControl = 3'b001; //==> Subtraction operation
        #10
        assert(dut_ULAResult == 8'h02 && dut_FlagZ == 1'b0) else $fatal(12, "Test Case 12 failed");

        //Test Case 13 - Reading and subtracting the values from registers X1 and X3 where X1 < X3
        @(posedge test_clk);
        mocked_ra1 = 3'b001; //==> Register X1
        mocked_ra2 = 3'b011; //==> Register X3
        mock_select_src = 1'b0;
        mock_ULAControl = 3'b001; //==> Subtraction operation
        #10
        assert(dut_ULAResult == 8'hFE && dut_FlagZ == 1'b0) else $fatal(13, "Test Case 13 failed");

        //Test Case 14 - Reading and subtracting the values from registers X3 and variable constante
        //               where X3 > constante.
        @(posedge test_clk);
        mocked_ra1 = 3'b011; //==> Register X3
        mock_constante = 8'h40; //==> Constant value
        mock_select_src = 1'b1; //==> Selecting the constant value
        mock_ULAControl = 3'b001; //==> Subtraction operation
        #10
        assert(dut_ULAResult == 8'h1C && dut_FlagZ == 1'b0) else $fatal(14, "Test Case 14 failed");

        //Test Case 15 - Reading and subtracting the values from registers X3 and variable constante
        //               where X3 < constante.
        @(posedge test_clk);
        mocked_ra1 = 3'b011; //==> Register X3
        mock_constante = 8'h60; //==> Constant value
        mock_select_src = 1'b1; //==> Selecting the constant value
        mock_ULAControl = 3'b001; //==> Subtraction operation
        #10
        assert(dut_ULAResult == 8'hFC && dut_FlagZ == 1'b0) else $fatal(15, "Test Case 15 failed");


        /* 
            Set#4: Logical AND between two numbers previously stored on registers.
                This set of test cases aims to verify the correctness of the logical AND
                operation between two numbers previously stored on the register bank.
        */

        //Test Case 16 - Reading and ANDing the values from registers X5 and X2
        @(posedge test_clk);
        mocked_ra1 = 3'b101; //==> Register X5
        mocked_ra2 = 3'b010; //==> Register X2
        mock_select_src = 1'b0;
        mock_ULAControl = 3'b010; //==> AND operation
        #10
        assert(dut_ULAResult == 8'h5A && dut_FlagZ == 1'b0) else $fatal(16, "Test Case 16 failed");

        //Test Case 17 - Reading and ANDing the values from registers X0 and X5
        @(posedge test_clk);
        mocked_ra1 = 3'b000; //==> Register X0
        mocked_ra2 = 3'b101; //==> Register X5
        mock_select_src = 1'b0;
        mock_ULAControl = 3'b010; //==> AND operation
        #10
        assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal(17, "Test Case 17 failed");

        //Test Case 18 - Reading and ANDing the values from registers X4 and variable constante
        //               where constante == 0xFF
        @(posedge test_clk);
        mocked_ra1 = 3'b100; //==> Register X4
        mock_select_src = 1'b1; // ==> Select constante value
        mock_constante = 8'hFF; //==> Constant value
        mock_ULAControl = 3'b010; //==> AND operation
        #10
        assert(dut_ULAResult == 8'h5D && dut_FlagZ == 1'b0) else $fatal(18, "Test Case 18 failed");

        //Test Case 19 - Reading and ANDing the values from registers X4 and variable constante
        //               where constante == 0x00
        @(posedge test_clk);
        mocked_ra1 = 3'b100; //==> Register X4
        mock_select_src = 1'b1; // ==> Select constante value
        mock_constante = 8'h00; //==> Constant value
        mock_ULAControl = 3'b010; //==> AND operation
        #10
        assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal(19, "Test Case 19 failed");

        /* 
            Set #5: Logical OR between two numbers previously stored on registers.
                This set of test cases aims to verify the correctness of the logical AND
                operation between two numbers previously stored on the register bank.
        */

        //Test Case 20 - Reading and ORing the values from registers X6 and X2
        @(posedge test_clk);
        mocked_ra1 = 3'b110; //==> Register X6
        mocked_ra2 = 3'b010; //==> Register X2
        mock_select_src = 1'b0;
        mock_ULAControl = 3'b011; //==> OR operation
        #10
        assert(dut_ULAResult == 8'h5F && dut_FlagZ == 1'b0) else $fatal(20, "Test Case 20 failed");

        //Test Case 21 - Reading and ORing the values from registers X1 and X4
        @(posedge test_clk);
        mocked_ra1 = 3'b001; //==> Register X1
        mocked_ra2 = 3'b100; //==> Register X4
        mock_select_src = 1'b0;
        mock_ULAControl = 3'b011; //==> OR operation
        #10
        assert(dut_ULAResult == 8'h5F && dut_FlagZ == 1'b0) else $fatal(21, "Test Case 21 failed");

        //Test Case 22 - Reading and ORing the values from registers X3 and variable constante
        //               where constante == 0xFF
        @(posedge test_clk);
        mocked_ra1 = 3'b011; //==> Register X3
        mock_select_src = 1'b1; // ==> Select constante value
        mock_constante = 8'hFF; //==> Constant value
        mock_ULAControl = 3'b011; //==> OR operation
        #10
        assert(dut_ULAResult == 8'hFF && dut_FlagZ == 1'b0) else $fatal(22, "Test Case 22 failed");

        //Test Case 23 - Reading and ORing the values from registers X6 and variable constante
        //               where constante == 0x00
        @(posedge test_clk);
        mocked_ra1 = 3'b110; //==> Register X6
        mock_select_src = 1'b1; // ==> Select constante value
        mock_constante = 8'h00; //==> Constant value
        mock_ULAControl = 3'b011; //==> OR operation
        #10
        assert(dut_ULAResult == 8'h5F && dut_FlagZ == 1'b0) else $fatal(23, "Test Case 23 failed");

        /* 
            Set #6: Sets less than (SLT) between two numbers previously stored on registers.
                This set of test cases aims to verify the correctness of the SLT
                operation between two numbers previously stored on the register bank.
        */

        //Test Case 24 - Reading and SLT the values from registers X6 and X4
        @(posedge test_clk);
        mocked_ra1 = 3'b110; //==> Register X6
        mocked_ra2 = 3'b100; //==> Register X4
        mock_select_src = 1'b0;
        mock_ULAControl = 3'b101; //==> SLT operation
        #10
        assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal(24, "Test Case 24 failed");

        //Test Case 25 - Reading and SLT the values from registers X4 and X6
        @(posedge test_clk);
        mocked_ra1 = 3'b100; //==> Register X4
        mocked_ra2 = 3'b110; //==> Register X6
        mock_select_src = 1'b0;
        mock_ULAControl = 3'b101; //==> SLT operation
        #10
        assert(dut_ULAResult == 8'hFF && dut_FlagZ == 1'b0) else $fatal(25, "Test Case 25 failed");

        //Test Case 26 - Reading and SLT the values from registers X3 and variable constante
        //               where constante == 0xFF
        @(posedge test_clk);
        mocked_ra1 = 3'b011; //==> Register X3
        mock_select_src = 1'b1; // ==> Select constante value
        mock_constante = 8'hFF; //==> Constant value
        mock_ULAControl = 3'b101; //==> SLT operation
        #10
        assert(dut_ULAResult == 8'hFF && dut_FlagZ == 1'b0) else $fatal(26, "Test Case 26 failed");

        //Test Case 27 - Reading and SLT the values from registers X7 and variable constante
        //               where constante == 0x00
        @(posedge test_clk);
        mocked_ra1 = 3'b111; //==> Register X7
        mock_select_src = 1'b1; // ==> Select constante value
        mock_constante = 8'h00; //==> Constant value
        mock_ULAControl = 3'b101; //==> SLT operation
        #10
        assert(dut_ULAResult == 8'h00 && dut_FlagZ == 1'b1) else $fatal(27, "Test Case 27 failed");

        #10 $finish;
    end

    initial
    begin
      $display("                Tempo               Entradas LUT                                                                                                                            Saídas");
      $display("                         clk  rst  mocked_we3   mocked_wa3   mocked_ra1  mocked_ra2     mocked_wd3   mock_constante    mock_select_src     mock_ULAControl              Result   FlagZ");
      $display("                ====   ====================================================================================================================================   |   ==========================");
      /* $monitor($time,"      %b    %b    %b    %b   %b    %b      %b         %b      %b", test_clk, test_reset, mocked_we3, 
                                                                    mocked_wa3, mocked_ra1, mocked_ra2, mocked_wd3, 
                                                                    rd1, rd2);
 */    end

    always@(posedge test_clk or negedge test_clk)begin
      $display($time,"      %b    %b        %b          %b           %b         %b            %h            %h                  %b                  %b          |           %h      %b", 
                                                                    test_clk, test_reset, mocked_we3, 
                                                                    mocked_wa3, mocked_ra1, mocked_ra2, mocked_wd3, mock_constante, 
                                                                    mock_select_src, mock_ULAControl, dut_ULAResult, dut_FlagZ);
    end



endmodule
