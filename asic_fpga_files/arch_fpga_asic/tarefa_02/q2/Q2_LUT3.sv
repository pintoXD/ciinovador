`timescale 1ns/1ps
module Q2_LUT3(A3, A2, A1, A0, OUT);

input logic A0, A1, A2, A3;
output logic OUT;

logic nor_0_out, nor_1_out, and_0_out, and_1_out, or_0_out;

NOR_3 NOR_0_INST(.A(A1), .B(A2), .C(A3), .OUT(nor_0_out));
AND_3 AND_0_INST(.A(A1), .B(A2), .C(A3), .OUT(and_0_out));

NOR_3 NOR_1_INST(.A(A0), .B(A2), .C(A3), .OUT(nor_1_out));
AND_3 AND_1_INST(.A(A0), .B(A2), .C(A3), .OUT(and_1_out));


OR_3 OR_0_INST(.A(nor_0_out), .B(and_0_out), .C(nor_1_out), .OUT(or_0_out));
OR_3 OR_1_INST(.A(or_0_out), .B(and_1_out), .C(1'b0), .OUT(OUT));




endmodule
