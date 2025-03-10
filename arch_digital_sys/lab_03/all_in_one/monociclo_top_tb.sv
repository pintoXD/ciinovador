/* verilator lint_off INITIALDLY */
`timescale 1ns/1ps
module monociclo_top_tb();

  logic        clk;
  logic        reset;

  logic [31:0] writedata, dataadr;
  logic        memwrite;

  // instantiate device to be tested
  monociclo_top DUT(
    .clk(clk), 
    .reset(reset), 
    .TOP_WriteData(writedata), 
    .TOP_DataAddr(dataadr), 
    .TOP_MemWrite(memwrite)
  );
  
  // initialize test
  initial
    begin
      reset <= 1; # 22; reset <= 0;
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

  int count = 0; 
  // check results
  always @(negedge clk)
    begin
      // $display("dataadr = %d, writedata = %d, memwrite = %d", dataadr, writedata, memwrite);
      if(memwrite) begin
        if(dataadr === 84 & writedata === 7) begin
          $display("Simulation succeeded");
          $stop;
        end else if (dataadr !== 80) begin
          $display("Simulation failed");
          $stop;
        end
      end 
      count = count + 1;
      if(count > 1000) begin
        $display("Simulation failed");
        $stop;
      end
    end
endmodule
