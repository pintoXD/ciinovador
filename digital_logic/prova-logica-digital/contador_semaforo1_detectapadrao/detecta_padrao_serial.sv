module detecta_padrao_serial(
    input clk,    // relogio do sistema
    input reset,  // quando em nível alto reseta
    input x,      // dado deslocado serialmente
    output match  // padrao desejado ocorreu
    );
    
reg [3:0] dado_ff;   // registrador do estado atual
reg [3:0] prox_dado; // sinal que contém o próximo estado 
                      // calculado pela lógica combinacional
localparam VALOR_DESEJADO = 4'b0111;

always@(posedge clk)
begin : atualiza_dado
    dado_ff <= prox_dado;
end

always@(dado_ff,x,reset)
if(reset)
begin
    prox_dado = 0;
end
else
begin
    prox_dado [3:1] = dado_ff[2:0];
    prox_dado [0]   = x;   // entra no registrador de dado pelo LSB 
end

assign match = (dado_ff == VALOR_DESEJADO)? 1:0;

endmodule