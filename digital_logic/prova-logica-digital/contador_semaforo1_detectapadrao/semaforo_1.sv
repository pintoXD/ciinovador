module semaforo_1(
    input clk,    // relogio do sistema
    input reset,  // quando em nível alto reseta
    input pulso,  // em nível alto comanda avançar
    output reg verde, amarelo, vermelho 
    );
    
reg [1:0] etapa_ff;   // registrador do estado atual
reg [1:0] prox_etapa; // sinal que contém o próximo estado 
                      // calculado pela lógica combinacional

always_comb
begin : gera_proximo_estado
    prox_etapa = etapa_ff; // mantem estado atual se nada for mudado
    if(reset)
        prox_etapa = 2'b00;   // volta ao início
    else
        case(etapa_ff)
        2'b00: // inicio
            prox_etapa = 2'b11; // avança imediatamente para vermelho
        2'b01: // verde
            if(pulso)
                prox_etapa = 2'b10; 
        2'b10: // amarelo
            if(pulso)
                prox_etapa = 2'b11; 
        2'b11: // vermelho
            if(pulso)
                prox_etapa = 2'b01; // volta ao verde
        endcase
end

always@(posedge clk)
begin : atualiza_estado_atual
    etapa_ff <= prox_etapa;
end

always@(etapa_ff)
begin
    verde=0;
    amarelo = 0;
    vermelho = 0;
    case(etapa_ff)
    2'b00: 
    begin
        amarelo = 1;
        vermelho = 1;
    end
    2'b01: 
        verde = 1;
    2'b10: 
        amarelo = 1;
    2'b11: 
        vermelho = 1;         
    endcase;
end

endmodule