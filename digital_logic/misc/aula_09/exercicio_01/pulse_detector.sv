`timescale 1ns/1ns

module pulse_detector (
    input logic clk, 
    input logic rst,
    input logic a_signal, b_signal,

    output logic seq_a, seq_b
);


typedef enum { INITIAL_STATE=0, COUNTS_A=1, COUNTS_B=2, WATCH_INPUTS=3,
               SEND_SIG_A, SEND_SIG_B} internal_states;


internal_states current_state_ff, next_state_comb;

logic [2:0] count_a, count_b;


always_ff @(posedge clk) begin
    current_state_ff <= next_state_comb;
end

always_comb begin

    next_state_comb = current_state_ff;

    seq_a = 0;
    seq_b = 0;

    if(rst) begin
        next_state_comb = INITIAL_STATE;
    end
    
    else begin
        case(current_state_ff)
            INITIAL_STATE: begin
                count_a = 0;
                count_b = 0;

                next_state_comb = WATCH_INPUTS;                
                // if(a_signal)
                //     next_state_comb = COUNTS_A;
                // else if(b_signal)
                //     next_state_comb = COUNTS_B;
            end

            WATCH_INPUTS: begin
                if(a_signal)
                    next_state_comb = COUNTS_A;
                else if(b_signal)
                    next_state_comb = COUNTS_B;
            end


            COUNTS_A: begin
               count_a = count_a + 1;
               count_b = 0;
               if (count_a == 3)
                    next_state_comb = SEND_SIG_A;
                else
                    next_state_comb = WATCH_INPUTS;
            end

            COUNTS_B: begin
               count_b = count_b + 1;
               count_a = 0;
               if (count_b == 3)
                    next_state_comb = SEND_SIG_B;
               else 
                    next_state_comb = WATCH_INPUTS;
            end

            SEND_SIG_A: begin
                seq_a = 1;
                next_state_comb = INITIAL_STATE;
            end

            SEND_SIG_B: begin
                seq_b = 1;
                next_state_comb = INITIAL_STATE;
            end

        endcase
    end
end

    
endmodule