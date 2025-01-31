module ieee754_to_float;

    // Example IEEE 754 binary floating point number (32-bit)
    logic [31:0] ieee754_num = 32'b01000001000000000000000000000000;
    // logic [31:0] ieee754_num = 32'b01000001010010010000111111011011;

    // Components of the IEEE 754 number
    logic sign;
    logic [7:0] exponent;
    logic [22:0] mantissa;

    // Floating point result
    shortreal float_result;

    initial begin
        // Extract the sign, exponent, and mantissa
        sign = ieee754_num[31];
        exponent = ieee754_num[30:23];
        mantissa = ieee754_num[22:0];

        // Convert to floating point number
        float_result = (sign ? -1 : 1) * (1.0 + mantissa / (2 ** 23)) * (2.0 ** (exponent - 127));

        // Print the result
        $display("Floating Point Result: %f", $bitstoshortreal(ieee754_num));
        $display("IEEE 754 Number: %b", $shortrealtobits(8.0));
        

        $display("IEEE 754 Number: %b", ieee754_num);
        $display("Floating Point Result: %f", float_result);
    end

endmodule