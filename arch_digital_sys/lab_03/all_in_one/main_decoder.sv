`timescale 1ns/1ps
module main_decoder (
    input logic [5:0] opcode,
    output logic MemtoReg, MemWrite,
    output logic Branch, ALUSrc,
    output logic RegDst, RegWrite,
    output logic Jump,
    output logic [1:0] ALUOp
);


always_comb begin : main_decoder_unit

    unique case(opcode) 
        6'b000000: begin //R-Type
            RegWrite = 1;
            RegDst = 1;
            ALUSrc = 0;
            Branch = 0;
            MemWrite = 0;
            MemtoReg = 0;
            Jump = 0;
            ALUOp[1] = 1;
            ALUOp[0] = 0;
        end

        6'b100011: begin //lw
            RegWrite = 1;
            RegDst = 0;
            ALUSrc = 1;
            Branch = 0;
            MemWrite = 0;
            MemtoReg = 1;
            Jump = 0;
            ALUOp[1] = 0;
            ALUOp[0] = 0;
        end
        6'b101011: begin //sw
            RegWrite = 0;
            RegDst = 0;
            ALUSrc = 1;
            Branch = 0;
            MemWrite = 1;
            MemtoReg = 0;
            Jump = 0;
            ALUOp[1] = 0;
            ALUOp[0] = 0;
        end
        6'b000100: begin //beq
            RegWrite = 0;
            RegDst = 0;
            ALUSrc = 0;
            Branch = 1;
            MemWrite = 0;
            MemtoReg = 0;
            Jump = 0;
            ALUOp[1] = 0;
            ALUOp[0] = 1;
        end
        6'b001000: begin //addi
            RegWrite = 1;
            RegDst = 0;
            ALUSrc = 1;
            Branch = 0;
            MemWrite = 0;
            MemtoReg = 0;
            Jump = 0;
            ALUOp[1] = 0;
            ALUOp[0] = 0;
        end
        6'b000010: begin //j
            RegWrite = 0;
            RegDst = 0;
            ALUSrc = 0;
            Branch = 0;
            MemWrite = 0;
            MemtoReg = 0;
            Jump = 1;
            ALUOp[1] = 0;
            ALUOp[0] = 0;
        end
        default: begin //Defaults to an R-Type instruction.
            RegWrite = 1'bx;
            RegDst = 1'bx;
            ALUSrc = 1'bx;
            Branch = 1'bx;
            MemWrite = 1'bx;
            MemtoReg = 1'bx;
            Jump = 1'bx;
            ALUOp[1] = 1'bx;
            ALUOp[0] = 1'bx;
        end
    
    endcase
end


endmodule
