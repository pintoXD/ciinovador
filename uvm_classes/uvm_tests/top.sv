`include "uvm_macros.svh"
import uvm_pkg::*;
`include "bvm_macros.svh" // macros created by Brazil-IP / UFCG

`include "trans.svh"
`include "source.svh"
`include "sink.svh"
`include "test.svh"

module top;
   
   initial begin
      run_test("test");
   end
endmodule

