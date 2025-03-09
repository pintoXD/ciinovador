module sign_extend(
    input signed [15:0] in_word,
    output signed [31:0] out_word
);


assign out_word = in_word;

endmodule