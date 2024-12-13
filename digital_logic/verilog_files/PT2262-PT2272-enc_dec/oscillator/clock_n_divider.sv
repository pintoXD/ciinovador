/* verilator lint_off DECLFILENAME */
`timescale 1us/1ns
module CLOCK_N_DIVIDER#(
    parameter DIVIDER = 2
)(
    input logic INPUT_CLK, RST,
    output logic OUTPUT_CLK
);


// int divider_index = int'(DIVIDER)/2;
/*
    Downclocking ratio. 
    Take a frequency division by 2 as an example. 
    The OUTPUT_CLK will be changed at every INPUT_CLK cycle. Take OUTPUT_CLK as 0 at the beginning.
    INPUTK_CLK will toggles from 1 to 0 and finishes a cyle, while OUTPUT_CLK will remain 0. At the beginning
    of the next cycle of INPUT_CLK, OUTPUT_CLK switchs to 1. The same process at every INPUT_CLK cycle.

    Our DIVIDER was initially 2. To achieve the above effect, we need to divide it by 2. 
*/
logic [15:0] divider_index_ceil = DIVIDER/2;
logic [15:0] clk_cycle_counting;

always_ff @(posedge INPUT_CLK) begin : FREQUENCY_DIVIDER
    if(~RST) begin
        clk_cycle_counting <= 0;
        OUTPUT_CLK <= 0;
    end
    else begin
            if(clk_cycle_counting < divider_index_ceil) begin
                clk_cycle_counting <= clk_cycle_counting + 1;
            end else begin
                clk_cycle_counting <= 1;
                OUTPUT_CLK <= ~OUTPUT_CLK;
            end
    end

end

    
endmodule
