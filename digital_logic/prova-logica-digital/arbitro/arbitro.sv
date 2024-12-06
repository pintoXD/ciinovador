module arbitro(
	input [3:0] req,
	output reg [3:0] grant,
	output available,
	output reg [1:0] grant_num
	);


always_comb
begin : define_grant
	grant= 4'b0000;
	if(req[3] == 1'b1)
		grant= 4'b1000;
	if(req[2] == 1'b1)
		grant= 4'b0100;
	if(req[1] == 1'b1)
		grant= 4'b0010;
	if(req[0] == 1'b1)
		grant= 4'b0001;
end

always_comb
begin : define_grant_num
case(grant)
	4'b0001:
		grant_num =  2'd0;
	4'b0010:
		grant_num =  2'd1;
	4'b0100:
		grant_num =  2'd2;
	4'b1000:
		grant_num =  2'd3;
	default:
		grant_num =  2'd00;
endcase
end

assign available = !(|(grant));

endmodule