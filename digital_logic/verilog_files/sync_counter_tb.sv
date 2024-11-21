`timescale 1ns/1ps
module contador_tb();

    logic clk, reset;
    logic [4:0] valor_maximo;
    logic [4:0] contagem;
    logic fim;

    contador dut(
        .clk(clk),
        .reset(reset),
        .valor_maximo(valor_maximo),
        .contagem(contagem),
        .fim(fim)
    );

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1'b1;
        valor_maximo = 5'b11111;
        #10 //esperar o reset dar efeito
        reset = 1'b0;
        #750;

        $finish;

    end


endmodule