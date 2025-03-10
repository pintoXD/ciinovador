`timescale 1ns/1ps
module instr_memory (
    input logic [5:0] addr,
    output logic [31:0] instr
);
    
logic [31:0] mem_data [63:0];

initial begin
    $readmemh("memfile.dat", mem_data);
    $display("Instr Memory loaded: %0h", mem_data[0]);
    #1;
    $display("Instr Memory loaded: %0h", mem_data[17]);
end

assign instr = mem_data[addr];

endmodule
