`timescale 1ns/1ps

module test_shift_register_bidir;

    // Inputs
    logic clk;
    logic reset_n;
    logic load_shift;
    logic right_left;
    logic [3:0] data_in;

    // Outputs
    logic [3:0] q_out;

    // Instantiate the Unit Under Test (UUT)
    shift_register_bidir uut (
        .clk(clk),
        .reset_n(reset_n),
        .load_shift(load_shift),
        .right_left(right_left),
        .data_in(data_in),
        .q_out(q_out)
    );

    // Clock generation
    // always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        reset_n = 0;
        load_shift = 0;
        right_left = 0;
        data_in = 4'b0000;

        // Wait for global reset
        #10;
        
        // Test reset functionality
        reset_n = 1;
        #10;
        reset_n = 0;
        #10;
        reset_n = 1;
        #10;
        assert(q_out == 4'b0000) else $fatal("Reset failed");

        // Test load data functionality
        load_shift = 1;
        data_in = 4'b1010;
        #5;
        clk = 1;
        #5;
        clk = 0;

        load_shift = 0;
        #5;
        clk = 1;
        #5;
        clk = 0;

        assert(q_out == 4'b1010) else $fatal("Load data failed");

        // Test shift right functionality
        right_left = 1;
        #10;
        assert(q_out == 4'b0101) else $fatal("Shift right failed");
        
        $display("##### q_out = %b #####", q_out);

        // Test shift left functionality
        right_left = 0;
        // 
        @(posedge clk);
        #1;
        assert(q_out == 4'b1010) else begin
            $display("q_out = %b", q_out);
            $fatal("Shift left failed");
        end
        // Finish simulation
        $finish;
    end

endmodule