
//input ports
add mapped point INPUT_CLK INPUT_CLK -type PI PI
add mapped point RST RST -type PI PI

//output ports
add mapped point OUTPUT_CLK OUTPUT_CLK -type PO PO

//inout ports




//Sequential Pins
add mapped point clk_cycle_counting[6]/q clk_cycle_counting_reg[6]/Q  -type DFF DFF
add mapped point clk_cycle_counting[5]/q clk_cycle_counting_reg[5]/Q  -type DFF DFF
add mapped point OUTPUT_CLK/q OUTPUT_CLK_reg/Q  -type DFF DFF
add mapped point clk_cycle_counting[4]/q clk_cycle_counting_reg[4]/Q  -type DFF DFF
add mapped point clk_cycle_counting[3]/q clk_cycle_counting_reg[3]/Q  -type DFF DFF
add mapped point clk_cycle_counting[0]/q clk_cycle_counting_reg[0]/Q  -type DFF DFF
add mapped point clk_cycle_counting[2]/q clk_cycle_counting_reg[2]/Q  -type DFF DFF
add mapped point clk_cycle_counting[1]/q clk_cycle_counting_reg[1]/Q  -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
