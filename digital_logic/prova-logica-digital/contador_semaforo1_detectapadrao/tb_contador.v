`timescale 1ns/10ps
 
module tb();
reg clk=0, reset=0;
reg [4:0] valor_maximo=3;
int i;  // é ilegal em Verilog, para usar esta estrutura compilar explicitamente dizendo que SystemVerilog: parâmetro adicional "-sv"

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
    #80ns;
        
	while(1)
    begin
        @(posedge clk); // espera proxima subida do clock antes de seguir
        #2ns;
        valor_maximo = $urandom_range(10,20);
        
        for(i=0;i< (valor_maximo)+5; i=i+1)
            @(posedge clk); // espera proxima subida do clock antes de seguir
            
    end
	$finish();
end

initial
    #10000 $finish();

always
begin
    #10ns;
    clk = !clk;
end

contador U1(
    .clk(clk),      // relogio do sistema
    .reset(reset),  // quando em nível alto reseta
    .valor_maximo(valor_maximo), // máxima contagem
    .contagem(),    // contagem atual
    .fim()            // valor_maximo atingido
    );

endmodule


//    $display("(%t) %b",$time, clk);