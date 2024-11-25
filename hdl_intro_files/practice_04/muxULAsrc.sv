`timescale 1ns/1ps

module muxULAsrc(
    input logic select_src,
    input logic [7:0] w_rd2, a_const,
    output logic [7:0] w_SrcB
);

assign w_SrcB = select_src ? a_const : w_rd2;

endmodule