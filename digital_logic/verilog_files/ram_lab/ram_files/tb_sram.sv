`timescale 1ns/10ps
 
module tb();
reg clk=0;
wire [7:0] q;
reg [7:0] d;
reg [7:0] addr;
reg web=1;
reg enb;
reg oeb;
int i;

initial 
begin
    $display("Comecou o teste");
    $dumpfile("test.vcd");
    $dumpvars(0,tb);    
    $timeformat(-9, 2, " ns", 20);
	#10ns;
    	@(posedge clk); #1;
	oeb = 1;
	#50ns;
    	@(posedge clk); #1;
	oeb = 0;
	#50ns;
    	@(posedge clk); #1;
	#1000ns;		// espera longa, a SRAM tem tempo de inicialização "analógico"
    	@(posedge clk); #1;
	enb = 0;
	addr = 0;
	d = 'hAB;
 	web = 0;
    	@(posedge clk); #1;
 	web = 1;
    	@(posedge clk); #1;
	addr = 1;
    	@(posedge clk); #1;
	addr = 0;
    	@(posedge clk); #1;
        
	while(1)
        begin
		i = $urandom_range(2,8);
		while((i--)>0) 
		    @(posedge clk); // espera proxima subida do clock antes de seguir
		#1;
		addr = $urandom_range(0,255);
		d    = $urandom_range(0,255);
	    	@(posedge clk); #1;
	 	web  = 0;
	    	@(posedge clk); #1;
	 	web  = 1;
	    	@(posedge clk); #1;
    	end
end

initial
    #2000 $finish();

int x;
initial
begin
	
	for(x=0;x<256;x=x+1)
	begin
	$display("%h",$urandom_range(0,255));
	end
        
end

always
begin
    #5;
    clk = !clk;
end

SPRAM256X8 
/*	#(	// lista de parâmetros
	.ram_init_file("spram_init_file.hex")	// Esse não é um comportamento físico na inicialização, mas pode ser feito quando desejado para acelerar a simulação para começar com a conteúdo conhecido na memória.
	) 
*/
	U1    (	// lista de entradas/saídas			
	.Q(q),		// RAM data output
	.D(d),		// RAM data input bus
	.ADR(addr),	// RAM address bus
	.CLK(clk),	// RAM clock
	.ENB(enb),	// RAM enable
	.WEB(web),	// RAM  write enable, 0-active
	.OEB(oeb),	// RAM  output enable, 0-active
	.RTEST(),	// RAM reset test output
	.ramvdd(1'b1),	// RAM power
	.ramgnd(1'b0));	// RAM ground


//    $display("(%t) %b",$time, clk);

endmodule


