`timescale 1ns/1ps
module multiplier_tb (
);

logic clk, rst_n;
logic [31:0] a_i;
logic [31:0] b_i;
logic start_i;
logic done_o;
logic nan_o;
logic inifinit_o;
logic overflow_o;
logic underflow_o;
logic [31:0] product_o;


ieee754multiplier DUT (
    .clk(clk), 
    .rst_n(rst_n),
    .a_i(a_i),
    .b_i(b_i),
    .start_i(start_i),
    .done_o(done_o),
    .nan_o(nan_o),
    .inifinit_o(inifinit_o),
    .overflow_o(overflow_o),
    .underflow_o(underflow_o),
    .product_o(product_o)
);

initial begin
    clk = 0;
    forever begin
        #1ns;
        clk = ~clk;
    end
end



initial begin

    rst_n = 0;
    #10;
    rst_n = 1;
    #10;

    a_i = 7.5;
    b_i = 2.2;

    input_a = $shortrealtobits(a_i);
    input_b = $shortrealtobits(b_i);

    #10;
    $display("product_o Bits: %b", product_o);
    $display("product_o: %f", $bitstoshortreal(product_o));
    $display("Expected: %f", a_i * b_i);

    // $finish;

    #10;

    a_i = 3.1415;
    b_i = 0.792;

    input_a = $shortrealtobits(a_i);
    input_b = $shortrealtobits(b_i);

    #10;
    $display("product_o Bits: %b", product_o);
    $display("product_o: %f", $bitstoshortreal(product_o));
    $display("Expected: %f", a_i * b_i);

    #10;

    a_i = 0.0;
    b_i = 3.1415;

    input_a = $shortrealtobits(a_i);
    input_b = 32'b0_11111001_11100000000000000000000;//$shortrealtobits(b_i);

    #10;
    $display("product_o Bits: %b", product_o);
    $display("product_o: %f", $bitstoshortreal(product_o));
    $display("Expected: %f", a_i * b_i);

    $finish;

end



endmodule