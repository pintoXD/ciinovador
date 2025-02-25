class env extends uvm_env;
   `uvm_component_utils(env)
    
   source source_h;
   sink sink_h;

   function new(string name, uvm_component parent);
     super.new(name, parent);
   endfunction
   
   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     source_h = source::type_id::create("source_h", this);
     sink_h = sink::type_id::create("sink_h", this);
   endfunction

   function void connect_phase(uvm_phase phase);
     source_h.out.connect (sink_h.in);
   endfunction
    
endclass

