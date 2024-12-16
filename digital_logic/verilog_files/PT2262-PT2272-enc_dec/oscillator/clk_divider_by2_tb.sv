`timescale 1us/1ns
module CLK_DIVIDER_BY_2_TB();

    logic mock_clk, mock_rst, mock_D;
    logic dut_clk_divided, dut_Q;

    //Instantiating the Device Under Test (UUT)
    CLK_DIVIDER_BY_2 uut (
        .clk(mock_clk), 
        .rst(mock_rst), 
        .D(mock_D), 
        .clk_divided(dut_clk_divided), 
        .Q(dut_Q)
    );

    initial begin
        mock_clk = 0;
        forever begin
            #0.5us mock_clk = ~mock_clk; // 1us CLK Period == 1MHz CLK Frequency
            // #5us mock_clk = ~mock_clk; // 10us CLK Period == 100kHz CLK Frequency
            // #50us mock_clk = ~mock_clk; // 100us CLK Period == 10kHz CLK Frequency
            // #500us mock_clk = ~mock_clk; // 1000us CLK Period == 1kHz CLK Frequency
        end
    end


    initial begin
        // Initialize Inputs
        @(posedge mock_clk);
        mock_rst = 0;

        // Wait for rst to be finished
        @(posedge mock_clk);
        mock_rst = 1;
        mock_D = ~dut_Q;
        

        for(int i = 0; i < 100; i++) begin
            @(posedge mock_clk);
            mock_D = ~dut_Q;
        end
        $finish;
    end


endmodule