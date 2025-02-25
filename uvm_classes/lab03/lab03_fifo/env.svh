class env extends uvm_env;
   `uvm_component_utils(env)
    
   source source_h;
   uvm_tlm_fifo #(a_tr) source_drain;
   drain drain_h;

   function new(string name, uvm_component parent);
     super.new(name, parent);
   endfunction
   
   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     source_h = source::type_id::create("source_h", this);
     drain_h = drain::type_id::create("drain_h", this);
     source_drain = new("source_drain",this,2);
   endfunction

   function void connect_phase(uvm_phase phase);
     source_h.out.connect (source_drain.put_export);
     drain_h.in.connect( source_drain.get_export );
   endfunction
   
endclass

