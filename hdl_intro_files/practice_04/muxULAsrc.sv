`timescale 1ns/1ps

module muxULAsrc(
    input logic select_src,
    input logic [7:0] w_rd2, constante,
    output logic [7:0] w_SrcB
);

always_comb 
begin
    w_SrcB = select_src ? constante : w_rd2;
end


endmodule