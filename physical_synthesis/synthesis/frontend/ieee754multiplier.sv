module ieee754multiplier (
    input logic clk, rst_n,
    input logic [31:0] a_i,
    input logic [31:0] b_i,
    input logic start_i,
    output logic done_o,
    output logic nan_o,
    output logic inifinit_o,
    output logic overflow_o,
    output logic underflow_o,
    output logic [31:0] product_o
);
    

typedef enum logic[2:0] {  
    INITIAL_STATE = 3'b000,
    MULTIPLY_STEP = 3'b001,
    RESULT_VERIFICATION_STEP = 3'b010,
    NAN_O_DETECTED = 3'b011,
    INIFINIT_O_DETECTED = 3'b100,
    OVERFLOW_O_DETECTED = 3'b101,
    UNDERFLOW_O_DETECTED = 3'b110,
    DONE = 3'b111
} MULTIPLIER_FSM_STATE;

/*****************************************
*
* control variables
*
******************************************/
MULTIPLIER_FSM_STATE current_state, next_state;


/*****************************************
*
* internal signals
*
******************************************/

logic signal_a, signal_b;
logic is_multiplication_done;
logic [7:0] exponent_a, exponent_b; //The 24th bit is unused until the multiplication is computed
logic [23:0] mantissa_a, mantissa_b; //The 24th bit is unused until the multiplication is computed
logic [22:0] mantissa_product_o;
logic [47:0] mantissa_temp;
logic [9:0] exponent_temp;


always_ff @(posedge clk, negedge rst_n) begin : MULTIPLIER_STATE_CHANGER
    if(!rst_n)
        current_state <= INITIAL_STATE;
    else
        current_state <= next_state;
end


always_comb begin : MULTIPLIER_COMB_BLOCK
    next_state = current_state;

    if(!rst_n)begin
        is_multiplication_done = 0;
    end else begin 
        case (current_state)
            INITIAL_STATE:
                if (start_i) begin
                    next_state = MULTIPLY_STEP;
                end 

            MULTIPLY_STEP: begin
                    mantissa_temp = mantissa_temp; //the product_o is 0
                    exponent_temp = exponent_temp; //the exponent is 0

                    signal_a = a_i[31]; //extract the sign bit from a_i
                    signal_b = b_i[31]; //extract the sign bit from b_i

                    exponent_a = a_i[30:23]; //extract the exponent from a_i
                    exponent_b = b_i[30:23]; //extract the exponent from b_i

                    mantissa_a[23] = 1;
                    mantissa_a[22:0] = a_i[22:0];  //extract the mantissa from a_i adding the implict 1 at the beginning
                    mantissa_b[23] = 1;
                    mantissa_b[22:0] = b_i[22:0];  //extract the mantissa from b_i adding the implict 1 at the beginning

                    if (mantissa_a[22-:23] == 0 || mantissa_b[22-:23] == 0) begin //if any of the mantissas is 0
                        mantissa_temp = 0; //the product_o is 0
                        exponent_temp = 0; //the exponent is 0
                    end else begin
                        mantissa_temp = mantissa_a * mantissa_b; //multiply the mantissa
                        exponent_temp = exponent_a + exponent_b - 127; //add the exponents and subtract the bias

                        if (mantissa_temp[47] == 1) begin //if the most significant bit of the product_o is 1
                            mantissa_temp = mantissa_temp >> 1; //shift the product_o to the right
                            exponent_temp = exponent_temp + 1; //increment the exponent
                        end

                    end

                    next_state = RESULT_VERIFICATION_STEP;
            end

            RESULT_VERIFICATION_STEP: begin
                is_multiplication_done = 1;
                next_state = DONE;
            end
            DONE:
                next_state = INITIAL_STATE;

            default: 
                next_state = INITIAL_STATE;
        endcase
    end
end


always_ff @(posedge clk, negedge rst_n) begin : MULTIPLIER_FF_BLOCK
    if(!rst_n) begin
        done_o <= 1'b0;
        nan_o <= 1'b0;
        inifinit_o <= 1'b0;
        overflow_o <= 1'b0;
        underflow_o <= 1'b0;
        product_o <= 32'b0;
    end else begin
        product_o[31] <= signal_a ^ signal_b; //XOR the sign bits to get the sign of the product_o
        product_o[30:23] <=  exponent_temp[7:0]; //add the exponents and subtract the bias
        product_o[22:0] <= mantissa_temp[45:23]; //extract the 24 most significant bits of the product_o

        case (current_state)
            INITIAL_STATE: begin
                done_o <= 1'b0;
                nan_o <= 1'b0;
                inifinit_o <= 1'b0;
                overflow_o <= 1'b0;
                underflow_o <= 1'b0;
                product_o <= 32'b0;
            end
            MULTIPLY_STEP: begin
                done_o <= 1'b1;
            end

            RESULT_VERIFICATION_STEP: begin
                if (product_o[30:23] == 8'hFF && product_o[22:0] != 23'b00) begin
                    nan_o <= 1'b1;
                    product_o <= 32'b00;
                end else if (product_o[30:23] == 8'b11111111 && product_o[22:0] == 23'b0) begin
                    inifinit_o <= 1'b1;
                end else if (exponent_temp[8] == 1'b1 || exponent_temp[9] == 1'b1) begin
                    overflow_o <= 1'b1;
                    product_o <= 32'h7FFFFFFF;
                end else if (product_o[30:23] == 8'b00000000) begin
                    underflow_o <= 1'b1;
                    product_o <= 32'b00;
                end else begin
                    done_o <= 1'b1;
                end

                done_o <= 1'b0;
            end

            DONE:
                done_o <= 1'b0;
        endcase
    end
end

endmodule