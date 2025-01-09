`timescale 1us/1ns
module decodificador_pt2272_tb ();

    // logic mock_INPUT_CLK, mock_RESET;
    logic [7:0] mock_A_enc;
    logic [3:0] mock_D_enc;
    logic mock_sync;
    logic mock_cod_o;

    logic mock_INPUT_CLK, mock_RESET;
    logic [7:0] mock_A;
    logic [3:0] mock_D;
    logic mock_dv;
    logic mock_cod_i;

    codificador_pt2262 encoder_dut(
        .clk(mock_INPUT_CLK), 
        .reset(mock_RESET),
        .A(mock_A_enc),
        .D(mock_D_enc),
        .sync(mock_sync),
        .cod_o(mock_cod_o)
    );

    decodificador_pt2272 DUT(
        .clk(mock_INPUT_CLK), // 3MHz conforme especificação
        .reset(mock_RESET), // reset ativo alto
        .A(mock_A_enc), // endereço de entrada, trinário
        .cod_i(mock_cod_o),  // dado codificado de entrada
        .D(mock_D), // dado recebido registrado
        .dv(mock_dv)       // sinalização de novo dado valido recebido, sincrono ao mesmo dominio de clock da saída "D"
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

        // @(posedge DUT.osc_clk);
        // mock_A = 8'bz1010000;
        // mock_D = 4'b1010;


        /*
            for (int i = 0; i < 5; i++) begin
                @(posedge mock_INPUT_CLK);
                @(posedge mock_INPUT_CLK);
                // mock_RESET = 0;
                // mock_cod_i = ~mock_cod_i;
                // @(posedge mock_INPUT_CLK);
            end
            // BIT 1
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
            
            //BIT 0
            for (int i = 0; i < 4; i++) begin
                @(posedge mock_INPUT_CLK);
                // mock_RESET = 0;
                mock_cod_i = 1;
                // @(posedge mock_INPUT_CLK);
            end

            for (int i = 0; i < 12; i++) begin
                @(posedge mock_INPUT_CLK);
                // mock_RESET = 0;
                mock_cod_i = 0;
                // @(posedge mock_INPUT_CLK);
            end

            for (int i = 0; i < 4; i++) begin
                @(posedge mock_INPUT_CLK);
                // mock_RESET = 0;
                mock_cod_i = 1;
                // @(posedge mock_INPUT_CLK);
            end

            for (int i = 0; i < 12; i++) begin
                @(posedge mock_INPUT_CLK);
                // mock_RESET = 0;
                mock_cod_i = 0;
                // @(posedge mock_INPUT_CLK);
            end

            // BIT F
            for (int i = 0; i < 4; i++) begin
                @(posedge mock_INPUT_CLK);
                // mock_RESET = 0;
                mock_cod_i = 1;
                // @(posedge mock_INPUT_CLK);
            end

            for (int i = 0; i < 12; i++) begin
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

            // BIT SYNC
            for (int i = 0; i < 4; i++) begin
                @(posedge mock_INPUT_CLK);
                // mock_RESET = 0;
                mock_cod_i = 1;
                // @(posedge mock_INPUT_CLK);
            end

            for (int i = 0; i < 128; i++) begin
                @(posedge mock_INPUT_CLK);
                // mock_RESET = 0;
                mock_cod_i = 0;
                // @(posedge mock_INPUT_CLK);
            end

            // final delay
            for (int i = 0; i < 100; i++) begin
                @(posedge mock_INPUT_CLK);
                // mock_RESET = 0;
                // @(posedge mock_INPUT_CLK);
            end
        */
        
        for (int i = 0; i < 2; i++) begin
            @(posedge encoder_dut.osc_clk);
            // @(posedge mock_INPUT_CLK);
        end

        @(posedge encoder_dut.osc_clk);
        mock_A_enc = 8'bz1010000;
        mock_D_enc = 4'b0100;


        for (int i = 0; i < 550; i++) begin
            @(posedge encoder_dut.osc_clk);
            // @(posedge mock_INPUT_CLK);
        end

        @(posedge encoder_dut.osc_clk);
        // mock_A_enc = 8'bz1010000;
        mock_A_enc = 8'b11110000;
        mock_D_enc = 4'b0110;


        for (int i = 0; i < 550; i++) begin
            @(posedge encoder_dut.osc_clk);
            // @(posedge mock_INPUT_CLK);
        end

        $finish;
    end

endmodule