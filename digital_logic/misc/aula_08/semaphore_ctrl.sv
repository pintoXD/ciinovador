`timescale 1ns/10ps
module semaphore_ctrl (
    input logic clk, reset, pulso,
    output logic vermelho, amarelo, verde
);

logic [1:0] estado_atual_ff, proximo_estado;
logic pulso_atual, pulso_anterior;

always_ff @(clk) begin : state_handler
    estado_atual_ff <= proximo_estado;
    pulso_anterior <= pulso;
end

always_ff @(pulso) begin
    pulso_atual <= pulso;
end

always_comb begin : semaphore_fsm
    proximo_estado = estado_atual_ff;
    vermelho = 1;
    amarelo = 1;
    verde = 0;

    if (reset)
        proximo_estado = 2'b00;

    else begin
            case(estado_atual_ff)
                2'b00: begin
                    vermelho = 1;
                    amarelo = 1;
                    verde = 0;
                    proximo_estado = 2'b11;
                end

                2'b01: begin
                    vermelho = 0;
                    amarelo = 0;
                    verde = 1;
                    if (pulso_atual && !pulso_anterior)
                        proximo_estado = 2'b10;
                end

                2'b10: begin
                    vermelho = 0;
                    amarelo = 1;
                    verde = 0;
                    if (pulso_atual && !pulso_anterior)
                        proximo_estado = 2'b11;
                end

                2'b11: begin
                    vermelho = 1;
                    amarelo = 0;
                    verde = 0;
                    if (pulso_atual && !pulso_anterior)
                        proximo_estado = 2'b01;
                end
            endcase
        end

end



endmodule
