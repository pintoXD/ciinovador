`timescale 1ns/1ps
module register32_bank_tb();

    logic test_clk, test_reset, we3;
    logic [31:0] wd3;
    logic [4:0] wa3, ra1, ra2;
    logic [31:0] rd1, rd2;

    int base_wd3;
    int base_index;
    int base_read_data_1;
    int base_read_data_2;

    register32_bank dut(
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
        $dumpfile("register32_bank_tb.vcd");
        $dumpvars(0, register32_bank_tb);
        @(posedge test_clk);
        test_reset = 1'b0;
        #10 
        test_reset = 1'b1;
        #10

        //Test Case 0
        ra1 = 5'h00;
        ra2 = 5'h00;
        #20
        assert(rd1 == 32'h00 && rd2 == 32'h00) else $fatal(0,"Test Case 0 failed");

        /* 
             Set #1 of tests: Writing on registers
        */

        // Using a for loop to write to each register one by one
        base_wd3 = 8'h00;
        for (int i = 0; i < 32; i = i + 1) begin
            @(posedge test_clk);
            we3 = 1'b1;
            wd3 = base_wd3; // Writes base_wd3 on register i
            wa3 = i;
            base_wd3 = base_wd3 + 8'h11;
        end

        /* 
             Set #2 of tests: Reading from registers
        */
        // Reading the values from the registers, two by two.
        base_index = 0;
        base_read_data_1 = 32'd00;
        base_read_data_2 = 32'h11;
        for (int i = 0; i < 15; i = i + 1) begin
            @(posedge test_clk);
            ra1 = i*2; // Reads from register 0,2,4 and so on...
            ra2 = i*2 + 1; // Reads from registe 1, 3, 5 and so on...
            #20;
            assert(rd1 == (base_read_data_1) &&  rd2 == (base_read_data_2)) else begin
                $display("Test Case %0d Failed", i);
                $display("Reading from register %0d and %0d \n", ra1, ra2);
                $display("Expected %0h and %0h \n", base_read_data_1, base_read_data_2);
                $display("Got %0h and %0h \n", rd1, rd2);
                $fatal(0, "Test Case %0d Failed", i);
            end
            #30;
            base_read_data_1 = base_read_data_1 + 32'h22; //Just a value to use in the assertion to verify in a automated way if the current reg value is correct.
            base_read_data_2 = base_read_data_2 + 32'h22; //Just a value to use in the assertion to verify in a automated way if the current reg value is correct.
        end




        
        #10; 
        $finish;
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
      $display($time,"      %b    %b    %b    %h   %h    %h      %h         %h      %h", test_clk, test_reset, we3, 
                                                                    wa3, ra1, ra2, wd3, 
                                                                    rd1, rd2);
    end



endmodule