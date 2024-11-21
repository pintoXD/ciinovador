module tb();

reg EN = 0;

reg [7:0] A = 0;

initial
begin
		#1ns;
		A=1;
		#1ns;
		EN=1;
		#1ns;
		A = A+1;
		while(A < 255)
		begin
			#2ns;
			A = A+1;
		end
end


endmodule