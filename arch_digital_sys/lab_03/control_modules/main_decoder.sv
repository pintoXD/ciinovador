`timescale 1us/1ns
module main_decoder (
    input logic [5:0] opcode,
    output logic RegDst,
    output logic ALUSrc,
    output logic MemtoReg,
    output logic RegWrite,
    output logic MemRead,
    output logic MemWrite,
    output logic Branch,
    output logic ALUOp1,
    output logic ALUOp0
);

always_comb begin : control_unit

    unique case(opcode) 
        6'b000000: begin //R-Type
            RegDst = 1;
            ALUSrc = 0;
            MemtoReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            ALUOp1 = 1;
            ALUOp0 = 0;
        end

        6'b100011: begin //lw
            RegDst = 0;
            ALUSrc = 1;
            MemtoReg = 1;
            RegWrite = 1;
            MemRead = 1;
            MemWrite = 0;
            Branch = 0;
            ALUOp1 = 0;
            ALUOp0 = 0;
        end
        6'b101011: begin //sw
            RegDst = 1'bx;
            ALUSrc = 1;
            MemtoReg = 1'bx;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 1;
            Branch = 0;
            ALUOp1 = 0;
            ALUOp0 = 0;
        end
        6'b000100: begin //beq
            RegDst = 1'bx;
            ALUSrc = 1;
            MemtoReg = 1'bx;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
            Branch = 1;
            ALUOp1 = 0;
            ALUOp0 = 1;
        end
        default: begin //Defaults to an R-Type instruction.
            RegDst = 1;
            ALUSrc = 0;
            MemtoReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            ALUOp1 = 1;
            ALUOp0 = 0;
        end
    
    endcase
end




endmodule