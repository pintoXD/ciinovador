`timescale 1s/1ms
 
module tb_sinaleira2();
logic clk=1, reset=0, pedestre=0, pulso=0;

sinaleira2 U1(
    .clk(clk),
    .pedestre(pedestre),
    .reset(reset),

    .rua_1_vermelho(), 
    .rua_1_amarelo(),
    .rua_1_verde(), 

    .rua_2_vermelho(), 
    .rua_2_amarelo(), 
    .rua_2_verde(),

    .pedestre_vermelho(),
    .pedestre_2_verde()
);


initial 
begin
    $display("Comecou o teste");
    $dumpfile("test.vcd");
    $dumpvars(0,tb_sinaleira2);    
    $timeformat(-9, 2, " s", 20);
	#1s;
	reset = 1;
	#5s;
	reset = 0;
    #10s;
        
	while(1)
    begin
        pulso = 1;
        @(posedge clk); // espera proxima subida do clock antes de seguir
        #2s;
        pulso = 0;
        #($urandom_range(20,30));
    end
	$finish();
end

initial
    #50s $finish();

always
begin
    #500ms;
    clk = !clk;
end


endmodule


//    $display("(%t) %b",$time, clk);