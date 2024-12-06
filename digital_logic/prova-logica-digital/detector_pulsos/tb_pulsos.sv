`timescale 1ns/10ps
 
module tb();
    reg clk=0, reset=0;
    reg a,b;
initial 
begin
    int contador;
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
        contador=$urandom_range(1,2);
        while(contador--)
            @(posedge clk); // espera proxima subida do clock antes de seguir
        #2ns;
        a = ($urandom_range(0,2)==0);
        b = ($urandom_range(0,2)==0);
        @(posedge clk); // espera proxima subida do clock antes de seguir
        #2ns;
        a=0;
        b=0;
        
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

detector_de_pulso U1(
    .clk(clk),
    .reset(reset),
    .a(a),
    .b(b),
    .seq_a(),
    .seq_b()
    );
    
    

endmodule


//    iverilog -o MeuProjeto -g2012 fontes/tb_uart.sv fontes/codificador_UART.sv fontes/decodificador_UART.sv