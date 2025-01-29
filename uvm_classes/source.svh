class source extends uvm_component;
   `uvm_component_utils (source)

   // creating a put_port which will accept a "a_tr" type of data
   uvm_blocking_put_port #(a_tr) out;

   function new (string name = "source", uvm_component parent);
      super.new (name, parent);
      out = new ("out", this);
   endfunction

   task run_phase (uvm_phase phase);
      a_tr  tr;
      // generate 5 transactions and send it via the put_port
      repeat (5) begin
         tr = new();  // create transaction instance
         tr.a = $urandom_range (0, 100);  // assign random value to a
         `uvm_info ("SOURCE", "Sending transaction", UVM_MEDIUM)       
         out.put (tr);  // send transaction to put_port
         // #10;
      end
   endtask
endclass

