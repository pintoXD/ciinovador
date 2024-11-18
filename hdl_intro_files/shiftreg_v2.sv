// Write your modules here!
module shiftreg_v2#(parameter N=4)(
	input logic clk,
  	input logic [1:0] OP,
  	input logic [N-1:0]d,
  	output logic [N-1:0]q
);

	always_ff @(posedge clk)
		case (OP)
			2'b11: q <= d;   
			2'b10: q <= {1'b0, q[N-1:1]}; //shift right
			2'b01: q <= {q[N-2:0], 1'b0}; //shift left
			default: q <= q;
		endcase
endmodule
