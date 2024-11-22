module register8_bank(
    input logic clk, rst, write_enable,
    input logic [2:0]write_addr,
    input logic [2:0]reg_addr_1, reg_addr_2,
    input logic [7:0]write_data,
    output logic [7:0] reg_data_1, reg_data_2

);

logic [7:0] X0_in_word, X1_in_word, X2_in_word, X3_in_word, X4_in_word, X5_in_word, X6_in_word, X7_in_word;
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
    else if(write_enable)
        begin
            case(write_addr)
                3'b001:
                    X1_in_word <= write_data;
                3'b010:
                    X2_in_word <= write_data;
                3'b011:
                    X3_in_word <= write_data;
                3'b100:
                    X4_in_word <= write_data;
                3'b101:
                    X5_in_word <= write_data;
                3'b110:
                    X6_in_word <= write_data;
                3'b111:
                    X7_in_word <= write_data;
            endcase
        end
end


always_comb 
begin
    case(reg_addr_1)
        3'b000:
            reg_data_1 = X0_out_word;
        3'b001:
            reg_data_1 = X1_out_word;
        3'b010:
            reg_data_1 = X2_out_word;
        3'b011:
            reg_data_1 = X3_out_word;
        3'b100:
            reg_data_1 = X4_out_word;
        3'b101:
            reg_data_1 = X5_out_word;
        3'b110:
            reg_data_1 = X6_out_word;
        3'b111:
            reg_data_1 = X7_out_word;
        default:
            reg_data_1 = X0_out_word;
    endcase

    case(reg_addr_2)
        3'b000:
            reg_data_2 = X0_out_word;
        3'b001:
            reg_data_2 = X1_out_word;
        3'b010:
            reg_data_2 = X2_out_word;
        3'b011:
            reg_data_2 = X3_out_word;
        3'b100:
            reg_data_2 = X4_out_word;
        3'b101:
            reg_data_2 = X5_out_word;
        3'b110:
            reg_data_2 = X6_out_word;
        3'b111:
            reg_data_2 = X7_out_word;
        default:
            reg_data_2 = X0_out_word;
    endcase 

end



endmodule