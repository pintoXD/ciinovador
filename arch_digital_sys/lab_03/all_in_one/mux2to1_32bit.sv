module mux2to1_32bit (
    input logic Select,
    input logic [31:0] Data0,
    input logic [31:0] Data1,
    output logic [31:0] DataOut
);

    assign DataOut = Select ? Data1 : Data0;

endmodule
