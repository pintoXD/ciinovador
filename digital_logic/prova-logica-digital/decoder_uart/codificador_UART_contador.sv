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
   
typedef enum {AGUARDA_DADO, GERA_START, 
              TRANS_DADO, 
              TRANS_PARIDADE, GERA_STOP1,GERA_STOP2} estado_tipo;

estado_tipo prox_etapa;    // sinal que contém o próximo estado a ser registrado
estado_tipo etapa_atual_ff;// registrador do estado atual
// contador auxiliar para o estado de bits sequenciais
reg [2:0] contador_s, contador_ff;

always_comb
begin : gera_proximo_estado
    TX = 1;          // por padrão saída em nível alto
    transmitindo = 1; // por padrão está transmitindo
    fim = 0;         // por padrão
    contador_s = 0;
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
                prox_etapa = TRANS_DADO; // avança
            end
        TRANS_DADO: // 
            begin
                TX = dado[contador_ff];
		contador_s = contador_ff+1;
		if(contador_ff==3'b111)
	                prox_etapa = TRANS_PARIDADE; 
            end
        TRANS_PARIDADE: // 
            begin
                TX= (^dado);   // XOR de dados transmitidos
                prox_etapa = GERA_STOP1;
            end         
        GERA_STOP1: // 
            begin
                TX= 1;   // stop é nível lógico alto
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
                TX= 1;   // stop é nível lógico alto
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
    contador_ff    <= contador_s;
end


endmodule
