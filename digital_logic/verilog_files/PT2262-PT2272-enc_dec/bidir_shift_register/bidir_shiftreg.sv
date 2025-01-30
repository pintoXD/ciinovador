`timescale 1ns/1ps
/*  I couldn't solve the errors from using parameters when trying to synthesize the code.
*	Genus kept warming me that this module was missing. As an workaround I decided
*	to just not use the parameter keyword anymore and instead, hardcode the size of the shift register.
*	It's not beautiful but it works.
*/

// module BIDIR_SHIFTREG#(parameter N=26)(
module BIDIR_SHIFTREG(
	input logic enable,
	input logic reset,
  	input logic shift_in,
  	// input logic [N-1:0]d,
  	input logic [25:0]d,
	input logic [1:0]PT2272_BIT,
	input logic [2:0]OP,  
  	// output logic [N-1:0]q,
  	output logic [25:0]q,
  	output logic shift_out_right, shift_out_left 
);

	always_ff @(posedge enable, posedge reset)begin
		if(reset) begin
			q <= 26'b0;
		end else begin
			unique case (OP)
				3'b001: begin
					// q <= {q[N-2:0], shift_in}; //shift left
					q <= {q[24:0], shift_in}; //shift left
				end
				3'b010: begin
					// q <= {shift_in, q[N-1:1]}; //shift right
					q <= {shift_in, q[25:1]}; //shift right
				end
				3'b011: begin 
					q <= d; //load
				end
				3'b100: begin 
					// q <= {q[N-3:0], PT2272_BIT}; //shift two bits to the left
					q <= {q[23:0], PT2272_BIT}; //shift two bits to the left
				end
				3'b101: begin 
					// q <= {PT2272_BIT, q[N-1:2]}; //shift two bits to the right
					q <= {PT2272_BIT, q[25:2]}; //shift two bits to the right
				end
				default: q <= q; //do nothing
			endcase
		end
	end
	// assign shift_out_left = q[N-1];
	assign shift_out_left = q[25];
	assign shift_out_right = q[0];

endmodule
