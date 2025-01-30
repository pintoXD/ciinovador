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
        
        for (int i = 0; i < 2; i++) begin
            @(posedge DUT.osc_clk);
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


/*`timescale 1ns/10ps
module decodificador_pt2272_tb(); // compilar com      xrun -top tb -access r -gui tb_tolerancias.sv decodificador.sv

reg  clk_decod=0;
reg  reset_decod=1;
reg  [7:0] A_decod=0;
reg cod_sinal=0;
wire [3:0] D_decod;
wire dv_decod;
// referência para geracao dos símbolos
const int PERIODO_OSC_NOMINAL = 83333;  // ns, veja timescale
int PERIODO_OSC = PERIODO_OSC_NOMINAL;  // ns, veja timescale
real variacao = 0;
real escala_variacao = 0; // inicia sem qualquer variacao na duracao dos pulsos


// Instancia do decodificador
decodificador_pt2272 Xdecod(
	.clk(clk_decod),
	.reset(reset_decod),
	.A(A_decod),
	.cod_i(cod_sinal),
	.D(D_decod),
	.dv(dv_decod)
	);
// Tarefas definidas para o testbench
// Não sintetizáveis da forma que são apresentadas aqui
task bit_0;
    begin
      variacao=escala_variacao*($urandom_range(0,200)-100.0)/100.0; // real aleatorio entre -escala_variacao a +escala_variacao
      cod_sinal    = 1'b1;
      #((4+variacao)*PERIODO_OSC);
      cod_sinal    = 1'b0;
      #((12-variacao)*PERIODO_OSC);
      cod_sinal    = 1'b1;
      #((4+variacao)*PERIODO_OSC);
      cod_sinal    = 1'b0;
      #((12-variacao)*PERIODO_OSC);
    end
  endtask

task bit_1;
    begin
      variacao=escala_variacao*($urandom_range(0,200)-100.0)/100.0; // real aleatorio entre -escala_variacao a +escala_variacao
      cod_sinal    = 1'b1;
      #((12-variacao)*PERIODO_OSC);
      cod_sinal    = 1'b0;
      #((4+variacao)*PERIODO_OSC);
      cod_sinal    = 1'b1;
      #((12-variacao)*PERIODO_OSC);
      cod_sinal    = 1'b0;
      #((4+variacao)*PERIODO_OSC);
    end
  endtask

task bit_f;
    begin
      variacao=escala_variacao*($urandom_range(0,200)-100.0)/100.0; // real aleatorio entre -escala_variacao a +escala_variacao
      cod_sinal    = 1'b1;
      #((4+variacao)*PERIODO_OSC);
      cod_sinal    = 1'b0;
      #((12-variacao)*PERIODO_OSC);
      cod_sinal    = 1'b1;
      #((12-variacao)*PERIODO_OSC);
      cod_sinal    = 1'b0;
      #((4+variacao)*PERIODO_OSC);
    end
  endtask

task sync;
    begin
      variacao=escala_variacao*($urandom_range(0,200)-100.0)/100.0; // real aleatorio entre -escala_variacao a +escala_variacao
      cod_sinal    = 1'b1;
      #((4+variacao)*PERIODO_OSC);
      cod_sinal    = 1'b0;
      #((124-variacao)*PERIODO_OSC);
    end
  endtask

task pacote;
    input [3:0] i_data; 
    int i;
    begin
      for (i=0; i<8; i=i+1)
	      if(A_decod[i]===1'bz)
		    bit_f();
	      else
		    if(A_decod[i]===1'b1)
		          bit_1();
		    else
		          bit_0();
      for (i=3; i>=0; i=i-1)
	      if(i_data[i]==1'b1)
		    bit_1();
	      else
		    bit_0();
      sync();
    end
  endtask

always #(333.3333ns/2) clk_decod = !clk_decod;

initial	#(5.65us) reset_decod = 0;

initial #(1500ms) $finish(); // termina a simulação


initial
begin
	@(posedge clk_decod);
	// gera 1 bit
	/*bit_0();
	bit_1();
	bit_f();
	sync();
	bit_0();
	bit_1();
	bit_f();
	sync();/
	// A = z1111z11
	A_decod = 8'hFF;
	A_decod[2] = 1'bz;
	A_decod[7] = 1'bz;
	#(50ms); // atraso arbitrário
	$display("Temporização nominal");
	pacote(4'b0100);
	pacote(4'b0110);
	pacote(4'b0101);
	pacote(4'b1000);

	#(50ms); // atraso arbitrário
	$display("Temporização relogio do codificador 5%% menor o periodo");
	PERIODO_OSC = PERIODO_OSC_NOMINAL*0.95;
	pacote(4'b0100);
	pacote(4'b0110);
	pacote(4'b0101);
	pacote(4'b1000);

	#(50ms); // atraso arbitrário
	$display("Temporização relogio do codificador 10%% menor o periodo");
	PERIODO_OSC = PERIODO_OSC_NOMINAL*0.9;
	pacote(4'b0100);
	pacote(4'b1000);

	#(50ms); // atraso arbitrário
	$display("Temporização relogio do codificador 5%% maior o periodo");
	PERIODO_OSC = PERIODO_OSC_NOMINAL*1.05;
	pacote(4'b0110);
	pacote(4'b1000);

	#(50ms); // atraso arbitrário
	$display("Temporização relogio do codificador 10%% maior o periodo");
	PERIODO_OSC = PERIODO_OSC_NOMINAL*1.1;
	pacote(4'b0100);
	pacote(4'b0110);

	#(50ms); // atraso arbitrário
	$display("Temporização relogio do codificador periodo nominal mas variações aleatorias nas duracoes dos pulsos sem afetar o periodo");
	PERIODO_OSC = PERIODO_OSC_NOMINAL;
	$display("Variacao de até 1 ciclo de OSC em cada pulso");
	escala_variacao = 1;	 
	pacote(4'b0100);
	pacote(4'b0110);
	$display("Variacao de até 2.5 ciclo de OSC em cada pulso");
	escala_variacao = 2.5;	 
	pacote(4'b0100);
	pacote(4'b0110);

	#(50ms); // atraso arbitrário
	$display("Erros intencionais por formatos inválidos");
	escala_variacao = 1;
        while(1)
	begin
      		variacao=escala_variacao*($urandom_range(0,200)-100.0)/100.0; // real aleatorio entre -escala_variacao a +escala_variacao
		#(4*PERIODO_OSC*variacao);
		cod_sinal = $urandom_range(0,1);
	end



end


endmodule
*/