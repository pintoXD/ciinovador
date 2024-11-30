/* verilator lint_off DECLFILENAME */

module ha_tb;
	parameter N = 2;
  reg  [N-1:0] a, b;
  wire [N-1:0] sum, cout;

  // Instantiate top level design with N=2 so that it will have 2
  // separate instances of half adders and both are given two separate
  // inputs
  my_design #(.N(N)) md( .a(a), .b(b), .sum(sum), .cout(cout));

  initial begin
    a[0] = 1'b0;
    b[0] = 1'b0;

    $monitor ("a=%b b=%b sum=%b cout=%b", a, b, sum, cout);

    #10
        a[1] = 1'b0;
        b[1] = 1'b1;
    #20 
        b[0] = 1'b1;
    #10 
        a[1] = 1'b0;
  end
endmodule
