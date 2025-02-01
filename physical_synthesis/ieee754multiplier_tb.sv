module multiplier_tb (
);

logic [31:0] input_a;
logic [31:0] input_b;
logic [31:0] result;

shortreal mock_a;
shortreal mock_b;

multiplier DUT (
    .input_a(input_a),
    .input_b(input_b),
    .result(result)
);


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

    $finish;

end



endmodule