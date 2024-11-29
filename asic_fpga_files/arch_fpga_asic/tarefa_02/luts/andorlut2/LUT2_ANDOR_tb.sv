module LUT2_ANDOR_tb;
  logic O, O1, I0, I1, I2;
  
  // instantiating the module to map connections 4'b0101
  LUT2 #(.INIT(4'h8)) LUT2_INST_AND( .I0(I1), .I1(I2), .O(O) );
  LUT2 #(.INIT(4'hE)) LUT2_INST_OR( .I0(I0), .I1(O), .O(O1) );
  
  initial
    begin
      I2 = 1'b0;
      I1 = 1'b0;
      I0 = 1'b0;

      #5
      I2 = 1'b0;
      I1 = 1'b0;
      I0 = 1'b1;      
      
      #5
      I2 = 1'b0;
      I1 = 1'b1;
      I0 = 1'b0;
      
      #5
      I2 = 1'b0;
      I1 = 1'b1;
      I0 = 1'b1;
      
      #5
      I2 = 1'b1;
      I1 = 1'b0;
      I0 = 1'b0;

      #5
      I2 = 1'b1;
      I1 = 1'b0;
      I0 = 1'b1;      
      
      #5
      I2 = 1'b1;
      I1 = 1'b1;
      I0 = 1'b0;
      
      #5
      I2 = 1'b1;
      I1 = 1'b1;
      I0 = 1'b1;      
    end
  
    initial
    begin
      $display("                Tempo   Entradas LUT         Saídas");
      $display("                         I2    I1    I0        O1");
      $display("                ====   ================   ===========");
      $monitor($time,"     %b      %b     %b      %b", I2, I1, I0, O1);
    end
  
endmodule

