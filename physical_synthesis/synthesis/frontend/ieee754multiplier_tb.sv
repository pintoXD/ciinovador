`timescale 1ns/1ps
module multiplier_tb (
);

logic [31:0] input_a;
logic [31:0] input_b;
logic [31:0] result;
logic clk, reset;

shortreal mock_a;
shortreal mock_b;

multiplier DUT (
    .clk(clk),
    .reset(reset),
    .input_a(input_a),
    .input_b(input_b),
    .result(result)
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

    mock_a = 7.5;
    mock_b = 2.2;

    input_a = $shortrealtobits(mock_a);
    input_b = $shortrealtobits(mock_b);

    #10;
    $display("Result Bits: %b", result);
    $display("Result: %f", $bitstoshortreal(result));
    $display("Expected: %f", mock_a * mock_b);

    // $finish;

    #10;

    mock_a = 3.1415;
    mock_b = 0.792;

    input_a = $shortrealtobits(mock_a);
    input_b = $shortrealtobits(mock_b);

    #10;
    $display("Result Bits: %b", result);
    $display("Result: %f", $bitstoshortreal(result));
    $display("Expected: %f", mock_a * mock_b);

    #10;

    mock_a = 0.0;
    mock_b = 3.1415;

    input_a = $shortrealtobits(mock_a);
    input_b = 32'b0_11111001_11100000000000000000000;//$shortrealtobits(mock_b);

    #10;
    $display("Result Bits: %b", result);
    $display("Result: %f", $bitstoshortreal(result));
    $display("Expected: %f", mock_a * mock_b);

    $finish;

end



endmodule