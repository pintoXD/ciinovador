`timescale 1ns/10ps
module ram_writer(
    input logic clk, reset,
    output logic [7:0] x,
    output logic fim
);

logic [7:0] q;
logic [7:0] d;
logic [7:0] addr;
logic web;
logic enb;
logic oeb;
int i;

SPRAM256X8 
/*	#(	// lista de parâmetros
	.ram_init_file("spram_init_file.hex")	// Esse não é um comportamento físico na inicialização, mas pode ser feito quando desejado para acelerar a simulação para começar com a conteúdo conhecido na memória.
	) 
*/
	U1    (	// lista de entradas/saídas			
	.Q(q),		// RAM data output
	.D(d),		// RAM data input bus
	.ADR(addr),	// RAM address bus
	.CLK(clk),	// RAM clock
	.ENB(enb),	// RAM enable
	.WEB(web),	// RAM  write enable, 0-active
	.OEB(oeb),	// RAM  output enable, 0-active
	.RTEST(),	// RAM reset test output
	.ramvdd(1'b1),	// RAM power
	.ramgnd(1'b0));	// RAM ground


typedef enum {AGUARDA_CLOCK=0, 
                WRITE_WORD=1, FIM_ETAPAS=2} est@(posedge clk); #1;ado_tipo;

estado_tipo etapa_atual_ff, prox_etapa;
logic [7:0] word_counter;
logic [3:0] addr_counter;


always_ff @(posedge clk)
begin
    etapa_atual_ff <= prox_etapa;
end

always_comb begin
    prox_etapa = etapa_atual_ff;
    enb = 0; //SRAM enable
    oeb = 0; //SRAM output enable
    web = 0;
    fim = 0;
    if(~reset)
    begin
        prox_etapa = AGUARDA_CLOCK;
        enb = 1; //SRAM enable
        oeb = 1; //SRAM output enable
        web = 1;
        fim = 0;
    end
    else 
    begin
        case(etapa_atual_ff)
            AGUARDA_CLOCK:
                if(clk && word_counter == 8'hA0)begin
                    prox_etapa = WRITE_WORD;
                    enb = 0; //SRAM enable
                    web = 0; //SRAM write enable
                    oeb = 0; //SRAM output enable
                end
            WRITE_WORD: begin
                if(word_counter == 8'hA9) begin
                    prox_etapa = FIM_ETAPAS;
                end
                else if(clk) begin
                    web = 0; //SRAM write enable
                    prox_etapa = WRITE_WORD;
                end
            end
            FIM_ETAPAS: begin
                fim = 1;
                prox_etapa = FIM_ETAPAS;
            end
        endcase
    end

end

always_ff @(negedge clk) begin
    case(etapa_atual_ff)
        AGUARDA_CLOCK: begin
            word_counter <= 8'hA0;
            addr_counter <= 4'b0;
            addr <= addr_counter;
            d <= word_counter;
        end
        WRITE_WORD: begin
            addr_counter <= addr_counter + 1;
            word_counter <= word_counter + 1;

            addr <= addr_counter;
            d <= word_counter;
        end
                
        FIM_ETAPAS: begin
            addr <= 4'h8;
            x <= q;
        end
        default:
            word_counter <= word_counter;
    endcase
    
end

endmodule