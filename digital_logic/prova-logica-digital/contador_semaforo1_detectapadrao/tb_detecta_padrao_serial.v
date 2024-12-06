`timescale 1ns/10ps
 
module tb();
reg clk=0, reset=0, x=0;

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
        @(posedge clk); // espera proxima subida do clock antes de seguir
        #2ns;
        x = $urandom_range(0,1);
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

detecta_padrao_serial U1(
    .clk(clk),
    .x(x),
    .reset(reset)
    );

endmodule


//    $display("(%t) %b",$time, clk);