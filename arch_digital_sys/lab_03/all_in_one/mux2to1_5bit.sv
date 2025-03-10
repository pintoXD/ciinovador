`timescale 1ns/1ps
module mux2to1_5bit (
    input logic Select,
    input logic [4:0] Data0,
    input logic [4:0] Data1,
    output logic [4:0] DataOut
);

    assign DataOut = Select ? Data1 : Data0;

endmodule
