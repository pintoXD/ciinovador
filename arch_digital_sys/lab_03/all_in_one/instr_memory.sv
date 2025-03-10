module instr_memory (
    input logic [5:0] addr,
    output logic [31:0] instr
);
    
logic [31:0] mem_data [63:0];

initial begin
    $readmemh("memfile.dat", mem_data);
end

assign instr = mem_data[addr];

endmodule
