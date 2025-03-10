`timescale 1us/1ns
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
        default: begin //Defaults to an R-Type instruction.
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
    
    endcase
end


endmodule
