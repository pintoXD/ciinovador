`timescale 1ps/1ps
module LUT2_tb;
  logic OUT, A, B, C, D;
  
  logic nand_0_out, nand_1_out, nand_2_out, nor_0_out;
  // instantiating the module to map connections 4'b0101
  LUT2 #(.INIT(4'b0111)) NAND_0_INST( .I0(A), .I1(B), .O(nand_0_out));
  LUT2 #(.INIT(4'b0111)) NAND_1_INST( .I0(nand_0_out), .I1(C), .O(nand_1_out));
  LUT2 #(.INIT(4'b0111)) NAND_2_INST( .I0(C), .I1(D), .O(nand_2_out));
  
  
  LUT2 #(.INIT(4'b0001)) NOR_0_INST( .I0(nand_1_out), .I1(nand_2_out), .O(OUT));
  
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
