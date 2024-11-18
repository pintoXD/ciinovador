`timescale 1ns/1ns
module arbitro(
    req, grant, available, grant_num
);

input logic [3:0] req;
output logic [3:0] grant;
output logic [1:0] grant_num;
output logic available;


always_latch begin 
    case (req)
        4'b0000: begin
            //
            assign grant = 4'b0000;
            assign available = 1'b1;
            assign grant_num = 2'b00;
        end
        4'b0001: begin
            //Highest priority of all inputs.            
            assign grant = 4'b0001;
            assign available = 1'b0;
            assign grant_num = 2'b00;
        end
        4'b0010: begin
            if (grant != 4'b0001) begin
                assign grant = 4'b0010;
                assign available = 1'b0;
                assign grant_num = 2'b01;
            end
        end
        4'b0100: begin
            if (grant != 4'b0001 && grant != 4'b0010) begin
                assign grant = 4'b0100;
                assign available = 1'b0;
                assign grant_num = 2'b10;
            end
        end
        4'b1000: begin
            if (grant != 4'b0001 && grant != 4'b0010 && grant != 4'b0100) begin
                assign grant = 4'b1000;
                assign available = 1'b0;
                assign grant_num = 2'b11;
            end
        end
        default: begin
            assign grant = 4'b0000;
            assign available = 1'b1;
            assign grant_num = 2'b00;
        end
    endcase
 end
endmodule
