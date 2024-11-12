module comparator_generic (first_word, second_word, out);

    input logic [3:0] first_word, second_word;
    output logic out;
    
    logic [3:0] xor_result;
    logic [1:0] mid_out;

    xorgate xor_g_0(
        .a(first_word[0]),
        .b(second_word[0]),
        .c(xor_result[0])
    );
    xorgate xor_g_1(
        .a(first_word[1]),
        .b(second_word[1]),
        .c(xor_result[1])
    );
    xorgate xor_g_2(
        .a(first_word[2]),
        .b(second_word[2]),
        .c(xor_result[2])
    );
    xorgate xor_g_3(
        .a(first_word[3]),
        .b(second_word[3]),
        .c(xor_result[3])
    );

    norgate nor_g_1(
        .a(xor_result[0]),
        .b(xor_result[1]),
        .c(mid_out[0])
    );

    norgate nor_g_2(
        .a(xor_result[2]),
        .b(xor_result[3]),
        .c(mid_out[1])
    );

    andgate and_g_out(
        .a(mid_out[0]),
        .b(mid_out[1]),
        .c(out)
    );   
endmodule