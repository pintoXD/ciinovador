`timescale 1ps/1ps
module vote_counter_tb();

logic [3:0] in_word;
logic [4:0] out_result;

vote_counter dut_counter (
    .input_word(in_word),
    .out_result(out_result)
);



initial begin
    $dumpfile("vote_counter_tb.vcd");
    $dumpvars(0, vote_counter_tb);

    // Test case 1
    in_word = 3'b000;
    #5;
    assert(out_result == 4'b0001) else $error("Test case 1 failed");

    // Test case 2
    in_word = 3'b001;
    #5;
    assert(out_result == 4'b0010) else $error("Test case 2 failed");

    // Test case 3
    in_word = 3'b010;
    #5;
    assert(out_result == 4'b0010) else $error("Test case 3 failed");

    // Test case 4
    in_word = 3'b011;
    #5;
    assert(out_result == 4'b0100) else $error("Test case 4 failed");

    // Test case 5
    in_word = 3'b100;
    #5;
    assert(out_result == 4'b0010) else $error("Test case 5 failed");

    // Test case 6
    in_word = 3'b101;
    #5;
    assert(out_result == 4'b0100) else $error("Test case 6 failed");

    // Test case 7
    in_word = 3'b110;
    #5;
    assert(out_result == 4'b0100) else $error("Test case 7 failed");

    // Test case 8
    in_word = 3'b111;
    #5;
    assert(out_result == 4'b1000) else $error("Test case 8 failed");

    $finish;

end



initial
begin
    $display("                Tempo   Entradas      Saídas");
    $display("                        in_word     out_result");
    $display("                ====   ==========     =======");
    $monitor($time,"        %b       %b", in_word, out_result);
end

endmodule