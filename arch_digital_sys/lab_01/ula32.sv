`timescale 1ns/1ps
module ula32(
    input logic signed [31:0] SrcA, SrcB,
    input logic signed [3:0] ALUControl,
    output logic signed [31:0] ALUResult,
    output logic FlagZ
);

    always_comb begin
        case(ALUControl)
            4'b0000: //Adds
                begin
                    ALUResult = SrcA + SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            4'b0001: //Subtracts
                begin
                    ALUResult = SrcA - SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            4'b0010: //ANDs
                begin
                    ALUResult = SrcA & SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            4'b0011: //ORs
                begin
                    ALUResult = SrcA | SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            4'b0100: //XORs
                begin
                    ALUResult = SrcA ^ SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            4'b0101: //Sets less than (SLT)
                begin
                    ALUResult = (SrcA < SrcB) ? 8'hFF : 8'h00;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            4'b0110: //Logical Shift Left (LSL)
                begin
                    ALUResult = SrcA << SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            4'b0111: //Arithmetic Shift Right (ASR)
                begin
                    ALUResult = signed'(SrcA) >>> SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            4'b1000: //Logical Shift Left (LSR)
                begin
                    ALUResult = SrcA >> SrcB;
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