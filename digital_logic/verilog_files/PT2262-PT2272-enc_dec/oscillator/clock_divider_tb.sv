/* verilator lint_off DECLFILENAME */
/* verilator lint_off UNUSEDSIGNAL */
`timescale 1us/100ns
module CLOCK_DIVIDER_TB();

    logic mock_INPUT_CLK, mock_RST;
    logic dut_OUTPUT_CLK;

    //Instantiating the Device Under Test (DUT)
    CLOCK_DIVIDER #(
        .DIVIDER(250)
    )DUT(
        .INPUT_CLK(mock_INPUT_CLK), 
        .RST(mock_RST), 
        .OUTPUT_CLK(dut_OUTPUT_CLK) 
    );

    initial begin
        mock_INPUT_CLK = 0;
        forever begin
            // #0.5us mock_INPUT_CLK = ~mock_INPUT_CLK; // 1us CLK Period == 1MHz CLK Frequency
            #165ns mock_INPUT_CLK = ~mock_INPUT_CLK; // 330ns CLK Period == 3MHz CLK Frequency
            // #5us mock_INPUT_CLK = ~mock_INPUT_CLK; // 10us CLK Period == 100kHz CLK Frequency
            // #50us mock_INPUT_CLK = ~mock_INPUT_CLK; // 100us CLK Period == 10kHz CLK Frequency
            // #500us mock_INPUT_CLK = ~mock_INPUT_CLK; // 1000us CLK Period == 1kHz CLK Frequency
        end
    end


    initial begin
        $dumpfile("CLOCK_DIVIDER_TB.vcd");
        $dumpvars(0, CLOCK_DIVIDER_TB);

        // Initialize Inputs
        @(posedge mock_INPUT_CLK);
        mock_RST = 0;

        // Wait for rst to be finished
        @(posedge mock_INPUT_CLK);
        @(posedge mock_INPUT_CLK);
        @(posedge mock_INPUT_CLK);
        mock_RST = 1;

        for(int i = 0; i < 750; i++) begin
            @(posedge mock_INPUT_CLK);
            // #1ns;
        end
        $finish;
    end


endmodule
