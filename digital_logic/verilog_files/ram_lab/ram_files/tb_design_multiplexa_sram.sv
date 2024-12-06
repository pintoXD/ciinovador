`timescale 1ns/10ps
 
module tb();
reg clk=0;

reg w_a=0 , r_a=0;// escreve / le
reg reset;
reg [7:0] d_a; // dado
reg [7:0] a_a; // endereço
reg w_b=0 , r_b=0 ;// escreve / le
reg [7:0] d_b; // dado
reg [7:0] a_b; // endereço
int i;
wire pronto_a, pronto_b;

initial 
begin
	    $display("Comecou o teste");
	    $dumpfile("test.vcd");
	    $dumpvars(0,tb);    
	    $timeformat(-9, 2, " ns", 20);
	reset =1;
    	@(posedge clk); #1;
	#50ns;
	reset=0;
    	@(posedge clk); #1;
	#1000ns;		// espera longa, a SRAM tem tempo de inicialização "analógico"
    	@(posedge clk); #1;
	a_a = 0;
	d_a = 'hAB;
 	w_a = 0;
    	@(posedge clk); #1;
 	w_a = 1;
    	@(posedge clk); #1;
	a_a = 1;
    	@(posedge clk); #1;
	a_a = 0;
    	@(posedge clk); #1;
        
	repeat(4)
        begin
		i = $urandom_range(2,8);
		while((i--)>0) 
		    @(posedge clk); // espera proxima subida do clock antes de seguir
		#1;
		a_a = $urandom_range(0,255);
		d_a    = $urandom_range(0,255);
	    	@(posedge clk); #1;
	 	w_a  = 0;
	    	@(posedge clk); #1;
	 	w_a  = 1;
	    	@(posedge clk); #1;
	 	r_a  = 0;
	    	@(posedge clk); #1;
	 	r_a  = 1;
	    	@(posedge clk); #1;
    	end
        
	repeat(4)
        begin
		i = $urandom_range(2,8);
		while((i--)>0) 
		    @(posedge clk); // espera proxima subida do clock antes de seguir
		#1;
		a_b = $urandom_range(0,255);
		d_b   = $urandom_range(0,255);
	    	@(posedge clk); #1;
	 	w_b  = 0;
	    	@(posedge clk); #1;
	 	w_b  = 1;
	    	@(posedge clk); #1;
	 	r_b  = 0;
	    	@(posedge clk); #1;
	 	r_b  = 1;
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


always @(posedge pronto_a)
begin
	#2 w_a = 0;
	#2 r_a = 0;
end
always @(posedge pronto_b)
begin
	#2 w_b = 0;
	#2 r_b = 0;
end

always
begin
    #5;
    clk = !clk;
end

design_multiplexa_sram U1
( clk, reset,
w_a , r_a ,// escreve / le
d_a, // dado
a_a, // endereço
w_b , r_b ,// escreve / le
d_b, // dado
a_b, // endereço
,  // saída
pronto_a,
,  // saída
pronto_b);

//    $display("(%t) %b",$time, clk);

endmodule


