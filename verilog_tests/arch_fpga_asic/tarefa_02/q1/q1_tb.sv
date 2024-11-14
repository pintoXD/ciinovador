`timescale 1ps/1ps
module LUT2_Q1_tb;
  logic OUT, A, B, C, D;
  Q1_LUT2 LUT2_INST( .A(A), .B(B), .C(C), .D(D), .X(OUT));
  
  initial
    begin
      // Test case 1
      A = 1'b0;
      B = 1'b0;
      C = 1'b0;
      D = 1'b0;
      #10;
      
      // Test case 2
      A = 1'b0;
      B = 1'b0;
      C = 1'b0;
      D = 1'b1;
      #10;
      
      // Test case 3
      A = 1'b0;
      B = 1'b0;
      C = 1'b1;
      D = 1'b0;
      #10;

      // Test case 3
      A = 1'b0;
      B = 1'b0;
      C = 1'b1;
      D = 1'b1;
      #10;

      // Test case 4
      A = 1'b0;
      B = 1'b1;
      C = 1'b0;
      D = 1'b0;
      #10;
      
      // Test case 5
      A = 1'b0;
      B = 1'b1;
      C = 1'b0;
      D = 1'b1;
      #10;
      
      // Test case 6
      A = 1'b0;
      B = 1'b1;
      C = 1'b1;
      D = 1'b0;
      #10;
      
      // Test case 7
      A = 1'b0;
      B = 1'b1;
      C = 1'b1;
      D = 1'b1;
      #10;
      
      // Test case 8
      A = 1'b1;
      B = 1'b0;
      C = 1'b0;
      D = 1'b0;
      #10;
      
      // Test case 9
      A = 1'b1;
      B = 1'b0;
      C = 1'b0;
      D = 1'b1;
      #10;
      
      // Test case 10
      A = 1'b1;
      B = 1'b0;
      C = 1'b1;
      D = 1'b0;
      #10;
      
      // Test case 11
      A = 1'b1;
      B = 1'b0;
      C = 1'b1;
      D = 1'b1;
      #10;
      
      // Test case 12
      A = 1'b1;
      B = 1'b1;
      C = 1'b0;
      D = 1'b0;
      #10;
      
      // Test case 13
      A = 1'b1;
      B = 1'b1;
      C = 1'b0;
      D = 1'b1;
      #10;
      
      // Test case 14
      A = 1'b1;
      B = 1'b1;
      C = 1'b1;
      D = 1'b0;
      #10;
      
      // Test case 4
      A = 1'b1;
      B = 1'b1;
      C = 1'b1;
      D = 1'b1;
      #10;
      
      

    $finish;

    end
  
    initial
    begin
      $display("                Tempo   Entradas LUT        Saídas");
      $display("                         A   B   C   D       OUT");
      $display("                ====   ================      =======");
      $monitor($time,"     %b   %b   %b   %b        %b", A, B, C, D, OUT);
    end
  
endmodule
