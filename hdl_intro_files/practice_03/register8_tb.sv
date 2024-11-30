`timescale 1ns/1ps
module register8_tb();

    logic test_clk, test_reset;
    logic [7:0] test_input;
    logic [7:0] test_output;


    register8 dut(
        .clk(test_clk),
        .reset(test_reset),
        .in_word(test_input),
        .out_word(test_output)
    );

    initial begin
        test_clk = 1'b0;
        forever begin
            #5 test_clk = ~test_clk;
        end
    end

    initial begin
        test_reset = 1'b0;
        #10 
        test_reset = 1'b1;
        #10

        //Test Case 1
        test_input = 8'h01;
        #10
        assert(test_output == 8'h01) else $fatal("Test case 1 failed");

        //Test Case 2
        test_input = 8'h02;
        #10
        assert(test_output == 8'h02) else $fatal("Test case 2 failed");

        //Test Case 3
        test_input = 8'hFF;
        #10
        assert(test_output == 8'hFF) else $fatal("Test case 3 failed");

        //Test Case 4
        test_input = 8'hAF;
        #10
        assert(test_output == 8'hAF) else $fatal("Test case 4 failed");

        //Test Case 5
        test_reset = 1'b0;
        test_input = 8'hFF;
        #10
        assert(test_output == 8'h00) else $fatal("Test case 5 failed");
        
        #10
        test_reset = 1'b1;
        #10

        //Test Case 6
        test_input = 8'h02;
        #10
        assert(test_output == 8'h02) else $fatal("Test case 6 failed");

        #10 $finish;
    end

    
    initial
    begin
      $display("                Tempo     Entradas LUT                    Saídas");
      $display("                         clk reset test_input            test_output");
      $display("                ====   ===========================     =============");
      $monitor($time,"       %b      %b      %b  %b         ", test_clk, test_reset, test_input, test_output);
    end






endmodule
