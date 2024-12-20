
//input ports
add mapped point INPUT_CLK INPUT_CLK -type PI PI
add mapped point RST RST -type PI PI

//output ports
add mapped point OUTPUT_CLK OUTPUT_CLK -type PO PO

//inout ports




//Sequential Pins
add mapped point OUTPUT_CLK/q OUTPUT_CLK_reg/Q  -type DFF DFF
add mapped point clk_cycle_counting[6]/q clk_cycle_counting_reg[6]/Q  -type DFF DFF
add mapped point clk_cycle_counting[2]/q clk_cycle_counting_reg[2]/Q  -type DFF DFF
add mapped point clk_cycle_counting[5]/q clk_cycle_counting_reg[5]/Q  -type DFF DFF
add mapped point clk_cycle_counting[4]/q clk_cycle_counting_reg[4]/Q  -type DFF DFF
add mapped point clk_cycle_counting[3]/q clk_cycle_counting_reg[3]/Q  -type DFF DFF
add mapped point clk_cycle_counting[1]/q clk_cycle_counting_reg[1]/Q  -type DFF DFF
add mapped point clk_cycle_counting[0]/q clk_cycle_counting_reg[0]/Q  -type DFF DFF
add mapped point clk_cycle_counting[8]/q clk_cycle_counting_reg[8]/Q  -type DFF DFF
add mapped point clk_cycle_counting[15]/q clk_cycle_counting_reg[15]/Q  -type DFF DFF
add mapped point clk_cycle_counting[10]/q clk_cycle_counting_reg[10]/Q  -type DFF DFF
add mapped point clk_cycle_counting[14]/q clk_cycle_counting_reg[14]/Q  -type DFF DFF
add mapped point clk_cycle_counting[12]/q clk_cycle_counting_reg[12]/Q  -type DFF DFF
add mapped point clk_cycle_counting[9]/q clk_cycle_counting_reg[9]/Q  -type DFF DFF
add mapped point clk_cycle_counting[13]/q clk_cycle_counting_reg[13]/Q  -type DFF DFF
add mapped point clk_cycle_counting[7]/q clk_cycle_counting_reg[7]/Q  -type DFF DFF
add mapped point clk_cycle_counting[11]/q clk_cycle_counting_reg[11]/Q  -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
