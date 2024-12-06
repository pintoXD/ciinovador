`timescale 1ns/10ps
 

module tb();
reg D = 0, EN=0, G = 0, CLK = 0, S = 0, R = 0;
reg Q1_latch, Q1_latch_sr, Q2_ff, Q3_ff_en, Q4_ff_en_sr, Q5_bloq, Q5_n_bloq;

initial
begin
	$display("Comecou o teste");
	$dumpfile("test.vcd");
	$dumpvars(0,tb);    
	$timeformat(-9, 2, " ns", 20);
	#10ns;
	D = 1;
	#10ns;
	D = 0;
	#10ns;
	D = 1;
	#10ns;
	G = 1;
	#2ns;
	D = 0;
	#10ns;
	D = 1;
	#10ns;
	D = 0;
	#2ns;
	EN= 1;
	#10ns;
	D = 1;
	#10ns;
	D = 0;
	#10ns;
	D = 1;
	#2ns;
	S = 1;
	#10ns;
	D = 0;
	#2ns;
	G = 0;
	#10ns;
	EN= 0;
	#2ns;
	D = 1;
	#2ns;
	R = 1;
	#10ns;
	D = 0;
	#10ns;
	D = 1;
	#2ns;
	S = 0;
	#10ns;
	D = 0;
	#10ns;
	$finish();
end

always
begin
	#4ns;
	CLK = !CLK;
end

// Latch tipo D
always@(G, D)
if(G)
	Q1_latch = D; // não requer else! Caso contrario mantém o valor
    
// Latch tipo D, SET e RESET
always@(G, D)
if(S)
	Q1_latch_sr = 1;
else
	if(R)
    	Q1_latch_sr = 0;
	else
    	if(G)
        	Q1_latch_sr = D; // não requer else! Caso contrario mantém o valor
    
// Flip-flop tipo D
always@(posedge CLK)
	Q2_ff <= D; // não requer else! Caso contrario mantém o valor

// Flip-flop tipo D com habilitador
always@(posedge CLK)
if (EN)
	Q3_ff_en <= D; // não requer else! Caso contrario mantém o valor
    
// Flip-flop tipo D com habilitador, SET e RESET
always@(posedge CLK, posedge R, posedge S)
if(S)
	Q4_ff_en_sr <= 1;
else
	if(R)
    	Q4_ff_en_sr <= 0;
	else
    	if (EN)
        	Q4_ff_en_sr <= D; // não requer else! Caso contrario mantém o valor
    
    
// Flip-flop tipo D com habilitador - exemplo atribuição bloqueante e não bloqueante
always@(posedge CLK)
begin
	$display("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
	$display("(%t)EN= %b D=%b",$time, EN, D);
	$display("(%t)Antes Q5_bloq vale %b",$time, Q5_bloq);
	$display("(%t)Antes Q5_bloq_n_bloq vale %b",$time, Q5_n_bloq);
	if (EN)
	begin
    	Q5_bloq = D;
    	Q5_n_bloq <= D;    	 
    	$display("(%t)Logo apos Q5_bloq vale %b",$time, Q5_bloq);
    	$display("(%t)Logo apos Q5_n_bloq vale %b",$time, Q5_n_bloq);
	end
	#1;
	$display("(%t)No passo seguinte de sim Q5_bloq vale %b",$time, Q5_bloq);
	$display("(%t)No passo seguinte de sim Q5_n_bloq vale %b",$time, Q5_n_bloq);
end

endmodule
