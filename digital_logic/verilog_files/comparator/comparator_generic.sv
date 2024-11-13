`timescale 1ns/10ps
module comparator_generic (first_word, second_word, out);

    input logic [3:0] first_word, second_word;
    output logic out;
    
    logic [3:0] xor_result;
    logic [1:0] mid_out;

    XOR2XLHVT xor_g_0(
        .A(first_word[0]),
        .B(second_word[0]),
        .Y(xor_result[0])
    );
    XOR2XLHVT xor_g_1(
        .A(first_word[1]),
        .B(second_word[1]),
        .Y(xor_result[1])
    );
    XOR2XLHVT xor_g_2(
        .A(first_word[2]),
        .B(second_word[2]),
        .Y(xor_result[2])
    );
    XOR2XLHVT xor_g_3(
        .A(first_word[3]),
        .B(second_word[3]),
        .Y(xor_result[3])
    );

    NOR2XLHVT nor_g_1(
        .A(xor_result[0]),
        .B(xor_result[1]),
        .Y(mid_out[0])
    );

    NOR2XLHVT nor_g_2(
        .A(xor_result[2]),
        .B(xor_result[3]),
        .Y(mid_out[1])
    );

    AND2XLHVT and_g_out(
        .A(mid_out[0]),
        .B(mid_out[1]),
        .Y(out)
    );   
endmodule