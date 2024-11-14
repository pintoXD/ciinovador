`timescale 1ps/1ps
module Q2_LUT3_TB;
  logic A0, A1, A2, A3, OUT;
  
  Q2_LUT3 UUT(.A3(A3), .A2(A2), .A1(A1), .A0(A0), .OUT(OUT));

  
  initial
    begin
      // Test case 1
      A0 = 1'b0; A1 = 1'b0; A2 = 1'b0; A3 = 1'b0;
      #10;
      // Test case 2
      A0 = 1'b0; A1 = 1'b0; A2 = 1'b0; A3 = 1'b1;
      #10;
      // Test case 3
      A0 = 1'b0; A1 = 1'b0; A2 = 1'b1; A3 = 1'b0;
      #10;
      // Test case 4
      A0 = 1'b0; A1 = 1'b0; A2 = 1'b1; A3 = 1'b1;
      #10;
      // Test case 5
      A0 = 1'b0; A1 = 1'b1; A2 = 1'b0; A3 = 1'b0;
      #10;
      // Test case 6
      A0 = 1'b0; A1 = 1'b1; A2 = 1'b0; A3 = 1'b1;
      #10;
      // Test case 7
      A0 = 1'b0; A1 = 1'b1; A2 = 1'b1; A3 = 1'b0;
      #10;
      // Test case 8
      A0 = 1'b0; A1 = 1'b1; A2 = 1'b1; A3 = 1'b1;
      #10;
      // Test case 9
      A0 = 1'b1; A1 = 1'b0; A2 = 1'b0; A3 = 1'b0;
      #10;
      // Test case 10
      A0 = 1'b1; A1 = 1'b0; A2 = 1'b0; A3 = 1'b1;
      #10;
      // Test case 11
      A0 = 1'b1; A1 = 1'b0; A2 = 1'b1; A3 = 1'b0;
      #10;
      // Test case 12
      A0 = 1'b1; A1 = 1'b0; A2 = 1'b1; A3 = 1'b1;
      #10;
      // Test case 13
      A0 = 1'b1; A1 = 1'b1; A2 = 1'b0; A3 = 1'b0;
      #10;
      // Test case 14
      A0 = 1'b1; A1 = 1'b1; A2 = 1'b0; A3 = 1'b1;
      #10;
      // Test case 15
      A0 = 1'b1; A1 = 1'b1; A2 = 1'b1; A3 = 1'b0;
      #10;
      // Test case 16
      A0 = 1'b1; A1 = 1'b1; A2 = 1'b1; A3 = 1'b1;
      #10;

    $finish;

    end
  
    initial
    begin
      $display("                Tempo     Entradas LUT        Saídas");
      $display("                         A0  A1  A2  A3         OUT");
      $display("                ====   ================       =======");
      $monitor($time,"     %b  %b  %b  %b               %b", A0, A1, A2, A3, OUT);
    end
  
endmodule
