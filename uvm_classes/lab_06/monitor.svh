class monitor extends uvm_monitor;  
   `uvm_component_utils(monitor)

   uvm_analysis_port #(a_tr) out;
    
   virtual a_if a_vi; 

   function new(string name, uvm_component parent);
      super.new(name, parent);
      out = new("out", this);
   endfunction: new
    
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      assert( uvm_config_db #(virtual a_if)::get(this, "", "a_vi", a_vi) );
   endfunction
   
   task run_phase(uvm_phase phase);
      a_tr tr;
      forever begin
         wait (a_vi.reset === 0);
         tr = a_tr::type_id::create("tr");

         // @(posedge a_vi.clock iff); // at next rising clock which has valid set
         @(posedge a_vi.clock); // at next rising clock which has valid set
         `bvm_begin_tr(tr) // start transaction recording
         // $display("===== CLK: %0d | START: %0d | VALID: %0d | RAD: %0d | ROOT: %0d =====", 
         //          a_vi.clock, a_vi.start, a_vi.valid, a_vi.a, a_vi.outp.sqrt_a);
         // #100;
         tr.a = a_vi.a; // get transaction property value
       
         out.write(tr);
         #50;
      end
   endtask

endclass

