class test extends uvm_test;
   `uvm_component_utils(test)
    
   source source_h;
   sink sink_h;

   function new(string name, uvm_component parent);
     super.new(name, parent);
   endfunction
   
   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     source_h = new("source_h", this);
     sink_h = new("sink_h", this);
   endfunction

   function void connect_phase(uvm_phase phase);
     source_h.out.connect (sink_h.in);
   endfunction
       
endclass

