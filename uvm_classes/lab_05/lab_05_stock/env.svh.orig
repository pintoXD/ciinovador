class env extends uvm_env;
   `uvm_component_utils(env)
    
   source source_h;
   uvm_tlm_fifo #(a_tr) source_refmod;
   refmod refmod_h;
   sink sink_h;

   function new(string name, uvm_component parent);
     super.new(name, parent);
   endfunction
   
   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     source_h = source::type_id::create("source_h", this);
     source_refmod = new("source_refmod",this,2);
     refmod_h = refmod::type_id::create("refmod_h", this);
     sink_h = sink::type_id::create("sink_h", this);
   endfunction

   function void connect_phase(uvm_phase phase);
     source_h.out.connect (source_refmod.put_export);
     refmod_h.in.connect( source_refmod.get_export );
     refmod_h.out.connect( sink_h.in );
   endfunction
   
endclass

