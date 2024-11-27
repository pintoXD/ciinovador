`timescale 1ns/10ps
 
module tb();
    reg clk=0, reset=0;
    wire TXRX_s;
    reg stop_1_2=0, dado_valido_tx=0;
    reg [7:0] dado_tx=0;
    wire dado_valido_rx, erro_rx, transmitindo, fim;
    wire [7:0] dado_rx;
initial 
begin
    $display("Comecou o teste");
    $dumpfile("test.vcd");
    $dumpvars(0,tb);    
    $timeformat(-9, 2, " ns", 20);
	#10ns;
	reset = 1;
	#50ns;
	reset = 0;
    #20ns;
        
	while(1)
    begin
        while($urandom_range(0,1))
            @(posedge clk); // espera proxima subida do clock antes de seguir
        
        dado_tx = $urandom_range(0,255);
        stop_1_2 = $urandom_range(0,1);
        @(posedge clk); // espera proxima subida do clock antes de seguir
        #2ns;
        @(posedge clk); // espera proxima subida do clock antes de seguir
        #2ns;
        dado_valido_tx = 1;
        $display("(%t) =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=",$time);
        $display("(%t) Dado a ser codificado TX: b%b",$time, dado_tx);
        @(posedge clk); // espera proxima subida do clock antes de seguir
        #2ns;
        dado_valido_tx = 0;
        @(negedge fim);
        
    end
	$finish();
end

initial
    #(10000ns) $finish();

always
begin
    #10ns;
    clk = !clk;
end

codificador_UART U1(
    .clk(clk),
    .reset(reset),
    .dado(dado_tx),
    .dado_valido(dado_valido_tx),
    .stop_1_2(stop_1_2),
    .TX(TXRX_s),
    .transmitindo(transmitindo),
    .fim(fim)
    );
    
decodificador_UART U2(
    .clk(clk),
    .reset(reset),
    .RX(TXRX_s),
    .dado(dado_rx),
    .dado_valido(dado_valido_rx),
    .erro(erro_rx)
    );
    
    // Monitora saídas do codificador UART
    always@(posedge transmitindo)
        $display("(%t) Inicio da transmissao UART. ",$time);
        
    always@(posedge fim)
        $display("(%t) Fim da transmissao UART. ",$time);
    
    
    // Monitora saídas do decodificador UART
    always@(posedge erro_rx)
        $display("(%t) Erro RX! ",$time);
    
    always@(posedge dado_valido_rx)
        $display("(%t) Dado valido RX: Dado RX b%b",$time, dado_rx);
    

endmodule


//    iverilog -o MeuProjeto -g2012 fontes/tb_uart.sv fontes/codificador_UART.sv fontes/decodificador_UART.sv