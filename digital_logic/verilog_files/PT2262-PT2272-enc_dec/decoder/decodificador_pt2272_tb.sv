`timescale 1us/1ns
module PT2262_DECODER_TB ();
    logic mock_INPUT_CLK, mock_RESET;
    logic [7:0] mock_A;
    logic [3:0] mock_D;
    logic mock_sync;
    logic mock_cod_o;
    logic mock_cod_i;


decodificador_pt2272 DUT(
    .clk(mock_INPUT_CLK), // 3MHz conforme especificação
    .reset(mock_RESET), // reset ativo alto
    .A(mock_A), // endereço de entrada, trinário
    .cod_i(mock_cod_i),  // dado codificado de entrada
    .D(), // dado recebido registrado
    .dv()       // sinalização de novo dado valido recebido, sincrono ao mesmo dominio de clock da saída "D"
);

    initial begin
        mock_INPUT_CLK = 0;
        forever begin
            #83us mock_INPUT_CLK = ~mock_INPUT_CLK; // 330ns CLK Period == 3MHz CLK Frequency
        end
    end


    initial begin
        @(posedge mock_INPUT_CLK);
        mock_RESET = 1;
        mock_cod_i = 0;

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

        // @(posedge DUT.osc_clk);
        // mock_A = 8'bz1010000;
        // mock_D = 4'b1010;


        
        for (int i = 0; i < 50; i++) begin
            @(posedge mock_INPUT_CLK);
            @(posedge mock_INPUT_CLK);
            // mock_RESET = 0;
            // mock_cod_i = ~mock_cod_i;
            // @(posedge mock_INPUT_CLK);
        end

        for (int i = 0; i < 12; i++) begin
            @(posedge mock_INPUT_CLK);
            // mock_RESET = 0;
            mock_cod_i = 1;
            // @(posedge mock_INPUT_CLK);
        end

        for (int i = 0; i < 4; i++) begin
            @(posedge mock_INPUT_CLK);
            // mock_RESET = 0;
            mock_cod_i = 0;
            // @(posedge mock_INPUT_CLK);
        end

        for (int i = 0; i < 12; i++) begin
            @(posedge mock_INPUT_CLK);
            // mock_RESET = 0;
            mock_cod_i = 1;
            // @(posedge mock_INPUT_CLK);
        end

        for (int i = 0; i < 4; i++) begin
            @(posedge mock_INPUT_CLK);
            // mock_RESET = 0;
            mock_cod_i = 0;
            // @(posedge mock_INPUT_CLK);
        end

        for (int i = 0; i < 12; i++) begin
            @(posedge mock_INPUT_CLK);
            // mock_RESET = 0;
            mock_cod_i = 1;
            // @(posedge mock_INPUT_CLK);
        end

        for (int i = 0; i < 4; i++) begin
            @(posedge mock_INPUT_CLK);
            // mock_RESET = 0;
            mock_cod_i = 0;
            // @(posedge mock_INPUT_CLK);
        end

        for (int i = 0; i < 12; i++) begin
            @(posedge mock_INPUT_CLK);
            // mock_RESET = 0;
            mock_cod_i = 1;
            // @(posedge mock_INPUT_CLK);
        end

        for (int i = 0; i < 4; i++) begin
            @(posedge mock_INPUT_CLK);
            // mock_RESET = 0;
            mock_cod_i = 0;
            // @(posedge mock_INPUT_CLK);
        end

        for (int i = 0; i < 50; i++) begin
            @(posedge mock_INPUT_CLK);
            // mock_RESET = 0;
            // @(posedge mock_INPUT_CLK);
        end

        $finish;
    end

endmodule