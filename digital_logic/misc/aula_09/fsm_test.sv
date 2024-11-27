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
              TD0, TD1, TD2, TD3, TD4, TD5, TD6, TD7,
              PARIDADE, STOP1, STOP2} tipo_estado;


tipo_estado prox_etapa; // gerada combinacionalmente
tipo_estado etapa_atual_ff;

always_ff@(posedge clk) begin
    etapa_atual_ff <= prox_etapa;
end


always_comb
begin
    TX = 1'b1;
    transmitindo = 1'b1;
    fim = 1'b0;


    prox_etapa = etapa_atual_ff;
    if(reset) begin
        prox_etapa = AGUARDA_DADO;
    end

    else begin
        case(etapa_atual_ff):
            AGUARDA_DADO: begin
                if(dado_valido)
                    prox_etapa = GERA_START;
            end

            GERA_START: begin
                TX = 1'b0;
                prox_etapa = TD0;
            end

            TD0: begin
                TX= dado[0];
                prox_etapa = TD1;
            end

            TD1: begin
                TX= dado[1];
                prox_etapa = TD2;
            end

            TD2: begin
                TX = dado[2];
                prox_etapa = TD3;
            end

            TD3: begin
                TX = dado[3];
                prox_etapa = TD4;
            end

            TD4: begin
                TX = dado[4];
                prox_etapa = TD5;
            end

            TD5: begin
                TX = dado[5];
                prox_etapa = TD6;
            end

            TD6: begin
                TX = dado[6];
                prox_etapa = TD7;
            end

            TD7: begin
                TX = dado[7];
                prox_etapa = PARIDADE;
            end

            PARIDADE: begin
                TX = (^dado);
                prox_etapa = STOP1;
            end

            STOP1: begin
                TX = 1'b1;
                fim = 1'b1;
                transmitindo = 1'b1;

                if(stop_1_2)    
                    prox_etapa = STOP2;
                else
                    begin
                        if(dado_valido)
                            prox_etapa = GERA_START;
                        else
                            prox_etapa = AGUARDA_DADO;
                    end
            end

            STOP2: begin
                TX = 1'b1;
                transmitindo = 1'b1;
                if (dado_valido)
                    prox_etapa = GERA_START;
                else
                    prox_etapa = AGUARDA_DADO;
            end
        endcase
    end

end

endmodule