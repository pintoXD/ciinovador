
//input ports
add mapped point clk clk -type PI PI
add mapped point reset reset -type PI PI
add mapped point w_a w_a -type PI PI
add mapped point r_a r_a -type PI PI
add mapped point d_a[7] d_a[7] -type PI PI
add mapped point d_a[6] d_a[6] -type PI PI
add mapped point d_a[5] d_a[5] -type PI PI
add mapped point d_a[4] d_a[4] -type PI PI
add mapped point d_a[3] d_a[3] -type PI PI
add mapped point d_a[2] d_a[2] -type PI PI
add mapped point d_a[1] d_a[1] -type PI PI
add mapped point d_a[0] d_a[0] -type PI PI
add mapped point a_a[7] a_a[7] -type PI PI
add mapped point a_a[6] a_a[6] -type PI PI
add mapped point a_a[5] a_a[5] -type PI PI
add mapped point a_a[4] a_a[4] -type PI PI
add mapped point a_a[3] a_a[3] -type PI PI
add mapped point a_a[2] a_a[2] -type PI PI
add mapped point a_a[1] a_a[1] -type PI PI
add mapped point a_a[0] a_a[0] -type PI PI
add mapped point w_b w_b -type PI PI
add mapped point r_b r_b -type PI PI
add mapped point d_b[7] d_b[7] -type PI PI
add mapped point d_b[6] d_b[6] -type PI PI
add mapped point d_b[5] d_b[5] -type PI PI
add mapped point d_b[4] d_b[4] -type PI PI
add mapped point d_b[3] d_b[3] -type PI PI
add mapped point d_b[2] d_b[2] -type PI PI
add mapped point d_b[1] d_b[1] -type PI PI
add mapped point d_b[0] d_b[0] -type PI PI
add mapped point a_b[7] a_b[7] -type PI PI
add mapped point a_b[6] a_b[6] -type PI PI
add mapped point a_b[5] a_b[5] -type PI PI
add mapped point a_b[4] a_b[4] -type PI PI
add mapped point a_b[3] a_b[3] -type PI PI
add mapped point a_b[2] a_b[2] -type PI PI
add mapped point a_b[1] a_b[1] -type PI PI
add mapped point a_b[0] a_b[0] -type PI PI

//output ports
add mapped point q_a[7] q_a[7] -type PO PO
add mapped point q_a[6] q_a[6] -type PO PO
add mapped point q_a[5] q_a[5] -type PO PO
add mapped point q_a[4] q_a[4] -type PO PO
add mapped point q_a[3] q_a[3] -type PO PO
add mapped point q_a[2] q_a[2] -type PO PO
add mapped point q_a[1] q_a[1] -type PO PO
add mapped point q_a[0] q_a[0] -type PO PO
add mapped point pronto_a pronto_a -type PO PO
add mapped point q_b[7] q_b[7] -type PO PO
add mapped point q_b[6] q_b[6] -type PO PO
add mapped point q_b[5] q_b[5] -type PO PO
add mapped point q_b[4] q_b[4] -type PO PO
add mapped point q_b[3] q_b[3] -type PO PO
add mapped point q_b[2] q_b[2] -type PO PO
add mapped point q_b[1] q_b[1] -type PO PO
add mapped point q_b[0] q_b[0] -type PO PO
add mapped point pronto_b pronto_b -type PO PO

//inout ports




//Sequential Pins
add mapped point q_b[0]/q q_b_reg[0]/Q  -type DFF DFF
add mapped point q_a[6]/q q_a_reg[6]/Q  -type DFF DFF
add mapped point q_a[4]/q q_a_reg[4]/Q  -type DFF DFF
add mapped point q_a[0]/q q_a_reg[0]/Q  -type DFF DFF
add mapped point q_a[3]/q q_a_reg[3]/Q  -type DFF DFF
add mapped point q_a[5]/q q_a_reg[5]/Q  -type DFF DFF
add mapped point q_a[2]/q q_a_reg[2]/Q  -type DFF DFF
add mapped point q_a[1]/q q_a_reg[1]/Q  -type DFF DFF
add mapped point q_b[7]/q q_b_reg[7]/Q  -type DFF DFF
add mapped point q_b[6]/q q_b_reg[6]/Q  -type DFF DFF
add mapped point q_b[5]/q q_b_reg[5]/Q  -type DFF DFF
add mapped point q_b[4]/q q_b_reg[4]/Q  -type DFF DFF
add mapped point q_b[3]/q q_b_reg[3]/Q  -type DFF DFF
add mapped point q_b[2]/q q_b_reg[2]/Q  -type DFF DFF
add mapped point q_b[1]/q q_b_reg[1]/Q  -type DFF DFF
add mapped point q_a[7]/q q_a_reg[7]/Q  -type DFF DFF
add mapped point estado_atual[0]/q estado_atual_reg[0]/Q  -type DFF DFF
add mapped point estado_atual[1]/q estado_atual_reg[1]/Q  -type DFF DFF
add mapped point estado_atual[2]/q estado_atual_reg[2]/Q  -type DFF DFF



//Black Boxes
add mapped point U1 U1 -type BBOX BBOX



//Empty Modules as Blackboxes
