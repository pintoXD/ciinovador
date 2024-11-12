module comparator_device_tb;

logic [3:0] in_word; 
logic out_result;


// instantiating the module to map connections
comparator_device cmp_inst( .in_word(in_word), .out(out_result));

initial
    begin
        in_word = 4'b0000;
        #5
        in_word = 4'b0001;
        #5
        in_word = 4'b0010;
        #5
        in_word = 4'b0011;
        #5
        in_word = 4'b0100;
        #5
        in_word = 4'b0101;
        #5
        in_word = 4'b0110;
        #5
        in_word = 4'b0111;
        #5
        in_word = 4'b1000;
        #5
        in_word = 4'b1001;
        #5
        in_word = 4'b1010;
        #5
        in_word = 4'b1011;
        #5
        in_word = 4'b1100;
        #5
        in_word = 4'b1101;
        #5
        in_word = 4'b1110;
        #5
        in_word = 4'b1111;
        #5
        $finish;
    end

    initial
    begin
      $display("                Tempo   Entradas    Saídas");
      $display("                          in         out  ");
      $display("                ====   ==========  =======");
      $monitor($time,"     %b        %b", in_word, out_result);
    end


endmodule