`timescale 1ps/1ps
module vote_counter(input_word, out_result);

input logic [2:0] input_word;
output logic [3:0] out_result;
    /////////////////// Bit 0: !(A + B + C) //////////////
    NOR3XLHVT out_0(
        .A(input_word[0]),
        .B(input_word[1]),
        .C(input_word[2]),
        .Y(out_result[0])
    );


    //////////// Bit 1: (A * !B * !C) + (!A * !B * C ) + (!A * B * !C)//////////////////
    // Inverting A, B, C
    logic mid_bit1_not_a_out;
    logic mid_bit1_not_b_out;
    logic mid_bit1_not_c_out;

    INVX1HVT bit_1_mid_a(
        .A(input_word[0]),
        .Y(mid_bit1_not_a_out)
    );
    INVX1HVT bit_1_mid_b(
        .A(input_word[1]),
        .Y(mid_bit1_not_b_out)
    );
    INVX1HVT bit_1_mid_c(
        .A(input_word[2]),
        .Y(mid_bit1_not_c_out)
    );

    // ANDing A and !B and !C
    logic mid_bit1_and0_out;
    AND3XLHVT bit_1_and0(
        .A(input_word[0]),
        .B(mid_bit1_not_b_out),
        .C(mid_bit1_not_c_out),
        .Y(mid_bit1_and0_out)
    );

    // ANDing !A and !B and C
    logic mid_bit1_and1_out;
    AND3XLHVT bit_1_and1(
        .A(mid_bit1_not_a_out),
        .B(mid_bit1_not_b_out),
        .C(input_word[2]),
        .Y(mid_bit1_and1_out)
    );

    // ANDing !A and B and !C
    logic mid_bit1_and2_out;
    AND3XLHVT bit_1_and2(
        .A(mid_bit1_not_a_out),
        .B(input_word[1]),
        .C(mid_bit1_not_c_out),
        .Y(mid_bit1_and2_out)
    );

    // ORing the past results and storing in out_result[1]
    OR3XLHVT bit_1_or(
        .A(mid_bit1_and0_out),
        .B(mid_bit1_and1_out),
        .C(mid_bit1_and2_out),
        .Y(out_result[1])
    );

    //////////// Bit 2: (A * !B * C) + (!A * B * C ) + (A * B * !C) //////////////////
    // Inverting A, B, C
    logic mid_bit2_not_a_out;
    logic mid_bit2_not_b_out;
    logic mid_bit2_not_c_out;

    INVX1HVT bit_2_mid_inv_a(
        .A(input_word[0]),
        .Y(mid_bit2_not_a_out)
    );
    INVX1HVT bit_2_mid_inv_b(
        .A(input_word[1]),
        .Y(mid_bit2_not_b_out)
    );
    INVX1HVT bit_2_mid_inv_c(
        .A(input_word[2]),
        .Y(mid_bit2_not_c_out)
    );

    // ANDing A, !B and C
    logic mid_bit2_and0_out;
    AND3XLHVT bit_2_and0(
        .A(input_word[0]),
        .B(mid_bit2_not_b_out),
        .C(input_word[2]),
        .Y(mid_bit2_and0_out)
    );

    // ANDing !A, B and C
    logic mid_bit2_and1_out;
    AND3XLHVT bit_2_and1(
        .A(mid_bit2_not_a_out),
        .B(input_word[1]),
        .C(input_word[2]),
        .Y(mid_bit2_and1_out)
    );

    // ANDing A, B and !C
    logic mid_bit2_and2_out;
    AND3XLHVT bit_2_and2(
        .A(input_word[0]),
        .B(input_word[1]),
        .C(mid_bit2_not_c_out),
        .Y(mid_bit2_and2_out)
    );

    // ORing A with  (A * !B * C)+(!A * B * C)+(A * B * !C) and storing in out_result[2]
    OR3XLHVT bit_2_or(
        .A(mid_bit2_and0_out),
        .B(mid_bit2_and1_out),
        .C(mid_bit2_and2_out),
        .Y(out_result[2])
    );


    //////////// Bit 3: A * B * C //////////////////
    // ANDing A, B and C and storing in out_result[3]
    AND3XLHVT bit_3_and(
        .A(input_word[0]),
        .B(input_word[1]),
        .C(input_word[2]),
        .Y(out_result[3])
    );

endmodule
