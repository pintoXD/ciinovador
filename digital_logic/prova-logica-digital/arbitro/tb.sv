module tb();

reg [3:0] req = 0;

always
begin
	#1ns;
	req = req << 1;
	#1ns;
	req = req << 1;
	#1ns;
	req = req << 1;
	#1ns;
	req = req << 1;
	#1ns;
	req = req << 1;
end

initial
begin
	#20ns;
	$finish();
end

 arbitro U1(
	.req(req),
	.grant(),
	.available(),
	.grant_num()
	);


endmodule