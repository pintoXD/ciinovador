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


  typedef enum {INITIAL_STATE=0, SRAM_STARTUP=1,AWAITS_CLOCK,
                WRITE_WORD, STOP_WRITING, READ_ADDRESS_8, FINISH_FSM} estado_tipo;

estado_tipo etapa_atual_ff, prox_etapa;
logic [7:0] word_counter;
logic [3:0] addr_counter;
logic [15:0] clk_counter;

  
assign x = q;
assign fim = (x == 8'hA8) ? 1 : 0;


always_ff @(posedge clk)
begin
    etapa_atual_ff <= prox_etapa;
end

always_comb begin

    prox_etapa = etapa_atual_ff;

    if(~reset)
    begin
        prox_etapa = SRAM_STARTUP;
        enb = 1; //SRAM disable
        oeb = 1; //SRAM output disable
        web = 1;
    end
    else 
    begin
        case(etapa_atual_ff)
          	INITIAL_STATE:
              //Just to initialize internal elements
              if(clk)
                prox_etapa = SRAM_STARTUP;
          
            SRAM_STARTUP: begin // 100 clock cycles to initialize SRAM
                if(clk) begin
                  if(clk_counter < 100)
                        prox_etapa = SRAM_STARTUP;
                    else
                        prox_etapa = AWAITS_CLOCK;
                end
            end

            AWAITS_CLOCK:
                if(clk && word_counter == 8'hA0)begin
                    web = 0; //SRAM write enable
                    oeb = 0; //SRAM output enable
                    enb = 0; //SRAM enable
                    prox_etapa = WRITE_WORD;
                end

            WRITE_WORD: begin
              if(word_counter == 8'hA9) begin
                    prox_etapa = STOP_WRITING;
                end
                else if(clk) begin
                    web = 0; //SRAM write enable
                    prox_etapa = WRITE_WORD;
                end
            end
          	
          	STOP_WRITING:
              if(clk_counter < 3) begin //Awaits for the last words to be written
                prox_etapa = STOP_WRITING;
              end
          	  else begin
                web = 1; //SRAM write disable
                prox_etapa = READ_ADDRESS_8;
              end
          	
          	READ_ADDRESS_8: begin
              if(clk)begin
                prox_etapa = FINISH_FSM;
              end
            end
          
            FINISH_FSM: begin
                if(clk) begin
                  prox_etapa = FINISH_FSM;
              	end
            end

        endcase
    end

end

  always_ff @(posedge clk) begin
  	addr_counter <= 0;
  	clk_counter <= 0;
    case(etapa_atual_ff)
        SRAM_STARTUP: begin
            clk_counter <= clk_counter + 1;
        end
        AWAITS_CLOCK: begin
            clk_counter <= 0;
          	word_counter <= 8'hA0;
        end
        WRITE_WORD: begin
          	clk_counter <= 0;
            addr_counter <= addr_counter + 1;
            word_counter <= word_counter + 1;

            addr <= addr_counter;
            d <= word_counter;
        end
      	
      	STOP_WRITING: begin
          clk_counter <= clk_counter + 1;          	
        end
      	
      	READ_ADDRESS_8: begin
          addr <= 8'h8;
        end
      
        FINISH_FSM: begin
        end
      
        default:
            word_counter <= word_counter;
      
    endcase
    
end

endmodule
