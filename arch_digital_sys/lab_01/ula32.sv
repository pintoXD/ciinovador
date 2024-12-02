`timescale 1ns/1ps
module ula32(
    input logic signed [31:0] SrcA, SrcB,
    input logic signed [2:0] ALUControl,
    output logic signed [31:0] ALUResult,
    output logic FlagZ
);

    always_comb begin
        case(ALUControl)
            3'b000: //Adds
                begin
                    ALUResult = SrcA + SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            3'b001: //Subtracts
                begin
                    ALUResult = SrcA - SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            3'b010: //ANDs
                begin
                    ALUResult = SrcA & SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            3'b011: //ORs
                begin
                    ALUResult = SrcA | SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            3'b100: //XORs
                begin
                    ALUResult = SrcA ^ SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            3'b101: //Sets less than (SLT)
                begin
                    ALUResult = (SrcA < SrcB) ? 8'hFF : 8'h00;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            3'b110: //Logical Shift Left (LSL)
                begin
                    ALUResult = SrcA << SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            3'b111: //Arithmetic Shift Right (ASR)
                begin
                    ALUResult = signed'(SrcA) >>> SrcB;
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