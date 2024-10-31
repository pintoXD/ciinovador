module notgate_tb;
  logic a;
  logic b;
  
  // instantiating the module to map connections
  notgate notgt( .a(a), .b(b) );
  
  initial
    begin
      a = 1'b0;
      // b = 1'b0;
     
      #10
      a = 1'b1;
      // b = 1'b0;
      
   end
  
    initial
    begin
      $display("                Tempo   Entradas    Saídas");
      $display("                           a           b");
      $display("                ====   ==========  =======");
      $monitor($time,"                    %b           %b", a, b);
    end
  
endmodule

