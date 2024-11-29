`timescale 1ns/1ps
module register8_bank_tb();

    logic test_clk, test_reset, we3;
    logic [7:0] wd3;
    logic [2:0] wa3, ra1, ra2;
    logic [7:0] rd1, rd2;


    register8_bank_v2 dut(
        .clk(test_clk),
        .rst(test_reset),
        .we3(we3),
        .wa3(wa3),
        .ra1(ra1),
        .ra2(ra2),
        .wd3(wd3),
        .rd1(rd1),
        .rd2(rd2)
    );

    initial begin
        test_clk = 1'b0;
        forever begin
            #5 test_clk = ~test_clk;
        end
    end

    initial begin
        $dumpfile("register8_bank_tb.vcd");
        $dumpvars(0, register8_bank_tb);
        @(posedge test_clk);
        test_reset = 1'b0;
        #10 
        test_reset = 1'b1;
        #10

        //Test Case 0
        // ra1 = 3'b000;
        // ra2 = 3'b000;
        assert(rd1 == 8'h00 && rd2 == 8'h00) else $fatal("Test Case 0 failed");
        #10


        /* 
             Set #1 of tests: Writing on registers
                Test Cases 1 to 9 covers the writing process on each of the registers, X1 to X7, present on the register bank. 
                Some tests to cover the writing withtou premission cases were also created. 
                Further tests should be presented on the next sets test cases.
        */


        //Test Case 1 - Write to register X1
        @(posedge test_clk);
        we3 = 1'b1;
        wd3 = 8'hAA;
        wa3 = 3'b001;
        ra1 = 3'b001;
        #20
        we3 = 1'b0;
        // #10
        assert(rd1 == 8'hAA && rd2 == 8'h00) else $fatal("Test Case 1 failed");


        //Test Case 2 - Write to register X2
        @(posedge test_clk);
        we3 = 1'b1;
        wd3 = 8'hBB;
        wa3 = 3'b010;
        ra2 = 3'b010;
        #20
        we3 = 1'b0;
        assert(rd1 == 8'hAA && rd2 == 8'hBB) else $fatal("Test Case 2 failed");

        //Test Case 3 - Write to register X1 with no permission to write enabled.
        @(posedge test_clk);
        we3 = 1'b0;
        wd3 = 8'hFF;
        wa3 = 3'b001;
        #10
        assert(rd1 == 8'hAA && rd2 == 8'hBB) else $fatal("Test Case 3 failed");

        //Test Case 4 - Write to register X3 with rd2 unchanged from the previous test case.
        @(posedge test_clk);
        we3 = 1'b1;
        wd3 = 8'hCC;
        wa3 = 3'b011; //==> Register X3
        ra1 = 3'b011;
        #20
        we3 = 1'b0;
        assert(rd1 == 8'hCC && rd2 == 8'hBB) else $fatal("Test Case 4 failed");

        //Test Case 5 - Write to register X4 with rd1 unchanged from the previous test case.
        @(posedge test_clk);
        we3 = 1'b1;
        wd3 = 8'hDD;
        wa3 = 3'b100; //==> Register X4
        ra2 = 3'b100;
        #20
        we3 = 1'b0;
        assert(rd1 == 8'hCC && rd2 == 8'hDD) else $fatal("Test Case 5 failed");


        //Test Case 6 - Write to register X4 with no permission to write on it.
        @(posedge test_clk);
        we3 = 1'b0;
        wd3 = 8'hFF;
        wa3 = 3'b100;
        #10
        assert(rd1 == 8'hCC && rd2 == 8'hDD) else $fatal("Test Case 6 failed");

        //Test Case 7 - Write to register X5 with rd2 unchanged from X4 register writing test case.
        @(posedge test_clk);
        we3 = 1'b1;
        wd3 = 8'hEE;
        wa3 = 3'b101; //==> Register X5
        ra1 = 3'b101;
        #20
        we3 = 1'b0;
        assert(rd1 == 8'hEE && rd2 == 8'hDD) else $fatal("Test Case 7 failed");

        //Test Case 8 - Write to register X6 with rd1 unchanged from the previous test case.
        @(posedge test_clk);
        we3 = 1'b1;
        wd3 = 8'hFF;
        wa3 = 3'b110; //==> Register X6
        ra2 = 3'b110;
        #20
        we3 = 1'b0;
        assert(rd1 == 8'hEE && rd2 == 8'hFF) else $fatal("Test Case 8 failed");

        //Test Case 9 - Write to register X7 with rd2 unchanged from the previous test case.
        @(posedge test_clk);
        we3 = 1'b1;
        wd3 = 8'h11;
        wa3 = 3'b111; //==> Register X7
        ra1 = 3'b111;
        #20
        we3 = 1'b0;
        assert(rd1 == 8'h11 && rd2 == 8'hFF) else $fatal("Test Case 9 failed");


        /*
            Set #2: Reading from the previous set registers.
                This set of test cases covers the reading of the values previously set on the register
                of the register bank being tested.
                All the values read must match the values set on the test cases above.
        */

        //Test Case 10 - Reading the current value from the registers X1 and X2
        @(posedge test_clk);
        ra1 = 3'b001; //Register X1
        ra2 = 3'b010; //Register X2
        #10
        assert(rd1 == 8'hAA && rd2 == 8'hBB) else $fatal("Test Case 10 failed");

        //Test Case 11 - Reading the current value from the registers X3 and X4
        @(posedge test_clk);
        ra1 = 3'b011; //Register X3
        ra2 = 3'b100; //Register X4
        #10
        assert(rd1 == 8'hCC && rd2 == 8'hDD) else $fatal("Test Case 11 failed");

        //Test Case 12 - Reading the current value from the registers X5 and X6
        @(posedge test_clk);
        ra1 = 3'b101; //Register X5
        ra2 = 3'b110; //Register X6
        #10
        assert(rd1 == 8'hEE && rd2 == 8'hFF) else $fatal("Test Case 12 failed");

        //Test Case 13 - Reading the current value from the registers X7 and X0
        @(posedge test_clk);
        ra1 = 3'b111; //Register X7
        ra2 = 3'b000; //Register X1
        #10
        assert(rd1 == 8'h11 && rd2 == 8'h00) else $fatal("Test Case 13 failed");

        /* 
            Set#3: Resetting all the registers from the register bank
                The next set of tests covers a bulk reset on all of the registers from the
                register bank under test, followed by assertions that the registers were
                zeroed indeed.
        */

        @(posedge test_clk);
        //Setting the reset process.
        test_reset = 1'b0;
        #10
        test_reset = 1'b1;
        #10

        //Test Case 14 - Reading the current value from the registers X1 and X2 after the reset process.
        @(posedge test_clk);
        ra1 = 3'b001; //Register X1
        ra2 = 3'b010; //Register X2
        #10
        assert(rd1 == 8'h00 && rd2 == 8'h00) else $fatal("Test Case 14 failed");

        //Test Case 15 - Reading the current value from the registers X3 and X4 after the reset process.
        @(posedge test_clk);
        ra1 = 3'b011; //Register X3
        ra2 = 3'b100; //Register X4
        #10
        assert(rd1 == 8'h00 && rd2 == 8'h00) else $fatal("Test Case 15 failed");

        //Test Case 16 - Reading the current value from the registers X5 and X6 after the reset process.
        @(posedge test_clk);
        ra1 = 3'b101; //Register X5
        ra2 = 3'b110; //Register X6
        #10
        assert(rd1 == 8'h00 && rd2 == 8'h00) else $fatal("Test Case 16 failed");

        //Test Case 17 - Reading the current value from the registers X7 and X1 after the reset process.
        @(posedge test_clk);
        ra1 = 3'b111; //Register X7
        ra2 = 3'b000; //Register X0
        #10
        assert(rd1 == 8'h00 && rd2 == 8'h00) else $fatal("Test Case 17 failed");

        #10 $finish;
    end

    initial
    begin
      $display("                Tempo               Entradas LUT                                    Saídas");
      $display("                         clk  rst  we3   wa3   ra1    ra2        wd3                rd1         rd2");
      $display("                ====   =================================================        =====================");
      /* $monitor($time,"      %b    %b    %b    %b   %b    %b      %b         %b      %b", test_clk, test_reset, we3, 
                                                                    wa3, ra1, ra2, wd3, 
                                                                    rd1, rd2);
 */    end

    always@(posedge test_clk)begin
      $display($time,"      %b    %b    %b    %b   %b    %b      %b         %b      %b", test_clk, test_reset, we3, 
                                                                    wa3, ra1, ra2, wd3, 
                                                                    rd1, rd2);
    end



endmodule
