`timescale 1ps/1ps
module Q3_MIX_LUTS(A, B, CIN, S, COUT);

input logic A, B, CIN;
output logic S, COUT;

logic xor_0_out, xor_1_out, and_0_out, and_1_out, and_2_out, or_out;

LUT2 #(.INIT(4'b0110)) XOR_0_INST( .I0(CIN), .I1(B), .O(xor_0_out));
LUT2 #(.INIT(4'b0110)) XOR_1_INST( .I0(A), .I1(xor_0_out), .O(S));

LUT2 #(.INIT(4'b1000)) AND_0_INST( .I0(B), .I1(CIN), .O(and_0_out));
LUT2 #(.INIT(4'b1000)) AND_1_INST( .I0(B), .I1(A), .O(and_1_out));
LUT2 #(.INIT(4'b1000)) AND_2_INST( .I0(A), .I1(CIN), .O(and_2_out));

LUT3 #(.INIT(8'b11111110)) OR_INST( .I0(and_0_out), .I1(and_1_out), .I2(and_2_out), .O(COUT));

endmodule