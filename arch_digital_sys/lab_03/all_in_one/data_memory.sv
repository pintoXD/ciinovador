`timescale 1ns/1ps
/* verilator lint_off WIDTHTRUNC */
module data_memory(
    input logic clk, we,
    input logic [31:0] data_in, addr,
    output logic [31:0] data_out
);

logic [31:0] mem_data [63:0];

assign data_out = mem_data[addr[31:2]];

always_ff @(clk) begin
    if (we) begin
        mem_data[addr[31:2]] <= data_in;
    end
end



endmodule
