`timescale 1ns/1ps
module contador(
    input clk, reset,
    input [4:0] valor_maximo,
    output [4:0] contagem,
    output fim

);

reg [4:0] contagem_ff; //saida - gerado com ffs
reg [4:0] contagem_comb;

always@(posedge clk) //parte sequencial
    contagem_ff <= contagem_comb;

always_comb // combinacional gerando o próximo valor que será capturado em D e transportado para Q
begin
    if(reset | fim)
        contagem_comb = 0;
    else
        contagem_comb = contagem_ff + 1;
end

assign fim = (contagem_ff == valor_maximo)? 1 : 0;
assign contagem = contagem_ff;


endmodule