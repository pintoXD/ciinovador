class sink extends uvm_component;
   `uvm_component_utils (sink)

   // Mention type of transaction, and type of class that implements the put ()
   uvm_blocking_put_imp #(a_tr, sink) in;

   function new (string name = "sink", uvm_component parent);
      super.new (name, parent);
      // instantiate the put_export passing a reference to the instance of this sink
      in = new ("in", this);
   endfunction

   task put (a_tr tr);
      // #5;
      // Here, we have received the transaction from source
      `uvm_info("SINK                          ", $sformatf("Transaction received: %d", tr.a), UVM_MEDIUM)
   endtask

endclass

