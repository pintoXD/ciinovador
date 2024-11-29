module LUT3_tb;
  logic O, I0, I1, I2;
  
  // instantiating the module to map connections
  LUT3 #(.INIT(8'h0A)) LUT3_INST(.I0(I0), .I1(I1), .I2(I2), .O(O));
  
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
      $display("                Tempo   Entradas LUT3   Saídas");
      $display("                         I2   I1   I0       O");
      $display("                ====   ================   ====");
      $monitor($time,"     %b    %b    %b       %b", I2, I1, I0,  O);
    end
  
endmodule
