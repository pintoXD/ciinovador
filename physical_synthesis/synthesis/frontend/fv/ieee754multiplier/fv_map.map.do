
//input ports
add mapped point clk clk -type PI PI
add mapped point reset reset -type PI PI
add mapped point input_a[31] input_a[31] -type PI PI
add mapped point input_a[30] input_a[30] -type PI PI
add mapped point input_a[29] input_a[29] -type PI PI
add mapped point input_a[28] input_a[28] -type PI PI
add mapped point input_a[27] input_a[27] -type PI PI
add mapped point input_a[26] input_a[26] -type PI PI
add mapped point input_a[25] input_a[25] -type PI PI
add mapped point input_a[24] input_a[24] -type PI PI
add mapped point input_a[23] input_a[23] -type PI PI
add mapped point input_a[22] input_a[22] -type PI PI
add mapped point input_a[21] input_a[21] -type PI PI
add mapped point input_a[20] input_a[20] -type PI PI
add mapped point input_a[19] input_a[19] -type PI PI
add mapped point input_a[18] input_a[18] -type PI PI
add mapped point input_a[17] input_a[17] -type PI PI
add mapped point input_a[16] input_a[16] -type PI PI
add mapped point input_a[15] input_a[15] -type PI PI
add mapped point input_a[14] input_a[14] -type PI PI
add mapped point input_a[13] input_a[13] -type PI PI
add mapped point input_a[12] input_a[12] -type PI PI
add mapped point input_a[11] input_a[11] -type PI PI
add mapped point input_a[10] input_a[10] -type PI PI
add mapped point input_a[9] input_a[9] -type PI PI
add mapped point input_a[8] input_a[8] -type PI PI
add mapped point input_a[7] input_a[7] -type PI PI
add mapped point input_a[6] input_a[6] -type PI PI
add mapped point input_a[5] input_a[5] -type PI PI
add mapped point input_a[4] input_a[4] -type PI PI
add mapped point input_a[3] input_a[3] -type PI PI
add mapped point input_a[2] input_a[2] -type PI PI
add mapped point input_a[1] input_a[1] -type PI PI
add mapped point input_a[0] input_a[0] -type PI PI
add mapped point input_b[31] input_b[31] -type PI PI
add mapped point input_b[30] input_b[30] -type PI PI
add mapped point input_b[29] input_b[29] -type PI PI
add mapped point input_b[28] input_b[28] -type PI PI
add mapped point input_b[27] input_b[27] -type PI PI
add mapped point input_b[26] input_b[26] -type PI PI
add mapped point input_b[25] input_b[25] -type PI PI
add mapped point input_b[24] input_b[24] -type PI PI
add mapped point input_b[23] input_b[23] -type PI PI
add mapped point input_b[22] input_b[22] -type PI PI
add mapped point input_b[21] input_b[21] -type PI PI
add mapped point input_b[20] input_b[20] -type PI PI
add mapped point input_b[19] input_b[19] -type PI PI
add mapped point input_b[18] input_b[18] -type PI PI
add mapped point input_b[17] input_b[17] -type PI PI
add mapped point input_b[16] input_b[16] -type PI PI
add mapped point input_b[15] input_b[15] -type PI PI
add mapped point input_b[14] input_b[14] -type PI PI
add mapped point input_b[13] input_b[13] -type PI PI
add mapped point input_b[12] input_b[12] -type PI PI
add mapped point input_b[11] input_b[11] -type PI PI
add mapped point input_b[10] input_b[10] -type PI PI
add mapped point input_b[9] input_b[9] -type PI PI
add mapped point input_b[8] input_b[8] -type PI PI
add mapped point input_b[7] input_b[7] -type PI PI
add mapped point input_b[6] input_b[6] -type PI PI
add mapped point input_b[5] input_b[5] -type PI PI
add mapped point input_b[4] input_b[4] -type PI PI
add mapped point input_b[3] input_b[3] -type PI PI
add mapped point input_b[2] input_b[2] -type PI PI
add mapped point input_b[1] input_b[1] -type PI PI
add mapped point input_b[0] input_b[0] -type PI PI

