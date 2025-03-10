`timescale 1ns/1ps
module sign_extend(
    input [15:0] in_word,
    output [31:0] out_word
);

assign out_word = {{16{in_word[15]}}, in_word};

endmodule
