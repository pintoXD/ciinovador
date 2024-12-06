`timescale 1ns/10ps
module dec_i2c(
	input logic clk, rst,
	input logic sda, scl,
	input logic pronto,
	input logic [6:0] endereco_local,

	output logic [6:0] endereco_recebido,
	output logic operacao, escrita, stop
);

logic sda_anterior, scl_anterior;
logic sobe_sda, sobe_scl, desce_sda;
logic stop_cond, start_cond;
logic [6:0] addr_ff;
logic enable_serial_writing;

typedef enum {ESCUTA_SDA_SCL=1, RECEBEU_START=2, RECEBEU_STOP=3} tipo_estados;
tipo_estados estado_atual_ff, proximo_estado;

always_ff@(posedge clk) begin
	estado_atual_ff <= proximo_estado;
	scl_anterior <= scl;
end

always_ff@(negedge clk) begin
	sda_anterior <= sda;
end


assign desce_sda = ((sda==0) && (sda_anterior==1)); //detecta quando sda descer
assign sobe_sda  = ((sda==1) && (sda_anterior==0)); //detecta quando sda subir

assign sobe_scl = ((scl==1) && (scl_anterior==0));  //detecta quando scl subir


assign start_cond = (((scl== 1) && desce_sda)); //gera start cond
assign stop_cond = (((scl == 1) && sobe_sda)); //gera stop cond




always_ff @(posedge scl) begin
	if (enable_serial_writing)
	begin
		addr_ff[6] <= sda;
		addr_ff[5] <= addr_ff[6];
		addr_ff[4] <= addr_ff[5];
		addr_ff[3] <= addr_ff[4];
		addr_ff[2] <= addr_ff[3];
		addr_ff[1] <= addr_ff[2];
		addr_ff[0] <= addr_ff[1];
	end
end

always_comb begin
	proximo_estado = estado_atual_ff;
	operacao = 0;
	escrita = 0;
	stop = 0;
	
	if(rst)
		proximo_estado = ESCUTA_SDA_SCL;
	else begin
		case(estado_atual_ff)
			ESCUTA_SDA_SCL:	begin 
				if(start_cond)
					proximo_estado = RECEBEU_START;
				else if (stop_cond)
					proximo_estado = RECEBEU_STOP;
				else
					proximo_estado = ESCUTA_SDA_SCL;	
			end

			RECEBEU_START: begin
				enable_serial_writing = 1;
				proximo_estado = ESCUTA_SDA_SCL;
			end

			RECEBEU_STOP: begin
				enable_serial_writing = 0;
				proximo_estado = ESCUTA_SDA_SCL;
			end
		endcase	
	end

end



endmodule
