`timescale 1ps/1ps
module NOR_3_TB;
  logic A0, A1, A2, OUT;
  
  NOR_3 UUT(.A(A0), .B(A1), .C(A2), .OUT(OUT));

  
  initial
    begin
      // Test case 1
      A2 = 1'b0; A1 = 1'b0; A0 = 1'b0;
      #10;
      // Test case 2
      A2 = 1'b0; A1 = 1'b0; A0 = 1'b1;
      #10;
      // Test case 3
      A2 = 1'b0; A1 = 1'b1; A0 = 1'b0;
      #10;
      // Test case 4
      A2 = 1'b0; A1 = 1'b1; A0 = 1'b1;
      #10;
      // Test case 5
      A2 = 1'b1; A1 = 1'b0; A0 = 1'b0;
      #10;
      // Test case 6
      A2 = 1'b1; A1 = 1'b0; A0 = 1'b1;
      #10;
      // Test case 7
      A2 = 1'b1; A1 = 1'b1; A0 = 1'b0;
      #10;
      // Test case 8
      A2 = 1'b1; A1 = 1'b1; A0 = 1'b1;
      #10;

    $finish;

    end
  
    initial
    begin
      $display("                Tempo   Entradas LUT          Saídas");
      $display("                         A2 A1 A0          OUT");
      $display("                ====   ================      =======");
      $monitor($time,"     %b   %b   %b               %b", A2, A1, A0, OUT);
    end
  
endmodule
