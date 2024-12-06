`timescale 1ns/10ps
module detector_de_pulso(
    input clk,              // relogio do sistema - assumimos 
    // período do relógioc igual ao período do bit da interface serial
    input reset,            // quando em nível alto reseta
    input a,b,              // entrada de sinais monitorados
    output reg seq_a,seq_b  // indicadores de sequencias encontradas
    );
   
typedef enum {AGUARDA_PULSOS=0, 
                A_1=1, A_2=2, A_3=3,
                B_1=4, B_2=5, B_3=6} estado_tipo;

estado_tipo prox_etapa;    // sinal que contém o próximo estado a ser registrado
estado_tipo etapa_atual_ff;// registrador do estado atual

reg a_anterior;
reg b_anterior;
wire a_sobe, b_sobe;

always@(posedge clk)
begin : salva_a_e_b_anteriores
    a_anterior <= a;
    b_anterior <= b;
end
// detecta bordas de subida nos sinais monitorados usando valores anteriores
assign a_sobe = ( (a==1) && (a_anterior==0));
assign b_sobe = ( (b==1) && (b_anterior==0));

always_comb
begin : gera_proximo_estado
    seq_a = 0;          
    seq_b = 0;            
    prox_etapa = etapa_atual_ff; // mantem estado atual se nada for mudado
    if(reset)
    begin
        prox_etapa = AGUARDA_PULSOS;   // volta ao início
    end
    else
        case(etapa_atual_ff)
        AGUARDA_PULSOS: // inicio
            begin
                if(a_sobe && (b_sobe==0))
                    prox_etapa = A_1; // 
                if(b_sobe && (a_sobe==0))
                    prox_etapa = B_1; // 
                if(a_sobe && b_sobe)
                    prox_etapa = AGUARDA_PULSOS; // mais alta prioridade
            end
        A_1:    // já ocorreu uma subida em a
            begin
                if(a_sobe && (b_sobe==0))
                    prox_etapa = A_2; // 
                if(b_sobe && (a_sobe==0))
                    prox_etapa = B_1; // 
                if(a_sobe && b_sobe)
                    prox_etapa = AGUARDA_PULSOS; // mais alta prioridade
            end
        A_2:    // já ocorreu duas subidas em a
            begin
                if(a_sobe && (b_sobe==0))
                    prox_etapa = A_3; // 
                if(b_sobe && (a_sobe==0))
                    prox_etapa = B_1; // 
                if(a_sobe && b_sobe)
                    prox_etapa = AGUARDA_PULSOS; // mais alta prioridade
            end
        A_3:    
            begin
                seq_a=1;
                prox_etapa = AGUARDA_PULSOS; // volta ao início
            end
        B_1:    // já ocorreu uma subida em a
            begin
                if(a_sobe && (b_sobe==0))
                    prox_etapa = A_1; // 
                if(b_sobe && (a_sobe==0))
                    prox_etapa = B_2; // 
                if(a_sobe && b_sobe)
                    prox_etapa = AGUARDA_PULSOS; // mais alta prioridade
            end
        B_2:    // já ocorreu duas subidas em a
            begin
                if(a_sobe && (b_sobe==0))
                    prox_etapa = A_1; // 
                if(b_sobe && (a_sobe==0))
                    prox_etapa = B_3; // 
                if(a_sobe && b_sobe)
                    prox_etapa = AGUARDA_PULSOS; // mais alta prioridade
            end
        B_3:    
            begin
                seq_b=1;
                prox_etapa = AGUARDA_PULSOS; // volta ao início
            end
                
            
            
        endcase
end

always@(posedge clk)
begin : atualiza_estado_atual
    etapa_atual_ff <= prox_etapa;
end


endmodule