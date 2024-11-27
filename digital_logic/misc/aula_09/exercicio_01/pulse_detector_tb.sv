`timescale 1ns/1ns


module pulse_detector_tb();

    logic dut_clk;
    logic mock_reset = 0;
    logic mock_a = 0; 
    logic mock_b = 0;
    logic dut_seq_a, dut_seq_b;

    initial
    begin
        dut_clk = 1;
        forever #3 dut_clk = ~dut_clk;
    end

    pulse_detector dut (
        .clk(dut_clk),
        .rst(mock_reset),
        .a_signal(mock_a),
        .b_signal(mock_b),
        .seq_a(dut_seq_a),
        .seq_b(dut_seq_b)
    );

    initial
    begin
        $dumpfile("pulse_detector_tb.vcd");
        $dumpvars(0, pulse_detector_tb);

        mock_reset = 1;
        #2;
        mock_reset = 0;

        @(posedge dut_clk);
        mock_a = 1;
        #1;
        mock_a = 0;

        @(posedge dut_clk);
        mock_a = 1;
        #1;
        mock_a = 0;
        
        @(posedge dut_clk);
        mock_a = 1;
        #1;
        mock_a = 0;
        
        #10; //Changing the set of state changes
        
        //Testing rising B
        @(posedge dut_clk);
        mock_b = 1;
        #1
        mock_b = 0;

        @(posedge dut_clk);
        mock_b = 1;
        #1
        mock_b = 0;
        
        @(posedge dut_clk);
        mock_b = 1;
        #1
        mock_b = 0;

        #10; //Changing the set of state changes
        /*
        @(posedge dut_clk);
        mock_a = 1; 
        #5
        mock_a = 0;

        // #10
        @(posedge dut_clk);
        mock_a = 1;
        #5
        mock_a = 0;

        // #10
        @(posedge dut_clk);
        mock_b = 1;
        #5
        mock_b = 0;

        */

        #30;
        $finish;

    end


    // initial
    // begin
    //   $display("                Tempo   Entradas LUT        Saídas");
    //   $display("                         A   B   C   D       OUT");
    //   $display("                ====   ================      =======");
    //   $monitor($time,"     %b   %b   %b   %b        %b", A, B, C, D, OUT);
    // end


endmodule