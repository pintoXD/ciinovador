`timescale 1s/1ms
module sinaleira2(
    input logic clk,
    input logic reset,
    input logic pedestre,

    output logic rua_1_vermelho, 
    output logic rua_1_amarelo,
    output logic rua_1_verde, 

    output logic rua_2_vermelho, 
    output logic rua_2_amarelo, 
    output logic rua_2_verde,

    output logic  pedestre_vermelho,
    output logic  pedestre_2_verde
);

typedef enum { INICIAL=0, CONTA_1=1, CONTA_2=2, CONTA_3=3,
                            CONTA_4=4, CONTA_5=5, CONTA_6=6,
                            CONTA_7=7, CONTA_8=8, CONTA_9=9,
                            CONTA_10=10, CONTA_11=11, CONTA_12=12} estados_tipo;

estados_tipo estado_atual_ff;
estados_tipo proximo_estado;

always_ff @(posedge clk) begin
    estado_atual_ff <= proximo_estado;
end

always_comb begin
    proximo_estado = estado_atual_ff;

    if(reset)
        proximo_estado = INICIAL;
    else 
    begin
        case (estado_atual_ff)
            INICIAL:    
            begin
                proximo_estado = CONTA_1;
            end

            CONTA_1: begin
                if(clk)
                    proximo_estado = CONTA_2;
            end

            CONTA_2: begin
                if(clk)
                    proximo_estado = CONTA_3; 
            end

            CONTA_3: begin
                if(clk)
                    proximo_estado = CONTA_4; 
            end
            CONTA_4: begin
                if(clk)
                    proximo_estado = CONTA_5; 
            end

            CONTA_5: begin
                if(clk)
                    proximo_estado = CONTA_6; 
            end

            CONTA_6: begin
                if(clk)
                    proximo_estado = CONTA_7; 
            end

            CONTA_7: begin
                if(clk)
                    proximo_estado = CONTA_8; 
            end

            CONTA_8: begin
                if(clk)
                    proximo_estado = CONTA_9; 
            end

            CONTA_9: begin
                if(clk)
                    proximo_estado = CONTA_10; 
            end

            CONTA_10: begin
                if(clk)
                    proximo_estado = CONTA_11; 
            end

            CONTA_11: begin
                if(clk)
                    proximo_estado = CONTA_12; 
            end

            CONTA_12: begin
                if(clk)
                    proximo_estado = CONTA_1; 
            end
            

        endcase
    end
end


    // pedestre_2_verde = 1;
    // pedestre_vermelho = 0;

always_ff@(estado_atual_ff)begin
    rua_1_vermelho = 0; 
    rua_1_amarelo = 0;
    rua_1_verde = 0; 

    rua_2_vermelho = 0; 
    rua_2_amarelo = 0; 
    rua_2_verde = 0;

    case(estado_atual_ff)
        CONTA_1: begin
            rua_1_vermelho = 1;
            rua_2_vermelho = 1;
            
        end

        CONTA_2: begin
            rua_1_vermelho = 1;
            rua_2_verde = 1;
        end

        CONTA_3: begin
            rua_1_vermelho = 1;
            rua_2_verde = 1;
        end

        CONTA_4: begin
            rua_1_vermelho = 1;
            rua_2_verde = 1;
        end

        CONTA_5: begin
            rua_1_vermelho = 1;
            rua_2_verde = 1;
        end

        CONTA_6: begin
            rua_1_vermelho = 1;
            rua_2_verde = 1;
        end

        CONTA_7: begin
            rua_1_vermelho = 1;
            rua_2_amarelo = 1;
        end

        CONTA_8: begin
            rua_1_vermelho = 1;
            rua_2_amarelo = 1;
        end

        CONTA_9: begin
            rua_1_verde = 1;
            rua_2_vermelho = 1;
        end

        CONTA_10: begin
            rua_1_verde = 1;
            rua_2_vermelho = 1;
        end

        CONTA_11: begin
            rua_1_amarelo = 1;
            rua_2_vermelho = 1;
        end

        CONTA_12: begin
            rua_1_amarelo = 1;
            rua_2_vermelho = 1;
        end

    endcase


end

endmodule