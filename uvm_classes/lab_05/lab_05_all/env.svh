class env extends uvm_env;
   `uvm_component_utils(env)
    
   agent agent_h;
   coverage_in coverage_in_h;
   uvm_tlm_analysis_fifo #(a_tr) agent_refmod;
   refmod refmod_h;
   sink sink_h;

   function new(string name, uvm_component parent);
     super.new(name, parent);
   endfunction
   
   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     agent_h = agent::type_id::create("agent_h", this);
     coverage_in_h = coverage_in::type_id::create("coverage_in_h", this);
     agent_refmod = new("agent_refmod",this);
     refmod_h = refmod::type_id::create("refmod_h", this);
     sink_h = sink::type_id::create("sink_h", this);
   endfunction

   function void connect_phase(uvm_phase phase);
     agent_h.out.connect (coverage_in_h.analysis_export);
     agent_h.out.connect (agent_refmod.analysis_export);
     refmod_h.in.connect (agent_refmod.get_export );
     refmod_h.out.connect( sink_h.in );
   endfunction
   
endclass

