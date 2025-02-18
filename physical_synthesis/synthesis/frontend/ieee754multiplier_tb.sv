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


shortreal mock_a;
shortreal mock_b;

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
    #10;
        rst_n = 0;
    #10;
        start_i = 0;
        rst_n = 1;
    #10;
        start_i = 1;


    mock_a = 7.5;
    mock_b = 2.2;

    a_i = $shortrealtobits(mock_a);
    b_i = $shortrealtobits(mock_b);

    #10;
    $display("product_o Bits: %b", product_o);
    $display("product_o: %f", $bitstoshortreal(product_o));
    $display("Expected: %f", mock_a * mock_b);

    // $finish;

    #10;

    mock_a = 3.1415;
    mock_b = 0.792;

    a_i = $shortrealtobits(mock_a);
    b_i = $shortrealtobits(mock_b);

    #10;
    $display("product_o Bits: %b", product_o);
    $display("product_o: %f", $bitstoshortreal(product_o));
    $display("Expected: %f", mock_a * mock_b);

    #10;

    mock_a = 0.0;
    mock_b = 3.1415;

    a_i = $shortrealtobits(mock_a);
    b_i = 32'b0_11111001_11100000000000000000000;//$shortrealtobits(mock_b);

    #10;
    $display("product_o Bits: %b", product_o);
    $display("product_o: %f", $bitstoshortreal(product_o));
    $display("Expected: %f", mock_a * mock_b);

    $finish;

end



endmodule