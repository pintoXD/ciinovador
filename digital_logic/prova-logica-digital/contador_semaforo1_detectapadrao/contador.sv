module contador(
    input clk,    // relogio do sistema
    input reset,  // quando em nível alto reseta
    input [4:0] valor_maximo, // máxima contagem
    output reg [4:0] contagem,    // contagem atual
    output reg fim            // valor_maximo atingido
    );
reg [4:0] prox_contagem; // sinal que contém o próximo estado 
                      // calculado pela lógica combinacional

always@(posedge clk)
begin : atualiza_contagem
    contagem <= prox_contagem;
end

always@(contagem,valor_maximo,reset)
if(reset)
begin
    prox_contagem = 0;
    fim = 0;
end
else
begin
    prox_contagem = contagem+1;
    fim = 0;
    if (contagem == valor_maximo)
        fim = 1;
    if(fim)
        prox_contagem = 0;
end

endmodule