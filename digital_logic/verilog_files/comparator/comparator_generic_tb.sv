module comparator_generic_tb;

logic [3:0] first_in, second_in; 
logic out_result;


// instantiating the module to map connections
comparator_generic cmp_inst( .first_word(first_in), .second_word(second_in), .out(out_result));

initial
    begin
      // Test case 1
      first_in = 4'b0000;
      second_in = 4'b0000;
      #5;
      assert(out_result == 1'b1) else $error("Test case 1 failed");

      // Test case 2
      first_in = 4'b0001;
      second_in = 4'b0000;
      #5;
      assert(out_result == 1'b0) else $error("Test case 2 failed");

      // Test case 3
      first_in = 4'b0010;
      second_in = 4'b0010;
      #5;
      assert(out_result == 1'b1) else $error("Test case 3 failed");

      // Test case 4
      first_in = 4'b1111;
      second_in = 4'b1110;
      #5;
      assert(out_result == 1'b0) else $error("Test case 4 failed");

      // Test case 5
      first_in = 4'b1010;
      second_in = 4'b1010;
      #5;
      assert(out_result == 1'b1) else $error("Test case 5 failed");

      $finish;
    end

    initial
    begin
      $display("                Tempo          Entradas            Saídas");
      $display("                        first_in    second_in       out");
      $display("                ====   ==========   ==========      ====");
      $monitor($time,"     %b         %b           %b", first_in, second_in, out_result);
    end


endmodule