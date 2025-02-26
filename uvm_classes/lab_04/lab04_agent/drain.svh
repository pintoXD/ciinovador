class drain extends uvm_component;
   `uvm_component_utils (drain)
   
   uvm_get_port #(a_tr) in; 

   function new (string name = "drain", uvm_component parent = null);
      super.new (name, parent);
      in = new ("in", this);
   endfunction
   
   task  run_phase (uvm_phase phase);
      a_tr tr;

      #30;
      forever begin
        #10; 
        in.get(tr);
        `uvm_info("DRAIN                          ", "Transaction received", UVM_MEDIUM)
        #10; 
        `bvm_end_tr(tr);
      end

   endtask
   
endclass

