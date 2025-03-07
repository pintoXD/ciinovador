module alu32_add(
    input logic [31:0] SrcA, SrcB,
    output logic [31:0] ALUResult
);

    always_comb begin
        ALUResult = SrcA + SrcB;
        FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
    end
endmodule