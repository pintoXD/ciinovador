`timescale 1ns/1ps
module BIDIR_SHIFTREG#(parameter N=4)(
	input logic enable,
  	input logic shift_in,
  	input logic [N-1:0]d,
	input logic [1:0]OP,  
  	output logic [N-1:0]q,
  	output logic shift_out_right, shift_out_left 
);

	always_ff @(posedge enable)begin
		case (OP)
			2'b01: begin
				q <= {q[N-2:0], shift_in}; //shift left
			end
			2'b10: begin
			q <= {shift_in, q[N-1:1]}; //shift right
			end
			2'b11: begin 
				q <= d; 
			end  
			default: q <= q;
		endcase
	end
	assign shift_out_left = q[N-1];
	assign shift_out_right = q[0];

endmodule
