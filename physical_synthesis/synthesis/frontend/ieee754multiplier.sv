module ieee754multiplier (
    input logic clk, reset,
    input logic [31:0] input_a,
    input logic [31:0] input_b,
    output logic [31:0] result
);
    
logic signal_a, signal_b;
logic [7:0] exponent_a, exponent_b; //The 24th bit is unused until the multiplication is computed
logic [23:0] mantissa_a, mantissa_b; //The 24th bit is unused until the multiplication is computed
logic [22:0] mantissa_result;
logic [47:0] mantissa_temp;
logic [9:0] exponent_temp;

always_comb begin : blockName
    mantissa_temp = mantissa_temp; //the result is 0
    exponent_temp = exponent_temp; //the exponent is 0

    signal_a = input_a[31]; //extract the sign bit from input_a
    signal_b = input_b[31]; //extract the sign bit from input_b

    exponent_a = input_a[30:23]; //extract the exponent from input_a
    exponent_b = input_b[30:23]; //extract the exponent from input_b

    mantissa_a[23] = 1;
    mantissa_a[22:0] = input_a[22:0];  //extract the mantissa from input_a adding the implict 1 at the beginning
    mantissa_b[23] = 1;
    mantissa_b[22:0] = input_b[22:0];  //extract the mantissa from input_b adding the implict 1 at the beginning

    if (mantissa_a[22-:23] == 0 || mantissa_b[22-:23] == 0) begin //if any of the mantissas is 0
        mantissa_temp = 0; //the result is 0
        exponent_temp = 0; //the exponent is 0
    end else begin
        mantissa_temp = mantissa_a * mantissa_b; //multiply the mantissa
        exponent_temp = exponent_a + exponent_b - 127; //add the exponents and subtract the bias

        if (mantissa_temp[47] == 1) begin //if the most significant bit of the result is 1
            mantissa_temp = mantissa_temp >> 1; //shift the result to the right
            exponent_temp = exponent_temp + 1; //increment the exponent
        end

    end

    // result[31] = signal_a ^ signal_b; //XOR the sign bits to get the sign of the result
    // result[30:23] =  exponent_temp[7:0]; //add the exponents and subtract the bias
    // result[22:0] = mantissa_temp[45:23]; //extract the 24 most significant bits of the result

end

always_ff @(posedge clk, posedge reset) begin : clocked_block

    if (reset) begin
        result <= 32'b0;
    end else begin
        result[31] <= signal_a ^ signal_b; //XOR the sign bits to get the sign of the result
        result[30:23] <=  exponent_temp[7:0]; //add the exponents and subtract the bias
        result[22:0] <= mantissa_temp[45:23]; //extract the 24 most significant bits of the result
    end
end





endmodule