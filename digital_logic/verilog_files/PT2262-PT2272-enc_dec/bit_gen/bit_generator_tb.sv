
/* verilator lint_off DECLFILENAME */
/* verilator lint_off UNUSEDSIGNAL */
`timescale 1us/1ns
module BIT_GENERATOR_TB();
    logic mock_INPUT_CLK, mock_RST, mock_ENB_GENERATION;
    logic mock_INPUT_BIT;
    logic mock_RST_BIT_GENERATOR;
    logic dut_OUTPUT_CLK;

    // Instantiating the 12kHz clock generator.
    CLOCK_DIVIDER #(
        .DIVIDER(250)
    )CLK_DIVIDER(
        .INPUT_CLK(mock_INPUT_CLK), 
        .RST(mock_RST), 
        .OUTPUT_CLK(dut_OUTPUT_CLK) 
    );

    // Instantiating the bit generator.
    BIT_GENERATOR DUT(
        .osc_clk(dut_OUTPUT_CLK),
        .rst(mock_RST_BIT_GENERATOR),
        .enable_generation(mock_ENB_GENERATION),
        .input_bit(mock_INPUT_BIT),
        .bit_type(3'b000),
        .output_signal()
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
        $dumpfile("BIT_GENERATOR_TB.vcd");
        $dumpvars(0, BIT_GENERATOR_TB);

        // ###### Initialize oscillator #########
        @(posedge mock_INPUT_CLK);
        mock_RST = 0;

        // Wait for rst to be finished
        @(posedge mock_INPUT_CLK);
        @(posedge mock_INPUT_CLK);
        @(posedge mock_INPUT_CLK);
        mock_RST = 1;

        // ###### Initialize bit generator #########
        @(posedge dut_OUTPUT_CLK);
        mock_RST_BIT_GENERATOR = 0;

        // Wait for rst to be finished and set it to 1 to start the bit generation.
        @(posedge dut_OUTPUT_CLK);
        mock_RST_BIT_GENERATOR = 1;
        @(posedge dut_OUTPUT_CLK);
        mock_ENB_GENERATION = 1;
        mock_INPUT_BIT = 1;


        // Iterates over 500 oscillator clock cycles.
        for(int i = 0; i < 150; i++) begin
            @(posedge dut_OUTPUT_CLK);
            #1ns;
            // $display("Index %0d: %0d", i, DUT.output_signal);
        end

        mock_ENB_GENERATION = 0;
        mock_INPUT_BIT = 1;
        #50000us;
        $finish;
    end


endmodule