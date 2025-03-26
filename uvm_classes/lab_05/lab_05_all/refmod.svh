class refmod extends uvm_component;
   `uvm_component_utils(refmod)

   uvm_get_port #(a_tr) in; 
   uvm_blocking_put_port #(a_tr) out; 

   function new(string name, uvm_component parent=null);
      super.new(name,parent);
      in  = new("in",  this);
      out = new("out", this);
   endfunction : new

   task run_phase (uvm_phase phase);

     a_tr tr_in, tr_out;
     bit continue_processing = 1;
     string msg;
     int count_all, count_upper, count_middle, count_lower;

     while(continue_processing) begin
        in.get(tr_in);

        #10;
        `bvm_end_tr(tr_in);
        count_all++;
         if(tr_in.a > 40) begin
             count_upper++;
         end else if (tr_in.a < 20) begin
             count_lower++;
         end else begin
             count_middle++;
         end

         msg = $sformatf("RCVD transaction: %0d | COUNT_UPPER: %0d | COUNT_MIDDLE: %0d | \
         COUNT_LOWER: %0d | COUNT_ALL: %0d", 
         tr_in.a, count_upper, count_middle, count_lower, count_all); // Format the message
         `uvm_info("REFMOD", msg, UVM_MEDIUM);

        tr_out = a_tr::type_id::create("tr_out", this);
        tr_out.a = tr_in.a + 100;

        `bvm_begin_tr(tr_out)
        #10;
        out.put(tr_out);
     end

   endtask

endclass

