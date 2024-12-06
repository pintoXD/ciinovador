// xrun -input restore.tcl -gui -access rw -top tb tb.sv votador.sv
`timescale 1ns/1ps
module tb();

reg [3:0] V_s;

initial
begin
	#10ns
	V_s=0;
	while(V_s <= 7)
	begin
                #10ns;
		V_s = V_s +1;
	end
        V_s = 0;
	while(V_s <= 7)
	begin
                #10ns;
		V_s = V_s +1;
	end

	$display("It's over now");
	$finish();
end

votador design_under_test(
      .V(V_s[2:0]),
      .R()
      );


endmodule
