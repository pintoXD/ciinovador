`timescale 1ns/1ps
module shiftreg_op_tb();

    // Parameters
    parameter N = 4;

    // Inputs
    logic enable;
    logic shift_in;
    logic [N-1:0] d;
    logic [1:0] OP;

    // Outputs
    logic [N-1:0] q;
    logic shift_out_right;
    logic shift_out_left;

    // Instantiate the Unit Under Test (UUT)
    shiftreg_op #(N) uut (
        .enable(enable),
        .shift_in(shift_in),
        .d(d),
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
        $dumpfile("shiftreg_dump.vcd");
        $dumpvars(0, shiftreg_op_tb);
        // Initialize Inputs
        // enable = 1'b0;
        shift_in = 1'b0;
        d = 4'b0;
        OP = 2'b0;

        // Wait for global reset
        #5;

        // Test case 1: Load data
        d = 4'b1010;
        OP = 2'b11;
        // enable = 1;
        #10;
        // enable = 0;
        assert(q == 4'b1010 && shift_out_left == 1'b1 && shift_out_right == 1'b0) else $fatal("Test case 1 failed");

        // Test case 2: Shift right with serial shift_in equal to 0
        shift_in = 0;
        OP = 2'b10;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b0101 && shift_out_right == 1'b1) else $fatal("Test case 2 failed");
        
        // Test case 3: Shift right with serial shift_in equal to 0
        shift_in = 0;
        OP = 2'b10;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b0010 && shift_out_right == 1'b0) else $fatal("Test case 3 failed");

        // Test case 4: Shift right with serial shift_in equal to 0
        shift_in = 0;
        OP = 2'b10;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b0001 && shift_out_right == 1'b1) else $fatal("Test case 4 failed");

        // Test case 5: Shift right with serial shift_in equal to 0
        shift_in = 0;
        OP = 2'b10;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b0000 && shift_out_right == 1'b0) else $fatal("Test case 5 failed");


        // Test case 6: Load data again
        OP = 2'b11;
        d = 4'b1010;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1010 && shift_out_left == 1'b1 && shift_out_right == 1'b0) else $fatal("Test case 6 failed");

        // Test case 7: Shift left with serial shift_in equal to 0
        shift_in = 0;
        OP = 2'b01;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b0100 && shift_out_left == 1'b0) else $fatal("Test case 7 failed");

        // Test case 8: Shift left with serial shift_in equal to 0
        shift_in = 0;
        OP = 2'b01;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1000 && shift_out_left == 1'b1) else $fatal("Test case 8 failed");

        // Test case 9: Shift left with serial shift_in equal to 0
        shift_in = 0;
        OP = 2'b01;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b0000 && shift_out_left == 1'b0) else $fatal("Test case 9 failed");

        // Test case 10: Load data again
        d = 4'b1111;
        OP = 2'b11;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1111 && shift_out_left == 1'b1 && shift_out_right == 1'b1) else $fatal("Test case 10 failed");

        // Test case 11: No operation
        OP = 2'b00;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1111 && shift_out_left == 1'b1 && shift_out_right == 1'b1) else $fatal("Test case 11 failed");


        // Test case 12: Shift left with serial shift_in equal to 0 and input all ones
        shift_in = 0;
        OP = 2'b01;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1110 && shift_out_left == 1'b1) else $fatal("Test case 12 failed");

        // Test case 13: Shift left with serial shift_in equal to 0 and input that was all ones
        shift_in = 0;
        OP = 2'b01;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1100 && shift_out_left == 1'b1) else $fatal("Test case 13 failed");

        // Test case 14: Shift left with serial shift_in equal to 0 and input that was all ones
        shift_in = 0;
        OP = 2'b01;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b1000 && shift_out_left == 1'b1) else $fatal("Test case 14 failed");

        // Test case 15: Shift left with serial shift_in equal to 0 and input that was all ones
        shift_in = 0;
        OP = 2'b01;
        #10;
        // #5;
        // enable = 1;
        // #5;
        // enable = 0;
        assert(q == 4'b0000 && shift_out_left == 1'b0) else $fatal("Test case 15 failed");

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
