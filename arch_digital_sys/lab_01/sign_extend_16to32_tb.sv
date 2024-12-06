module sign_extend_16to32_tb(

);

logic [15:0] mocked_in_word;
logic [31:0] mocked_out_word;

sign_extend_16to32 DUT(
    .in_word(mocked_in_word),
    .out_word(mocked_out_word)
);


initial begin
    mocked_in_word = 16'hFFFF;
    #10;
    $display("mocked_in_word = %h", mocked_in_word);
    $display("mocked_out_word = %h", mocked_out_word);
    assert(mocked_out_word == 32'hFFFF_FFFF) else $fatal(1, "Test Case 0 failed");
    #10;
    
    mocked_in_word = 16'h0000;
    #10;
    $display("mocked_in_word = %h", mocked_in_word);
    $display("mocked_out_word = %h", mocked_out_word);
    assert(mocked_out_word == 32'h0000_0000) else $fatal(1, "Test Case 1 failed");
    #10;
    
    mocked_in_word = 16'hFFFD;
    #10;
    $display("mocked_in_word = %h", mocked_in_word);
    $display("mocked_out_word = %h", mocked_out_word);
    assert(mocked_out_word == 32'hFFFF_FFFD) else $fatal(1, "Test Case 2 failed");
    #10;

    mocked_in_word = 16'hAAAA;
    #10;
    $display("mocked_in_word = %h", mocked_in_word);
    $display("mocked_out_word = %h", mocked_out_word);
    assert(mocked_out_word == 32'hFFFF_AAAA) else $fatal(1, "Test Case 3 failed");
    #10;
    
    mocked_in_word = 16'h8000;
    #10;
    $display("mocked_in_word = %h", mocked_in_word);
    $display("mocked_out_word = %h", mocked_out_word);
    assert(mocked_out_word == 32'hFFFF_8000) else $fatal(1, "Test Case 4 failed");
    #10;

    mocked_in_word = 16'h7FFF;
    #10;
    $display("mocked_in_word = %h", mocked_in_word);
    $display("mocked_out_word = %h", mocked_out_word);
    assert(mocked_out_word == 32'h0000_7FFF) else $fatal(1, "Test Case 5 failed");
    #10;
end



endmodule