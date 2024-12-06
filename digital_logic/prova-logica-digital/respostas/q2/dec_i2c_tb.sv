`timescale 1ns/10ps
module dec_i2c_tb (
);

    logic clk;
    logic rst = 1;
    logic sda, scl;
    logic pronto = 1;
    logic [6:0]endereco_local;
    logic [7:0]dado;
    logic operacao;
    logic escrita;
    logic stop;
    logic [6:0]endereco_recebido;
    parameter SCL_PERIOD = 100;

    dec_i2c DUT(
        .clk(clk),
        .rst(rst),
        .sda(sda),
        .scl(scl),
        .pronto(pronto),
        .endereco_local(endereco_local),
        .operacao(operacao),
        .escrita(escrita),
        .stop(stop),
        .endereco_recebido(endereco_recebido)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial
    begin
        @(posedge clk)
        rst = 1;
        #5;

        sda = 1;
        scl = 0;
        dado = 8'b11001000; // Exemplo de dado para envio
        #(SCL_PERIOD *2);
        scl = 1;
        #(SCL_PERIOD / 2);
        scl = 0;
        #(SCL_PERIOD / 2);
        scl = 1;
        
        // START condition (sda: HIGH -> LOW quando scl está em HIGH)
        #(SCL_PERIOD / 2);
        sda = 0;
        // pronto = 0;
        #(SCL_PERIOD / 2);
        
        // Envio do byte de dados (8 bits, MSB primeiro)
        for (int i = 7; i >= 0; i--) begin
            scl = 0;                     // Baixa scl para preparar dados
            #(SCL_PERIOD / 3);
            
            sda = dado[i];          // Configura bit no sda

            #(SCL_PERIOD / 3);
            scl = 1;                     // Pulso de clock
            #(SCL_PERIOD / 3);
        end
        
        // Bit de ACK/NACK (do slave)
        scl = 0;                         // Baixa scl para preparar o ACK
        #(SCL_PERIOD / 3);
        sda = 0;                       // ACK/NACK no sda
        #(SCL_PERIOD / 3);
        scl = 1;                         // Pulso de clock para ACK
        #(SCL_PERIOD / 3);
        scl = 0;

        // STOP condition (sda: LOW -> HIGH quando scl está em HIGH)
        sda = 0;
        #(SCL_PERIOD / 2);
        scl = 1;
        #(SCL_PERIOD / 2);
        sda = 1;
    
        #(SCL_PERIOD *5);
        // Finalização da simulação
        $finish;

end


initial
begin
    $display("Comecou o teste");
    $dumpfile("test.vcd");
    $dumpvars(0,dec_i2c_tb);    
    $timeformat(-9, 2, " ns", 20);
    end


endmodule