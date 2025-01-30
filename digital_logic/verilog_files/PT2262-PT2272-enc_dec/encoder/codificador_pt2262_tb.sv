`timescale 1us/1ns
module codificador_pt2262_tb (
);
    logic mock_INPUT_CLK, mock_RESET;
    logic [7:0] mock_A;
    logic [3:0] mock_D;
    logic mock_sync;
    logic mock_cod_o;

    codificador_pt2262 DUT(
        .clk(mock_INPUT_CLK), 
        .reset(mock_RESET),
        .A(mock_A),
        .D(mock_D),
        .sync(mock_sync),
        .cod_o(mock_cod_o)
    );

    initial begin
        mock_INPUT_CLK = 0;
        forever begin
            #165ns mock_INPUT_CLK = ~mock_INPUT_CLK; // 330ns CLK Period == 3MHz CLK Frequency
        end
    end


    initial begin
        @(posedge mock_INPUT_CLK);
        mock_RESET = 1;

        @(posedge mock_INPUT_CLK);
        mock_RESET = 0;

        // @(posedge mock_INPUT_CLK);
        // @(posedge DUT.osc_clk);
        // mock_A = 8'b10100000;
        // // mock_A = 8'b00000000;
        // mock_D = 4'b1010;

        // @(posedge mock_sync);
        // mock_A = 8'b10100000;
        // mock_D = 4'b0011;

        @(posedge DUT.osc_clk);
        // mock_A = 8'bz1010000;
        mock_A = 8'b11110000;
        mock_D = 4'b1010;


        for (int i = 0; i < 1000; i++) begin
            @(posedge DUT.osc_clk);
            // @(posedge mock_INPUT_CLK);
        end
        $finish;
    end

endmodule