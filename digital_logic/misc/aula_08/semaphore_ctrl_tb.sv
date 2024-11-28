/* verilator lint_off PINMISSING */
/* verilator lint_off BLKSEQ */
/* verilator lint_off SYNCASYNCNET */
`timescale 1ns/10ps
 
module semaphore_ctrl_tb();
reg clk=0, reset=0, pulso=0;

initial 
begin
    $display("Comecou o teste");
    $dumpfile("test.vcd");
    $dumpvars(0,semaphore_ctrl);    
    $timeformat(-9, 2, " ns", 20);
	#10ns;
	reset = 1;
	#50ns;
	reset = 0;
    #20ns;
        
	while(1)
    begin
        pulso = 1;
        @(posedge clk); // espera proxima subida do clock antes de seguir
        #2ns;
        pulso = 0;
        // #($urandom_range(20,30));
        #20ns;
    end
	$finish();
end

initial
    #1000 $finish();

always
begin
    #10ns;
    clk = !clk;
end

semaphore_ctrl U1(
    .clk(clk),
    .pulso(pulso),
    .reset(reset)
    );

endmodule


//    $display("(%t) %b",$time, clk);
