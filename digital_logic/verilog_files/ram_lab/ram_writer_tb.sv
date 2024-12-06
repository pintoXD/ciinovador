/* verilator lint_off IMPLICIT */
`timescale 1ns/10ps
module ram_writer_tb();

// reg clk=0;
// wire [7:0] q;
// reg [7:0] d;
// reg [7:0] addr;
// reg web=1;
// reg enb;
// reg oeb;
// int i;

logic clk, reset, fim;
logic [7:0] x;

ram_writer DUT(
    .clk(clk),
    .reset(reset),
    .x(x),
    .fim(fim)
);

// SPRAM256X8 
// /*	#(	// lista de parâmetros
// 	.ram_init_file("spram_init_file.hex")	// Esse não é um comportamento físico na inicialização, mas pode ser feito quando desejado para acelerar a simulação para começar com a conteúdo conhecido na memória.
// 	) 
// */
// 	U1    (	// lista de entradas/saídas			
// 	.Q(q),		// RAM data output
// 	.D(d),		// RAM data input bus
// 	.ADR(addr),	// RAM address bus
// 	.CLK(clk),	// RAM clock
// 	.ENB(enb),	// RAM enable
// 	.WEB(web),	// RAM  write enable, 0-active
// 	.OEB(oeb),	// RAM  output enable, 0-active
// 	.RTEST(),	// RAM reset test output
// 	.ramvdd(1'b1),	// RAM power
// 	.ramgnd(1'b0));	// RAM ground


// //    $display("(%t) %b",$time, clk);


initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("ram_writer_tb.vcd");
    $dumpvars(0, ram_writer_tb);
    /*
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
    $display("Current Q: %h", q);
 	web = 0;
    	@(posedge clk); #1;
 	web = 1;
    	@(posedge clk); #1;
	addr = 1;
    	@(posedge clk); #1;
	addr = 0;
    // 	@(posedge clk); #1;
    // web = 1;
    */
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
    /*
    @(posedge clk)
    web = 0;
    addr = 8'h10;
    d = 8'hA9;
    
    @(posedge clk)
    web = ~web;
    @(posedge clk)
    @(posedge clk)
    $display("Current Q: %h", q);

    // #30;

    @(posedge clk)
    web = 0;
    addr = 8'h07;
    d = 8'hA8;
 
    @(posedge clk)
    web = ~web;
    @(posedge clk)
    @(posedge clk)
    $display("Current Q: %h", q);
    
    // #30;

    @(posedge clk)
    web = 0;
    addr = 8'h04;
    d = 8'hA7;
    
    @(posedge clk)
    web = ~web;
    @(posedge clk)
    @(posedge clk)
    $display("Current Q: %h", q);
    
    @(posedge clk)
    addr = 8'h05;
    d = 8'hA1;
    web = 0;
    #20;
    web = ~web;
    #5;
    $display("Current Q: %h", q);
    
    @(posedge clk)
    addr = 8'h06;
    d = 8'hBF;
    web = 0;
    #20;
    web = ~web;
    #5;
    $display("Current Q: %h", q);

    @(posedge clk)
    addr = 8'h08;
    d = 8'hF2;
    web = 0;
    #20;
    web = ~web;
    #5;
    $display("Current Q: %h", q);

    */


    // #20;
    // @(posedge clk)
    // $display("Current Step: %d", DUT.etapa_atual_ff);
    // $display("Content of word_counter: %h", DUT.word_counter);
    // $display("Content of x: %h", x);

    // #20;
    // @(posedge clk)
    // $display("Current Step: %d", DUT.etapa_atual_ff);
    // $display("Content of word_counter: %h", DUT.word_counter);
    // $display("Content of x: %h", x);

    // @(posedge clk)
    // $display("Current Step: %d", DUT.etapa_atual_ff);
    // $display("Content of word_counter: %h", DUT.word_counter);
    // $display("Content of x: %h", x);
    // #10;

    // @(posedge clk)
    // $display("Current Step: %d", DUT.etapa_atual_ff);
    // $display("Content of word_counter: %h", DUT.word_counter);
    // $display("Content of x: %h", x);
    // #10;

    // @(posedge clk)
    // $display("Current Step: %d", DUT.etapa_atual_ff);
    // $display("Content of word_counter: %h", DUT.word_counter);
    // $display("Content of x: %h", x);
    // #10;
    #1000;
    $finish; 
end

endmodule
