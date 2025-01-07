`timescale 1ns/1ps
module BIDIR_SHIFTREG_TB();

    // Parameters
    parameter N = 4;

    // Inputs
    logic enable;
    logic shift_in;
    logic [N-1:0] d;
    logic [2:0] OP;
    logic [1:0] PT2272_BIT;

    // Outputs
    logic [N-1:0] q;
    logic shift_out_right;
    logic shift_out_left;

    // Instantiate the Unit Under Test (UUT)
    BIDIR_SHIFTREG #(N) uut (
        .enable(enable),
        .shift_in(shift_in),
        .d(d),
        .PT2272_BIT(PT2272_BIT),
        .OP(OP),
        .q(q),
        .shift_out_right(shift_out_right),
        .shift_out_left(shift_out_left)
    );

    initial begin
        enable = 1'b0;
        forever #5 enable = ~enable;
    end

    // Testbench variables
    initial begin
        $dumpfile("BIDIR_SHIFTREG_TB.vcd");
        $dumpvars(0, BIDIR_SHIFTREG_TB);
        // Initialize Inputs
        // enable = 1'b0;
        shift_in = 1'b0;
        d = 4'b0;
        OP = 3'b000;

        // Wait for global reset
        #5;

        // Test case 1: Load data
        d = 4'b1010;
        OP = 3'b011;
        // enable = 1;
        #10;
        // enable = 0;
        assert(q == 4'b1010 && shift_out_left == 1'b1 && shift_out_right == 1'b0) else $fatal(1, "Test case 1 failed");

        // Test case 2: Shift right with serial shift_in equal to 0
        shift_in = 0;
        OP = 3'b010;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b0101 && shift_out_right == 1'b1) else $fatal(1, "Test case 2 failed");
        
        // Test case 3: Shift right with serial shift_in equal to 0
        shift_in = 0;
        OP = 3'b010;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b0010 && shift_out_right == 1'b0) else $fatal(1, "Test case 3 failed");

        // Test case 4: Shift right with serial shift_in equal to 0
        shift_in = 0;
        OP = 3'b010;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b0001 && shift_out_right == 1'b1) else $fatal(1, "Test case 4 failed");

        // Test case 5: Shift right with serial shift_in equal to 0
        shift_in = 0;
        OP = 3'b010;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b0000 && shift_out_right == 1'b0) else $fatal(1, "Test case 5 failed");


        // Test case 6: Load data again
        OP = 3'b011;
        d = 4'b1010;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1010 && shift_out_left == 1'b1 && shift_out_right == 1'b0) else $fatal(1, "Test case 6 failed");

        // Test case 7: Shift left with serial shift_in equal to 0
        shift_in = 0;
        OP = 3'b001;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b0100 && shift_out_left == 1'b0) else $fatal(1, "Test case 7 failed");

        // Test case 8: Shift left with serial shift_in equal to 0
        shift_in = 0;
        OP = 3'b001;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1000 && shift_out_left == 1'b1) else $fatal(1, "Test case 8 failed");

        // Test case 9: Shift left with serial shift_in equal to 0
        shift_in = 0;
        OP = 3'b001;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b0000 && shift_out_left == 1'b0) else $fatal(1, "Test case 9 failed");

        // Test case 10: Load data again
        d = 4'b1111;
        OP = 3'b011;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1111 && shift_out_left == 1'b1 && shift_out_right == 1'b1) else $fatal(1, "Test case 10 failed");

        // Test case 11: No operation
        OP = 3'b000;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1111 && shift_out_left == 1'b1 && shift_out_right == 1'b1) else $fatal(1, "Test case 11 failed");


        // Test case 12: Shift left with serial shift_in equal to 0 and input all ones
        shift_in = 0;
        OP = 3'b001;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1110 && shift_out_left == 1'b1) else $fatal(1, "Test case 12 failed");

        // Test case 13: Shift left with serial shift_in equal to 0 and input that was all ones
        shift_in = 0;
        OP = 3'b001;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1100 && shift_out_left == 1'b1) else $fatal(1, "Test case 13 failed");

        // Test case 14: Shift left with serial shift_in equal to 0 and input that was all ones
        shift_in = 0;
        OP = 3'b001;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1000 && shift_out_left == 1'b1) else $fatal(1, "Test case 14 failed");

        // Test case 15: Shift left with serial shift_in equal to 0 and input that was all ones
        shift_in = 0;
        OP = 3'b001;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b0000 && shift_out_left == 1'b0) else $fatal(1, "Test case 15 failed");

        // Test case 16: Load data again
        d = 4'b1111;
        OP = 3'b011;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1111 && shift_out_left == 1'b1 && shift_out_right == 1'b1) else $fatal(1, "Test case 16 failed");


        // Test case 17: Shift left with serial PT2272_BIT equal to 00 and input that was all ones
        PT2272_BIT = 2'b00;
        OP = 3'b100;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1100 && shift_out_left == 1'b1) else $fatal(1, "Test case 17 failed");

        // Test case 18: Shift right with serial PT2272_BIT equal to 11 and input was 1100
        PT2272_BIT = 2'b11;
        OP = 3'b101;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1111 && shift_out_right == 1'b1) else $fatal(1, "Test case 18 failed");

        // Test case 19: Shift right with serial PT2272_BIT equal to 11 and input was all ones
        PT2272_BIT = 2'b10;
        OP = 3'b101;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1011 && shift_out_right == 1'b1) else $fatal(1, "Test case 19 failed");

        // Test case 20: Shift left with serial PT2272_BIT equal to 11 and input was 1011
        PT2272_BIT = 2'b11;
        OP = 3'b100;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1111 && shift_out_left == 1'b1) else $fatal(1, "Test case 20 failed");

        // Test case 21: Shift left with serial PT2272_BIT equal to 01 and input was all ones
        PT2272_BIT = 2'b01;
        OP = 3'b100;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1101 && shift_out_left == 1'b1) else $fatal(1, "Test case 21 failed");



        $display("All test cases passed.");
        $finish;
    end

    initial
    begin
      $display("                Tempo     Entradas LUT                                  Saídas");
      $display("                         enable  shift_in  d   OP            q     shift_out_left  shift_out_right");
      $display("                ====   ============================      ==========================================");
      $monitor($time,"       %b      %b      %b  %b          %b         %b              %b", enable, shift_in, d, OP, q, shift_out_left, shift_out_right);
    end

endmodule