//output ports
add mapped point result[31] result[31] -type PO PO
add mapped point result[30] result[30] -type PO PO
add mapped point result[29] result[29] -type PO PO
add mapped point result[28] result[28] -type PO PO
add mapped point result[27] result[27] -type PO PO
add mapped point result[26] result[26] -type PO PO
add mapped point result[25] result[25] -type PO PO
add mapped point result[24] result[24] -type PO PO
add mapped point result[23] result[23] -type PO PO
add mapped point result[22] result[22] -type PO PO
add mapped point result[21] result[21] -type PO PO
add mapped point result[20] result[20] -type PO PO
add mapped point result[19] result[19] -type PO PO
add mapped point result[18] result[18] -type PO PO
add mapped point result[17] result[17] -type PO PO
add mapped point result[16] result[16] -type PO PO
add mapped point result[15] result[15] -type PO PO
add mapped point result[14] result[14] -type PO PO
add mapped point result[13] result[13] -type PO PO
add mapped point result[12] result[12] -type PO PO
add mapped point result[11] result[11] -type PO PO
add mapped point result[10] result[10] -type PO PO
add mapped point result[9] result[9] -type PO PO
add mapped point result[8] result[8] -type PO PO
add mapped point result[7] result[7] -type PO PO
add mapped point result[6] result[6] -type PO PO
add mapped point result[5] result[5] -type PO PO
add mapped point result[4] result[4] -type PO PO
add mapped point result[3] result[3] -type PO PO
add mapped point result[2] result[2] -type PO PO
add mapped point result[1] result[1] -type PO PO
add mapped point result[0] result[0] -type PO PO

//inout ports




//Sequential Pins
add mapped point result[0]/q result_reg[0]/Q  -type DFF DFF
add mapped point result[1]/q result_reg[1]/Q  -type DFF DFF
add mapped point result[2]/q result_reg[2]/Q  -type DFF DFF
add mapped point result[3]/q result_reg[3]/Q  -type DFF DFF
add mapped point result[4]/q result_reg[4]/Q  -type DFF DFF
add mapped point result[5]/q result_reg[5]/Q  -type DFF DFF
add mapped point result[6]/q result_reg[6]/Q  -type DFF DFF
add mapped point result[7]/q result_reg[7]/Q  -type DFF DFF
add mapped point result[8]/q result_reg[8]/Q  -type DFF DFF
add mapped point result[9]/q result_reg[9]/Q  -type DFF DFF
add mapped point result[10]/q result_reg[10]/Q  -type DFF DFF
add mapped point result[11]/q result_reg[11]/Q  -type DFF DFF
add mapped point result[12]/q result_reg[12]/Q  -type DFF DFF
add mapped point result[13]/q result_reg[13]/Q  -type DFF DFF
add mapped point result[14]/q result_reg[14]/Q  -type DFF DFF
add mapped point result[15]/q result_reg[15]/Q  -type DFF DFF
add mapped point result[16]/q result_reg[16]/Q  -type DFF DFF
add mapped point result[17]/q result_reg[17]/Q  -type DFF DFF
add mapped point result[18]/q result_reg[18]/Q  -type DFF DFF
add mapped point result[19]/q result_reg[19]/Q  -type DFF DFF
add mapped point result[20]/q result_reg[20]/Q  -type DFF DFF
add mapped point result[21]/q result_reg[21]/Q  -type DFF DFF
add mapped point result[22]/q result_reg[22]/Q  -type DFF DFF
add mapped point result[23]/q result_reg[23]/Q  -type DFF DFF
add mapped point result[24]/q result_reg[24]/Q  -type DFF DFF
add mapped point result[25]/q result_reg[25]/Q  -type DFF DFF
add mapped point result[26]/q result_reg[26]/Q  -type DFF DFF
add mapped point result[27]/q result_reg[27]/Q  -type DFF DFF
add mapped point result[28]/q result_reg[28]/Q  -type DFF DFF
add mapped point result[29]/q result_reg[29]/Q  -type DFF DFF
add mapped point result[30]/q result_reg[30]/Q  -type DFF DFF
add mapped point result[31]/q result_reg[31]/Q  -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
