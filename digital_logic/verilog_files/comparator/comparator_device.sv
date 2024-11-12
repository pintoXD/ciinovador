`timescale 1ns/10ps
module comparator_device (in_word, out);

    input logic [3:0] in_word;
    output logic out;
    
    logic [3:0] pattern_word = 4'b0101;
    logic [3:0] xor_result;
    logic [1:0] mid_out;

    XOR2XLHVT xor_g_0(
        .A(in_word[0]),
        .B(pattern_word[0]),
        .Y(xor_result[0])
    );
    XOR2XLHVT xor_g_1(
        .A(in_word[1]),
        .B(pattern_word[1]),
        .Y(xor_result[1])
    );
    XOR2XLHVT xor_g_2(
        .A(in_word[2]),
        .B(pattern_word[2]),
        .Y(xor_result[2])
    );
    XOR2XLHVT xor_g_3(
        .A(in_word[3]),
        .B(pattern_word[3]),
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