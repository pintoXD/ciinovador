`timescale 1ns/1ps
module pc(
    input logic clk, rst,
    input logic [31:0] next_addr,
    output logic [31:0] current_addr
);

always_ff @(posedge clk, negedge rst) begin
    if(~rst) begin
        current_addr <= 32'h0;
    end
    else begin
        current_addr <= next_addr;
    end
end



endmodule