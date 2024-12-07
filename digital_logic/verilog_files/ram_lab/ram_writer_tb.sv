/* verilator lint_off IMPLICIT */
`timescale 1ns/10ps
module ram_writer_tb();

logic clk, reset, fim;
logic [7:0] x;

ram_writer DUT(
    .clk(clk),
    .reset(reset),
    .x(x),
    .fim(fim)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("ram_writer_tb.vcd");
    $dumpvars(0, ram_writer_tb);

  	reset = 0;
  	#10;
  	reset = 1;
  	#10;
  	
  
    $display("Current Step: %d", DUT.etapa_atual_ff);
    $display("Content of word_counter: %h", DUT.word_counter);
    $display("Content of x: %h", x);
    #10;
    
    while(DUT.word_counter < 8'hA9)begin
        // @(posedge clk)
        $display("Current Step: %d", DUT.etapa_atual_ff);
        $display("Content of word_counter: %h", DUT.word_counter);
        $display("Content of x: %h", x);
        #10;
    end
  
  	
  	#2000;
  
  
  	$display("Current Step: %d", DUT.etapa_atual_ff);
    $display("Content of word_counter: %h", DUT.word_counter);
    $display("Content of x: %h", x);
  
    assert(x==8'hA8) else $fatal(1, "Test Case Failed");
    #10;

    #100;
    $finish; 
end

endmodule
