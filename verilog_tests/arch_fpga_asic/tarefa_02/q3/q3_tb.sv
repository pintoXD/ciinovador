`timescale 1ps/1ps
module LUT2_Q3_tb;
  logic S, A, B, CIN, COUT;
  
  Q3_MIX_LUTS FULL_ADDER_DUT(.A(A), .B(B), .CIN(CIN), .S(S), .COUT(COUT));

  
  initial
    begin
      // Test case 1
      A = 1'b0;
      B = 1'b0;
      CIN = 1'b0;
      #10;
      assert(COUT == 1'b0 && S == 1'b0) else $error("Test case 1 failed");

      // Test case 2
      A = 1'b0;
      B = 1'b0;
      CIN = 1'b1;
      #10;
      assert(COUT == 1'b0 && S == 1'b1) else $error("Test case 2 failed");

      // Test case 3
      A = 1'b0;
      B = 1'b1;
      CIN = 1'b0;
      #10;
      assert(COUT == 1'b0 && S == 1'b1) else $error("Test case 3 failed");

      // Test case 4
      A = 1'b0;
      B = 1'b1;
      CIN = 1'b1;
      #10;
      assert(COUT == 1'b1 && S == 1'b0) else $error("Test case 4 failed");

      // Test case 5
      A = 1'b1;
      B = 1'b0;
      CIN = 1'b0;
      #10;
      assert(COUT == 1'b0 && S == 1'b1) else $error("Test case 5 failed");

      // Test case 6
      A = 1'b1;
      B = 1'b0;
      CIN = 1'b1;
      #10;
      assert(COUT == 1'b1 && S == 1'b0) else $error("Test case 6 failed");

      // Test case 7
      A = 1'b1;
      B = 1'b1;
      CIN = 1'b0;
      #10;
      assert(COUT == 1'b1 && S == 1'b0) else $error("Test case 7 failed");

      // Test case 8
      A = 1'b1;
      B = 1'b1;
      CIN = 1'b1;
      #10;
      assert(COUT == 1'b1 && S == 1'b1) else $error("Test case 8 failed");
      
      
      

    $finish;

    end
  
    initial
    begin
      $display("                Tempo   Entradas LUT          Saídas");
      $display("                         A   B   CIN          COUT   S");
      $display("                ====   ================      =======");
      $monitor($time,"     %b   %b    %b           %b     %b", A, B, CIN, COUT, S);
    end
  
endmodule
