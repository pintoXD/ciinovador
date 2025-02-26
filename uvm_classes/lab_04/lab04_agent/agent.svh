class agent extends uvm_agent;
  `uvm_component_utils(agent)
    
   uvm_analysis_port #(a_tr) out;
    
   analysis_source source_h;

   function new(string name, uvm_component parent);
     super.new(name, parent);
   endfunction

   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     out = new("out", this);
     source_h = analysis_source::type_id::create("source_h", this);
   endfunction

   function void connect_phase(uvm_phase phase);
     source_h.out.connect(out);
   endfunction
    
endclass

