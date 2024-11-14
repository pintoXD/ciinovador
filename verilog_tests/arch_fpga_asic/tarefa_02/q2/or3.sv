module OR_3(A, B, C, OUT);

input logic A, B, C;
output logic OUT;

LUT3 #(.INIT(8'hFE)) OR_0_INST( .I0(A), .I1(B), .I2(C), .O(OUT));

endmodule