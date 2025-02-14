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
      // Here, we have received the transaction from source
      `uvm_info("SINK                          ", "Transaction received\n", UVM_MEDIUM)
      #10; // let the transaction take some time do be completed
      `bvm_end_tr(tr)
   endtask

endclass

