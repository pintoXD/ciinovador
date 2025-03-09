module alu32(
    input logic signed [31:0] SrcA, SrcB,
    input logic signed [3:0] ALUControl,
    output logic signed [31:0] ALUResult,
    output logic FlagZ
);

    always_comb begin
        case(ALUControl)
            4'b0000: //ANDs
                begin
                    ALUResult = SrcA & SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            4'b0001: //ORs
                begin
                    ALUResult = SrcA | SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            4'b0010: //Adds
                begin
                    ALUResult = SrcA + SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            4'b0110: //Subtracts
                begin
                    ALUResult = SrcA - SrcB;
                    FlagZ = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
                end
            4'b0111: //Sets less than (SLT)
                begin
                    ALUResult = (SrcA < SrcB) ? 8'hFF : 8'h00;
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