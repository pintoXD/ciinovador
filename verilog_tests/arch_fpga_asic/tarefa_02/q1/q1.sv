`timescale 1ps/1ps
module Q1_LUT2(A, B, C, D, X);

  input logic A, B, C, D;
  output logic X;

  logic nand_0_out, nand_1_out, nand_2_out, nor_0_out;
  
  LUT2 #(.INIT(4'b0111)) NAND_0_INST( .I0(A), .I1(B), .O(nand_0_out));
  LUT2 #(.INIT(4'b0111)) NAND_1_INST( .I0(nand_0_out), .I1(C), .O(nand_1_out));
  LUT2 #(.INIT(4'b0111)) NAND_2_INST( .I0(C), .I1(D), .O(nand_2_out));
  LUT2 #(.INIT(4'b0001)) NOR_0_INST( .I0(nand_1_out), .I1(nand_2_out), .O(X));
  
endmodule
