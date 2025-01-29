`include "uvm_macros.svh"
import uvm_pkg::*;

`include "trans.svh"
`include "source.svh"
`include "sink.svh"

module top;

   // declare and instanciate source and sink
   // there is no parent at the top level, so second argument is null
   source source_h = new("source_h", null);
   sink sink_h = new("sink_h", null);

   initial begin
      // connect source and sink
      source_h.out.connect (sink_h.in);
      // executing _put_ on the _out_ port inside _source_ will now call the task _put_ inside _sink_
      run_test ();
   end
endmodule

