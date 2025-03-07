`timescale 1us/1ns
module ALU_control (
    input logic [1:0] ALUop,
    input logic [5:0] Funct_Field,
    output logic [3:0] ALUcontrol_output
);
    

    always_comb begin : alu_control_logic
        case(ALUop)
            2'b00: //Handles LW and SW instructions
                ALUcontrol_output = 4'b0010;
            2'b01: //Handles BEQ instructions
                ALUcontrol_output = 4'b0110;
            2'b10: begin
                if(Funct_Field == 6'b100000)
                    ALUcontrol_output = 4'b0010;   
                else if(Funct_Field == 6'b100010)
                    ALUcontrol_output = 4'b0110;
            end
            default: begin
                if(ALUop[1] == 1 && Funct_Field[3:0] == 4'b0000) //checks for 2'b1x and 6'bxx0000 
                    ALUcontrol_output = 4'b0010;
                else if(ALUop[1] == 1 && Funct_Field[3:0] == 4'b0010) //checks for 2'b1x and 6'bxx0010 
                    ALUcontrol_output = 4'b0110;
                else if(ALUop[0] == 1)
                    ALUcontrol_output = 4'b0010;
                else
                    ALUcontrol_output = 4'b1111; //Defaults to 0000 if none of the cases or above if/else works.
            end
        endcase
    end
endmodule