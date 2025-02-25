class env extends uvm_env;
   `uvm_component_utils(env)
    
   analysis_source source_h;
   coverage_in coverage_in_h;
   uvm_tlm_analysis_fifo #(a_tr) source_refmod;
   refmod refmod_h;
   sink sink_h;

   function new(string name, uvm_component parent);
     super.new(name, parent);
   endfunction
   
   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     source_h = analysis_source::type_id::create("source_h", this);
     coverage_in_h = coverage_in::type_id::create("coverage_in_h", this);
     source_refmod = new("source_refmod",this);
     refmod_h = refmod::type_id::create("refmod_h", this);
     sink_h = sink::type_id::create("sink_h", this);
   endfunction

   function void connect_phase(uvm_phase phase);
     source_h.out.connect (coverage_in_h.analysis_export);
     source_h.out.connect (source_refmod.analysis_export);
     refmod_h.in.connect( source_refmod.get_export );
     refmod_h.out.connect( sink_h.in );
   endfunction
   
endclass

