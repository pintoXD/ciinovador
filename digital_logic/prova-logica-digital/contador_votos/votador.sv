module votador(
      input  [2:0] V,
      output [3:0] R);

wire W1,W2,W3;


NOR3X1HVT res0_inst (R[0],V[0],V[1],V[2]);

XOR3X1HVT res1_a (W1,V[0],V[1],V[2]);
INVX1HVT  res1_b (W3,R[3]);
XOR2X1HVT res1_c (W2,W1,W3);
INVX1HVT  res1_d (R[1],W2);

NOR3X1HVT res2_a (R[2],R[0],R[1],R[3]);

AND3X1HVT res3_inst (R[3],V[0],V[1],V[2]);

endmodule
