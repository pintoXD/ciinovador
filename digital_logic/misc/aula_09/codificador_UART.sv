`timescale 1ns/10ps
module codificador_UART(
    input clk,              // relogio do sistema - assumimos 
    // período do relógioc igual ao período do bit da interface serial
    input reset,            // quando em nível alto reseta
    input [7:0] dado,       // entrada de dados paralelos
    input dado_valido,      // indicador de dado válido para iniciar a transmissão
    input stop_1_2,         // em nível lógico baixo gera 1 stop bit, em alto 2 stop bits
    output reg TX,          // dado transmitido
    output reg transmitindo,// indicador de que iniciou uma transmissão
    output reg fim          // indicador de fim de transmissao
    );
   
typedef enum {AGUARDA_DADO=0, GERA_START=1, 
              TRANS_D0=2, TRANS_D1=3, TRANS_D2=4, TRANS_D3=5, TRANS_D4=6, TRANS_D5=7, TRANS_D6=8, TRANS_D7=9, 
              TRANS_PARIDADE=10, GERA_STOP1=11,GERA_STOP2=12} estado_tipo;

estado_tipo prox_etapa;    // sinal que contém o próximo estado a ser registrado
estado_tipo etapa_atual_ff;// registrador do estado atual

always@(reset, etapa_atual_ff, stop_1_2, dado, dado_valido ) // ou always_comb
begin : gera_proximo_estado
    TX = 1;          // por padrão saída em nível alto
    transmitindo = 1; // por padrão está transmitindo
    fim = 0;         // por padrão
    
    prox_etapa = etapa_atual_ff; // mantem estado atual se nada for mudado
    if(reset)
    begin
        prox_etapa = AGUARDA_DADO;   // volta ao início
        transmitindo = 0;
    end
    else
        case(etapa_atual_ff)
        AGUARDA_DADO: // inicio
            begin
                transmitindo = 0;
                if(dado_valido)
                    prox_etapa = GERA_START; // 
            end
        GERA_START:
            begin
                TX = 0; // start é um bit em nível lógico baixo
                prox_etapa = TRANS_D0; // avança
            end
        TRANS_D0: // 
            begin
                prox_etapa = TRANS_D1; 
                TX = dado[0];
            end
        TRANS_D1: // 
            begin
                prox_etapa = TRANS_D2;  
                TX = dado[1];
            end
        TRANS_D2: // 
            begin
                prox_etapa = TRANS_D3; 
                TX = dado[2];
            end
        TRANS_D3: // 
            begin
                prox_etapa = TRANS_D4;
                TX = dado[3];
            end
        TRANS_D4: // 
            begin
                prox_etapa = TRANS_D5;
                TX = dado[4];
            end 
        TRANS_D5: // 
            begin
                prox_etapa = TRANS_D6;  
                TX = dado[5];
            end
        TRANS_D6: // 
            begin
                prox_etapa = TRANS_D7;  
                TX = dado[6];
            end
        TRANS_D7: // 
            begin
                prox_etapa = TRANS_PARIDADE; 
                TX = dado[7];
            end
        TRANS_PARIDADE: // 
            begin
                TX = (^dado);   // XOR de dados transmitidos
                prox_etapa = GERA_STOP1;
            end         
        GERA_STOP1: // 
            begin
                TX = 1;   // stop é nível lógico alto
                fim = 1;
                transmitindo = 1;
                if(stop_1_2) // 1 ou 2 stops?
                    prox_etapa = GERA_STOP2; 
                else 
                begin
                    if(dado_valido)
                        prox_etapa = GERA_START; // 
                    else    // senão espera novo dado válido
                        prox_etapa = AGUARDA_DADO; 
                end
            end                    
        GERA_STOP2: // 
            begin
                TX = 1;   // stop é nível lógico alto
                transmitindo = 1;
                if(dado_valido)
                    prox_etapa = GERA_START; // 
                else    // senão espera novo dado válido
                    prox_etapa = AGUARDA_DADO;   
            end                   
        endcase
end

always@(posedge clk)
begin : atualiza_estado_atual
    etapa_atual_ff <= prox_etapa;
end


endmodule