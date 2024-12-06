`timescale 1ns/10ps
 
module design_multiplexa_sram(
input clk,
input reset,
input w_a , r_a ,// escreve / le
input [7:0] d_a, // dado
input [7:0] a_a, // endereço
input w_b , r_b ,// escreve / le
input [7:0] d_b, // dado
input [7:0] a_b, // endereço
output reg [7:0] q_a,  // saída
output reg pronto_a,
output reg [7:0] q_b,  // saída
output reg pronto_b
);

reg web;
wire [7:0] q;
reg [7:0] d;
reg [7:0] a;
reg [7:0] prox_q_a;
reg [7:0] prox_q_b;

reg [3:0] estado_atual, prox_estado;	// cada bit é uma operação



always_comb
if(reset)
begin
	prox_estado = 0;
	pronto_a = 0;
	pronto_b = 0;
	d = 'hx;	// não importa!
	web = 1; // por padrão não escreve
	prox_q_a = 0;
	prox_q_b = 0;
	a = 'hx;


end
else
begin
	prox_estado = 0;
	pronto_a = 0;
	pronto_b = 0;
	prox_q_a = 0;
	prox_q_b = 0;
	a = 'hx;
	d = 'hx;	// não importa!
	web = 1; // por padrão não escreve
	case(estado_atual)
	0: begin // aguarda operação
		if(w_b)
			prox_estado = 3;
		if(r_b)
			prox_estado = 4;
		if(w_a)
			prox_estado = 1;
		if(r_a)
			prox_estado = 2;
		
	end
	1:begin	//w_a
		d = d_a;
		a = a_a;
		web = 0;
		prox_estado = 6;
	end
	2:begin	//r_a
		d = d_a;
		a = a_a;
		prox_estado = 6;
		prox_q_a = q;
	end
	3:begin	//w_b
		d = d_b;
		a = a_b;
		web = 0;
		prox_estado = 7;
	end
	4:begin	//r_b
		d = d_b;
		a = a_b;
		prox_estado = 7;
		prox_q_b = q;
	end


	6:begin	// confirma operação interface A
		pronto_a=1;
		prox_estado = 0;
	end
	7:begin	// confirma operação interface B
		pronto_b=1;
		prox_estado = 0;
	end
	default: 
		prox_estado = 0;
	endcase
end

always_ff@(posedge clk)
begin
	estado_atual <= prox_estado;
	q_a <= prox_q_a;
	q_b <= prox_q_b;
end

SPRAM256X8 
/*	#(	// lista de parâmetros
	.ram_init_file("spram_init_file.hex")	// Esse não é um comportamento físico na inicialização, mas pode ser feito quando desejado para acelerar a simulação para começar com a conteúdo conhecido na memória.
	) 
*/
	U1    (	// lista de entradas/saídas			
	.Q(q),		// RAM data output
	.D(d),		// RAM data input bus
	.ADR(a),	// RAM address bus
	.CLK(clk),	// RAM clock
	.ENB(1'b0),	// RAM enable
	.WEB(web),	// RAM  write enable, 0-active
	.OEB(1'b0),	// RAM  output enable, 0-active
	.RTEST(),	// RAM reset test output
	.ramvdd(1'b1),	// RAM power
	.ramgnd(1'b0));	// RAM ground


//    $display("(%t) %b",$time, clk);

endmodule


