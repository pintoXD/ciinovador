module moduleName (
    input logic [31:0] input_a,
    input logic [31:0] input_b,
    output logic [31:0] result
);
    
logic signal_a, signal_b;
logic [7:0] exponent_a, exponent_b;
logic [22:0] mantissa_a, mantissa_b;
logic [22:0] mantissa_result;

always_comb begin : blockName
    signal_a = input_a[31]; //extract the sign bit from input_a
    signal_b = input_b[31]; //extract the sign bit from input_b

    exponent_a = input_a[30:23]; //extract the exponent from input_a
    exponent_b = input_b[30:23]; //extract the exponent from input_b

    mantissa_a = input_a[22:0];  //extract the mantissa from input_a
    mantissa_b = input_b[22:0];  //extract the mantissa from input_b   

    



    //multiply the mantissa





    
end





endmodule