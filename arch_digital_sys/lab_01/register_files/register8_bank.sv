`timescale 1ns/1ps
module register8_bank(
    input logic clk, rst, we5,
    input logic [2:0]wa5,
    input logic [2:0]ra1, ra2,
    input logic [7:0]wd32,
    output logic [7:0] rd1, rd2

);

logic [7:0] X1_in_word, X2_in_word, X3_in_word, X4_in_word, X5_in_word, X6_in_word, X7_in_word;
logic [7:0] X0_out_word, X1_out_word, X2_out_word, X3_out_word, X4_out_word, X5_out_word, X6_out_word, X7_out_word;

register8 X0(.clk(clk), .reset(rst), .in_word(8'b0), .out_word(X0_out_word));
register8 X1(.clk(clk), .reset(rst), .in_word(X1_in_word), .out_word(X1_out_word));
register8 X2(.clk(clk), .reset(rst), .in_word(X2_in_word), .out_word(X2_out_word));
register8 X3(.clk(clk), .reset(rst), .in_word(X3_in_word), .out_word(X3_out_word));
register8 X4(.clk(clk), .reset(rst), .in_word(X4_in_word), .out_word(X4_out_word));
register8 X5(.clk(clk), .reset(rst), .in_word(X5_in_word), .out_word(X5_out_word));
register8 X6(.clk(clk), .reset(rst), .in_word(X6_in_word), .out_word(X6_out_word));
register8 X7(.clk(clk), .reset(rst), .in_word(X7_in_word), .out_word(X7_out_word));


always_ff @(posedge clk) begin
    if(rst) 
        begin
            X1_in_word <= 8'b0;
            X2_in_word <= 8'b0;
            X3_in_word <= 8'b0;
            X4_in_word <= 8'b0;
            X5_in_word <= 8'b0;
            X6_in_word <= 8'b0;
            X7_in_word <= 8'b0;
        end
    else if(we5)
        begin
            case(wa5)
                3'b001:
                    X1_in_word <= wd32;
                3'b010:
                    X2_in_word <= wd32;
                3'b011:
                    X3_in_word <= wd32;
                3'b100:
                    X4_in_word <= wd32;
                3'b101:
                    X5_in_word <= wd32;
                3'b110:
                    X6_in_word <= wd32;
                3'b111:
                    X7_in_word <= wd32;
                default:
                    X1_in_word <= wd32;
            endcase
        end
end


always_comb 
begin
    case(ra1)
        3'b000:
            rd1 = X0_out_word;
        3'b001:
            rd1 = X1_out_word;
        3'b010:
            rd1 = X2_out_word;
        3'b011:
            rd1 = X3_out_word;
        3'b100:
            rd1 = X4_out_word;
        3'b101:
            rd1 = X5_out_word;
        3'b110:
            rd1 = X6_out_word;
        3'b111:
            rd1 = X7_out_word;
        default:
            rd1 = X0_out_word;
    endcase

    case(ra2)
        3'b000:
            rd2 = X0_out_word;
        3'b001:
            rd2 = X1_out_word;
        3'b010:
            rd2 = X2_out_word;
        3'b011:
            rd2 = X3_out_word;
        3'b100:
            rd2 = X4_out_word;
        3'b101:
            rd2 = X5_out_word;
        3'b110:
            rd2 = X6_out_word;
        3'b111:
            rd2 = X7_out_word;
        default:
            rd2 = X0_out_word;
    endcase 

end



endmodule
