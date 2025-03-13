
//input ports
add mapped point A A -type PI PI
add mapped point B B -type PI PI
add mapped point C C -type PI PI
add mapped point rst rst -type PI PI
add mapped point clk clk -type PI PI

//output ports
add mapped point Q[1] Q[1] -type PO PO
add mapped point Q[0] Q[0] -type PO PO

//inout ports




//Sequential Pins
add mapped point State_r[1]/q State_r_reg[1]/Q  -type DFF DFF
add mapped point State_r[0]/q State_r_reg[0]/Q  -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
