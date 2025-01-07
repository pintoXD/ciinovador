`timescale 1ns/1ps
module BIDIR_SHIFTREG#(parameter N=4)(
	input logic enable,
  	input logic shift_in,
  	input logic [N-1:0]d,
	input logic [1:0]PT2272_BIT,
	input logic [2:0]OP,  
  	output logic [N-1:0]q,
  	output logic shift_out_right, shift_out_left 
);

	always_ff @(posedge enable)begin
		unique case (OP)
			3'b001: begin
				q <= {q[N-2:0], shift_in}; //shift left
			end
			3'b010: begin
				q <= {shift_in, q[N-1:1]}; //shift right
			end
			3'b011: begin 
				q <= d; //load
			end
			3'b100: begin 
				q <= {q[N-3:0], PT2272_BIT}; //shift two bits to the left
			end
			3'b101: begin 
				q <= {PT2272_BIT, q[N-1:2]}; //shift two bits to the right
			end
			default: q <= q; //do nothing
		endcase
	end
	assign shift_out_left = q[N-1];
	assign shift_out_right = q[0];

endmodule
