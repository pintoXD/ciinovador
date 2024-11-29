module xorgate (a,b,c);
  input logic a,b;
  output logic c;

  logic notA, notB;
  logic midAndA, midAndB; 

  notgate notg_a(
    .a(a), 
    .b(notA)
  );

  notgate notg_b(
    .a(b), 
    .b(notB)
  );

  andgate andg_a(
    .a(a), 
    .b(notB), 
    .c(midAndA)
  );

  andgate andg_b(
    .a(notA), 
    .b(b), 
    .c(midAndB)
  );
  
  orgate orgate_out(
    .a(midAndA), 
    .b(midAndB), 
    .c(c)
  );

endmodule