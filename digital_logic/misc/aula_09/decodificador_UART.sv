module decodificador_UART(
    input clk,              // relogio do sistema - assumimos 
    // período do relógioc igual ao período do bit da interface serial
    input reset,            // quando em nível alto reseta
    input RX,               // entrada de dados seriais
    output [7:0] dado,      // dado recebido
    output reg dado_valido, // indicador de dado recebido e válido 
    output reg erro         // indicador de erro no recebimento e dado não válido
    );
   
typedef enum {AGUARDA_LIVRE=0, PARADO=1, 
              REC_D0=2, REC_D1=3, REC_D2=4, REC_D3=5, REC_D4=6, REC_D5=7, REC_D6=8, REC_D7=9, 
              REC_PARIDADE=10, SUCESSO=11, ERRO=12} estado_tipo;

estado_tipo prox_etapa;    // sinal que contém o próximo estado a ser registrado
estado_tipo etapa_atual_ff;// registrador do estado atual

reg [7:0] dado_ff_s, dado_s; // dado recebido de forma serial

assign dado = dado_ff_s;


always_comb
begin : gera_proximo_estado
    dado_s = dado_ff_s;
    dado_valido = 0; // por padrão não tem dado válido
    erro = 0;        // por padrão não tem erro
    prox_etapa = etapa_atual_ff; // mantem estado atual se nada for mudado
    if(reset)
        prox_etapa = AGUARDA_LIVRE;   // volta ao início
    else
        case(etapa_atual_ff)
        AGUARDA_LIVRE: // inicio
            if(RX)
                prox_etapa = PARADO; // avança
        PARADO: // 
            if(!RX)
                prox_etapa = REC_D0; // avança
        REC_D0: // 
            begin
                prox_etapa = REC_D1; 
                dado_s[0] = RX;
            end
        REC_D1: // 
            begin
                prox_etapa = REC_D2;  
                dado_s[1] = RX;
            end
        REC_D2: // 
            begin
                prox_etapa = REC_D3;  
                dado_s[2] = RX;
            end
        REC_D3: // 
            begin
                prox_etapa = REC_D4;  
                dado_s[3] = RX;
            end
        REC_D4: // 
            begin
                prox_etapa = REC_D5; 
                dado_s[4] = RX;
            end 
        REC_D5: // 
            begin
                prox_etapa = REC_D6;  
                dado_s[5] = RX;
            end
        REC_D6: // 
            begin
                prox_etapa = REC_D7;  
                dado_s[6] = RX;
            end
        REC_D7: // 
            begin
                prox_etapa = REC_PARIDADE;  
                dado_s[7] = RX;
            end
        REC_PARIDADE: // 
            begin
                if( !(RX ^(^dado_ff_s)) )   // se XOR de dados recebidos + paridade == 0 correta
                    prox_etapa = SUCESSO; 
                else    // senão erro de paridade
                    prox_etapa = ERRO;
            end                    
        SUCESSO: // 
            begin
                dado_valido = 1;
                if(RX) // stop correto, volta ao início
                    prox_etapa = PARADO; 
                else    // senão erro de parada
                    prox_etapa = ERRO;   
            end                    
        ERRO: // 
            begin
                erro = 1;
                prox_etapa = PARADO; 
            end
        endcase
end

always@(posedge clk)
begin : atualiza_estado_atual
    etapa_atual_ff <= prox_etapa;
    dado_ff_s      <= dado_s;
end


endmodule