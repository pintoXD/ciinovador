`timescale 1ns/1ps

module datapath101(
    input logic [2:0]ra1,
    input logic [2:0]ra2,
    input logic [2:0]wa5,
    input logic we5,
    input logic [7:0]wd32,
    input logic [7:0]constante,
    input logic [2:0]ULAControl,
    input logic select_src,
    
    input logic clk, rst,

    output logic [7:0] ULAResult,
    output logic FlagZ

);

logic [7:0] w_rd1SrcA;
logic [7:0] w_rd2;
logic [7:0] w_SrcB;

register8_bank reg8_bank_inst(
    .clk(clk),
    .rst(rst),
    .we5(we5),
    .wa5(wa5),
    .ra1(ra1),
    .ra2(ra2),
    .wd32(wd32),
    .rd1(w_rd1SrcA),
    .rd2(w_rd2)
);

muxULAsrc muxULAsrc_inst(
    .select_src(select_src),
    .constante(constante),
    .w_rd2(w_rd2),
    .w_SrcB(w_SrcB)
);

custom_ula ula_inst(
    .SrcA(w_rd1SrcA),
    .SrcB(w_SrcB),
    .ULAControl(ULAControl),
    .ULAResult(ULAResult),
    .FlagZ(FlagZ)
);




    
endmodule