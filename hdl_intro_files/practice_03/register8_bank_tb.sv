`timescale 1ns/1ps
module register8_bank_tb();

    logic test_clk, test_reset, write_enable;
    logic [7:0] write_data;
    logic [2:0] write_addr, reg_addr_1, reg_addr_2;
    logic [7:0] reg_data_1, reg_data_2;


    register8_bank dut(
        .clk(test_clk),
        .rst(test_reset),
        .write_enable(write_enable),
        .write_addr(write_addr),
        .reg_addr_1(reg_addr_1),
        .reg_addr_2(reg_addr_2),
        .write_data(write_data),
        .reg_data_1(reg_data_1),
        .reg_data_2(reg_data_2)
    );

    initial begin
        test_clk = 1'b0;
        forever begin
            #5 test_clk = ~test_clk;
        end
    end

    initial begin
        @(posedge test_clk);
        test_reset = 1'b1;
        #5 
        test_reset = 1'b0;
        #5

        //Test Case 0
        assert(reg_data_1 == 8'h00 && reg_data_2 == 8'h00) else $fatal("Test Case 0 failed");
        #5

        //Test Case 1
        @(posedge test_clk);
        write_enable = 1'b1;
        write_data = 8'hAA;
        write_addr = 3'b001;
        reg_addr_1 = 3'b001;
        #20
        write_enable = 1'b0;
        // #10
        assert(reg_data_1 == 8'hAA && reg_data_2 == 8'h00) else $fatal("Test Case 1 failed");


        //Test Case 2
        @(posedge test_clk);
        write_enable = 1'b1;
        write_data = 8'hAA;
        write_addr = 3'b010;
        reg_addr_2 = 3'b010;
        #20
        write_enable = 1'b0;
        assert(reg_data_1 == 8'hAA && reg_data_2 == 8'hAA) else $fatal("Test Case 2 failed");

        //Test Case 3
        @(posedge test_clk);
        write_enable = 1'b0;
        write_data = 8'hFF;
        #10
        assert(reg_data_1 == 8'hAA && reg_data_2 == 8'hAA) else $fatal("Test Case 3 failed");



        /*
        //Test Case 3
        write_data = 8'hFF;
        #10
        assert(reg_data_1 == 8'hFF) else $fatal("Test case 3 failed");

        //Test Case 4
        write_data = 8'hAF;
        #10
        assert(reg_data_1 == 8'hAF) else $fatal("Test case 4 failed");

        //Test Case 5
        test_reset = 1'b1;
        write_data = 8'hFF;
        #10
        assert(reg_data_1 == 8'h00) else $fatal("Test case 5 failed");
        
        #10
        test_reset = 1'b0;
        #10

        //Test Case 6
        write_data = 8'h02;
        #10
        assert(reg_data_1 == 8'h02) else $fatal("Test case 6 failed");
        */
        #10 $finish;
    end

            // .rst(test_reset),
        // .write_enable(write_enable),
        // .reg_addr_1(reg_addr_1),
        // .reg_addr_2(reg_addr_2),
        // .write_data(write_data),
        // .reg_data_1(reg_data_1),
        // .reg_data_2(reg_data_2)
    initial
    begin
      $display("                Tempo               Entradas LUT                                    Saídas");
      $display("                         clk  rst  we3   wa3   ra1    ra2        wd3                rd1         rd2");
      $display("                ====   =================================================        =====================");
      $monitor($time,"      %b    %b    %b    %b   %b    %b      %b         %b      %b", test_clk, test_reset, write_enable, 
                                                                    write_addr, reg_addr_1, reg_addr_2, write_data, 
                                                                    reg_data_1, reg_data_2);
    end






endmodule
