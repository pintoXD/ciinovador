`timescale 1ns/1ps
module alu32(
    input logic [31:0] SrcA, SrcB,
    input logic [2:0] ALUControl,
    output logic [31:0] ALUResult,
    output logic FlagZ
);

    always_comb begin
        case(ALUControl)
            3'b000: //ANDs
                begin
                    ALUResult = SrcA & SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            3'b001: //ORs
                begin
                    ALUResult = SrcA | SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            3'b010: //Adds
                begin
                    ALUResult = SrcA + SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            3'b110: //Subtracts
                begin
                    ALUResult = SrcA - SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            3'b111: //Sets less than (SLT)
                begin
                    ALUResult = (SrcA < SrcB) ? 32'h1 : 32'h00;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            default:
                begin
                    ALUResult = 32'b0;
                    FlagZ = 1'b1;
                end
        endcase
    end

endmodule
