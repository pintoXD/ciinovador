`timescale 1ns/1ps
module custom_ula(
    input logic [7:0] SrcA, SrcB,
    input logic [2:0] ULAControl,
    output logic [7:0] ULAResult,
    output logic FlagZ
);

always_comb begin
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
        3'b010: //ANDs
            begin
                ULAResult = SrcA & SrcB;
                FlagZ = (ULAResult == 8'b0) ? 1'b1 : 1'b0;
            end
        3'b011: //ORs
            begin
                ULAResult = SrcA | SrcB;
                FlagZ = (ULAResult == 8'b0) ? 1'b1 : 1'b0;
            end
        3'b101: //Sets less than (SLT)
            begin
                ULAResult = (SrcA < SrcB) ? 8'hFF : 8'h00;
                FlagZ = (ULAResult == 8'b0) ? 1'b1 : 1'b0;
            end

        default:
            begin
                ULAResult = 8'b0;
                FlagZ = 1'b1;
            end
    endcase
    
end

endmodule