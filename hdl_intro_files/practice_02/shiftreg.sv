// Write your modules here!
module shiftreg#(parameter N=4)(
	input logic clk,
  	input logic reset, shift_load, left_shift,
  	input logic [N-1:0]d,
  	output logic [N-1:0]q
  	// input logic shift_in,
  	// output logic shift_out  
);

	always_ff @(posedge clk, posedge reset)
		if (reset) begin
			q <= 0;
		end
		else if (!shift_load) begin
			q <= d;
		end
		else if(!left_shift) begin
			q <= {1'b0, q[N-1:1]};
		end
		else begin
			q <= {q[N-2:0], 1'b0};
		end

	// assign shift_out = q[N-1];
	// always_ff @(posedge clk, posedge reset)
	// 	if (reset) begin
	// 		q <= 0;
	// 	end
	// 	else if (!shift_load) begin
	// 		q <= d;
	// 	end
	// 	else begin
	// 		// q <= {q[N-2:0], shift_in};
	// 	end

	// assign shift_out = q[N-1];


endmodule
