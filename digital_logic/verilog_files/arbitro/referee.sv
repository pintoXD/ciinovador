module arbitro(
    req, grant, available, grant_num
);

input logic [3:0] req;
output logic [3:0] grant;
output logic [1:0] grant_num;
output logic available;


always_comb begin 

    case (req)
        4'b0000: begin
            assign grant = 4'b0000;
        end


    endcase


 end





endmodule