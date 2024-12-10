`timescale 1ns/1ps
module ula8(
    input logic [7:0] SrcA, SrcB,
    input logic [2:0] ULAControl,
    input logic IsLogic,
    output logic [7:0] ULAResult,
    output logic FlagZ
);

always_comb begin

    if (IsLogic) begin
        case(ULAControl)
            3'b000: //NOT A
                begin
                    ULAResult = ~SrcA;
                    FlagZ = (ULAResult == 8'b0) ? 1'b1 : 1'b0;
                end
            3'b001: //NOR 
                begin
                    ULAResult = ~(SrcA | SrcB);
                    FlagZ = (ULAResult == 8'b0) ? 1'b1 : 1'b0;
                end
            3'b010: //NAND
                begin
                    ULAResult = ~(SrcA & SrcB);
                    FlagZ = (ULAResult == 8'b0) ? 1'b1 : 1'b0;
                end
            3'b011: //XNOR
                begin
                    ULAResult = (SrcA ~^ SrcB);
                    FlagZ = (ULAResult == 8'b0) ? 1'b1 : 1'b0;
                end
            3'b100: //AND
                begin
                    ULAResult = SrcA & SrcB;
                    FlagZ = (ULAResult == 8'b0) ? 1'b1 : 1'b0;
                end
            3'b101: //OR
                begin
                    ULAResult = SrcA | SrcB;
                    FlagZ = (ULAResult == 8'b0) ? 1'b1 : 1'b0;
                end
            3'b110: //XOR
                begin
                    ULAResult = SrcA ^ SrcB;
                    FlagZ = (ULAResult == 8'b0) ? 1'b1 : 1'b0;
                end
            3'b111: //NOT B
                begin
                    ULAResult = ~SrcB;
                    FlagZ = (ULAResult == 8'b0) ? 1'b1 : 1'b0;
                end

            default:
                begin
                    ULAResult = 8'b0;
                    FlagZ = 1'b1;
                end
        endcase
    end 
    else begin
        case(ULAControl)
            3'b000: //Adds
                begin
                    ULAResult = SrcA + SrcB;
                    FlagZ = (ULAResult == 8'b0) ? 1'b1 : 1'b0;
                end
            3'b001: //Subtracts
                begin
                    ULAResult = SrcA + ~SrcB + 1;
                    FlagZ = (ULAResult == 8'b0) ? 1'b1 : 1'b0;
                end
            3'b010: //Multiplies
                begin
                    ULAResult = SrcA * SrcB;
                    FlagZ = (ULAResult == 8'b0) ? 1'b1 : 1'b0;
                end
            3'b011: //Divides
                begin
                    ULAResult = SrcA / SrcB;
                    FlagZ = (ULAResult == 8'b0) ? 1'b1 : 1'b0;
                end
            3'b100: //Subtraction: SrcA - 1
                begin
                    ULAResult = SrcA - 1;
                    FlagZ = (ULAResult == 8'b0) ? 1'b1 : 1'b0;
                end
            3'b101: //Subtraction: SrcB - 1
                begin
                    ULAResult = SrcB - 1;
                    FlagZ = (ULAResult == 8'b0) ? 1'b1 : 1'b0;
                end
            3'b110: //Subtraction: SrcA + ~SrcB
                begin
                    ULAResult = SrcA + (~SrcB);
                    FlagZ = (ULAResult == 8'b0) ? 1'b1 : 1'b0;
                end
            3'b111: //Subtraction: ~SrcA + SrcB
                begin
                    ULAResult = (~SrcA) + SrcB;
                    FlagZ = (ULAResult == 8'b0) ? 1'b1 : 1'b0;
                end

            default:
                begin
                    ULAResult = 8'b0;
                    FlagZ = 1'b1;
                end
        endcase
    end
    
end

endmodule
