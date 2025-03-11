`timescale 1ns/1ps
module ALU_decoder (
    input logic [5:0] Funct_Field,
    input logic [1:0] ALUop,
    output logic [2:0] ALUcontrol_output
);
    

    always_comb begin : alu_control_logic
        case(ALUop)
            2'b00: //Handles LW and SW instructions
                ALUcontrol_output = 3'b010;
            2'b01: //Handles BEQ instructions
                ALUcontrol_output = 3'b110;
            2'b10: begin //According to the literature, this should act like a "Look at the Funct Field" case.
                if(Funct_Field == 6'b100000)
                    ALUcontrol_output = 3'b010;   
                else if(Funct_Field == 6'b100010)
                    ALUcontrol_output = 3'b110;
            end
            default: begin
                case(Funct_Field)
                    6'b100100: //ANDs
                        ALUcontrol_output = 3'b000;
                    6'b100101: //ORs
                        ALUcontrol_output = 3'b001;
                    6'b101010: //Sets less than (SLT)
                        ALUcontrol_output = 3'b111;
                    default: //Illegal operation
                        ALUcontrol_output = 3'bxxx;
                endcase
            end
        endcase
    end
endmodule
