class analysis_source extends uvm_component;
   `uvm_component_utils (analysis_source)

   // We are creating an analysis_port which will accept a "a_tr" type of data
   uvm_analysis_port #(a_tr) out;

   function new (string name = "source", uvm_component parent);
      super.new (name, parent);
      out = new ("out", this);
   endfunction

   task run_phase (uvm_phase phase);
      a_tr  tr;

      phase.raise_objection(this);

      // Let us generate 5 transactions and send it via the analysis port
      repeat (5) begin
         #30; // wait some time before the transaction begins
         tr = a_tr::type_id::create("tr", this);
         assert(tr.randomize ());
         `bvm_begin_tr(tr)  
         `uvm_info ("SOURCE", "Sending transaction", UVM_MEDIUM)
         out.write (tr);  // send transaction to analysis port
      end

      #120; // allow for some downstream processing time
      phase.drop_objection(this);
   endtask
endclass

