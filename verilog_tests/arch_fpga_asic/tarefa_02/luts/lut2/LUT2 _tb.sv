module LUT2_tb;
  logic O, I0, I1;
  
  // instantiating the module to map connections 4'b0101
  LUT2 #(.INIT(4'h8)) LUT2_INST( .I0(I0), .I1(I1), .O(O) );
  
  initial
    begin
      I1 = 1'b0;
      I0 = 1'b0;

      #5
      I1 = 1'b0;
      I0 = 1'b1;      
      
      #5
      I1 = 1'b1;
      I0 = 1'b0;
      
      #5
      I1 = 1'b1;
      I0 = 1'b1;
    end
  
    initial
    begin
      $display("                Tempo   Entradas LUT    Saídas");
      $display("                         I1    I0       O");
      $display("                ====   ============  =======");
      $monitor($time,"     %b      %b       %b", I1, I0, O);
    end
  
endmodule
