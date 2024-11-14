`timescale 1ps/1ps

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


module vote_counter(
input logic [3:0] input_word,
output logic [4:0] out_result
);
logic out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7;


// out_result = 4'b0000;

    comparator_generic cmp_inst_0( .first_word(input_word), .second_word(3'b000), .out(out_0));
    comparator_generic cmp_inst_1( .first_word(input_word), .second_word(3'b001), .out(out_1));
    comparator_generic cmp_inst_2( .first_word(input_word), .second_word(3'b010), .out(out_2));
    comparator_generic cmp_inst_3( .first_word(input_word), .second_word(3'b011), .out(out_3));
    comparator_generic cmp_inst_4( .first_word(input_word), .second_word(3'b100), .out(out_4));
    comparator_generic cmp_inst_5( .first_word(input_word), .second_word(3'b101), .out(out_5));
    comparator_generic cmp_inst_6( .first_word(input_word), .second_word(3'b110), .out(out_6));
    comparator_generic cmp_inst_7( .first_word(input_word), .second_word(3'b111), .out(out_7));

    assign out_result = {out_7, out_6 | out_5 | out_3, out_4 | out_2 | out_1, out_0};


// always_comb begin

//     // case (input_word)
//     //     3'b000: out_result = 4'b0001;
//     //     3'b001: out_result = 4'b0010;
//     //     3'b010: out_result = 4'b0010;
//     //     3'b011: out_result = 4'b0100;
//     //     3'b100: out_result = 4'b0010;
//     //     3'b101: out_result = 4'b0100;
//     //     3'b110: out_result = 4'b0100;
//     //     3'b111: out_result = 4'b1000;
//     // endcase






// end

endmodule
