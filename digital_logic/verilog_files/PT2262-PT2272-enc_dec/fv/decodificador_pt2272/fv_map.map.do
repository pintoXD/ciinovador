
//input ports
add mapped point clk clk -type PI PI
add mapped point reset reset -type PI PI
add mapped point A[7] A[7] -type PI PI
add mapped point A[6] A[6] -type PI PI
add mapped point A[5] A[5] -type PI PI
add mapped point A[4] A[4] -type PI PI
add mapped point A[3] A[3] -type PI PI
add mapped point A[2] A[2] -type PI PI
add mapped point A[1] A[1] -type PI PI
add mapped point A[0] A[0] -type PI PI
add mapped point cod_i cod_i -type PI PI

//output ports
add mapped point D[3] D[3] -type PO PO
add mapped point D[2] D[2] -type PO PO
add mapped point D[1] D[1] -type PO PO
add mapped point D[0] D[0] -type PO PO
add mapped point dv dv -type PO PO

//inout ports




//Sequential Pins
add mapped point BIDIR_SHIFTREG_OP_MODE[1]/q BIDIR_SHIFTREG_OP_MODE_reg[1]/Q  -type DFF DFF
add mapped point BIDIR_SHIFTREG_OP_MODE[2]/q BIDIR_SHIFTREG_OP_MODE_reg[2]/Q  -type DFF DFF
add mapped point BIDIR_SHIFTREG_PT2272_BIT_IN[0]/q BIDIR_SHIFTREG_PT2272_BIT_IN_reg[0]/Q  -type DFF DFF
add mapped point BIDIR_SHIFTREG_PT2272_BIT_IN[1]/q BIDIR_SHIFTREG_PT2272_BIT_IN_reg[1]/Q  -type DFF DFF
add mapped point D[0]/q D_reg[0]/Q  -type DFF DFF
add mapped point D[1]/q D_reg[1]/Q  -type DFF DFF
add mapped point D[2]/q D_reg[2]/Q  -type DFF DFF
add mapped point D[3]/q D_reg[3]/Q  -type DFF DFF
add mapped point HIGH_PULSE_COUNTING[0]/q HIGH_PULSE_COUNTING_reg[0]/Q  -type DFF DFF
add mapped point HIGH_PULSE_COUNTING[1]/q HIGH_PULSE_COUNTING_reg[1]/Q  -type DFF DFF
add mapped point LOW_PULSE_COUNTING[1]/q LOW_PULSE_COUNTING_reg[1]/Q  -type DFF DFF
add mapped point LOW_PULSE_COUNTING[6]/q LOW_PULSE_COUNTING_reg[6]/Q  -type DFF DFF
add mapped point LOW_PULSE_COUNTING[7]/q LOW_PULSE_COUNTING_reg[7]/Q  -type DFF DFF
add mapped point PREVIOUS_cod_i/q PREVIOUS_cod_i_reg/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[0]/q RCVD_DATA_SHIFTREG_q_reg[0]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[1]/q RCVD_DATA_SHIFTREG_q_reg[1]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[2]/q RCVD_DATA_SHIFTREG_q_reg[2]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[3]/q RCVD_DATA_SHIFTREG_q_reg[3]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[4]/q RCVD_DATA_SHIFTREG_q_reg[4]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[5]/q RCVD_DATA_SHIFTREG_q_reg[5]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[6]/q RCVD_DATA_SHIFTREG_q_reg[6]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[7]/q RCVD_DATA_SHIFTREG_q_reg[7]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[8]/q RCVD_DATA_SHIFTREG_q_reg[8]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[9]/q RCVD_DATA_SHIFTREG_q_reg[9]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[10]/q RCVD_DATA_SHIFTREG_q_reg[10]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[11]/q RCVD_DATA_SHIFTREG_q_reg[11]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[12]/q RCVD_DATA_SHIFTREG_q_reg[12]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[13]/q RCVD_DATA_SHIFTREG_q_reg[13]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[14]/q RCVD_DATA_SHIFTREG_q_reg[14]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[15]/q RCVD_DATA_SHIFTREG_q_reg[15]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[16]/q RCVD_DATA_SHIFTREG_q_reg[16]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[17]/q RCVD_DATA_SHIFTREG_q_reg[17]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[18]/q RCVD_DATA_SHIFTREG_q_reg[18]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[19]/q RCVD_DATA_SHIFTREG_q_reg[19]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[20]/q RCVD_DATA_SHIFTREG_q_reg[20]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[21]/q RCVD_DATA_SHIFTREG_q_reg[21]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[22]/q RCVD_DATA_SHIFTREG_q_reg[22]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[23]/q RCVD_DATA_SHIFTREG_q_reg[23]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[24]/q RCVD_DATA_SHIFTREG_q_reg[24]/Q  -type DFF DFF
add mapped point RCVD_DATA_SHIFTREG/q[25]/q RCVD_DATA_SHIFTREG_q_reg[25]/Q  -type DFF DFF
add mapped point current_state[1]/q current_state_reg[1]/Q  -type DFF DFF
add mapped point dv/q dv_reg/Q  -type DFF DFF
add mapped point internal_f_bit_locator[1]/q internal_f_bit_locator_reg[1]/Q  -type DFF DFF
add mapped point internal_f_bit_locator[2]/q internal_f_bit_locator_reg[2]/Q  -type DFF DFF
add mapped point internal_f_bit_locator[3]/q internal_f_bit_locator_reg[3]/Q  -type DFF DFF
add mapped point internal_f_bit_locator[4]/q internal_f_bit_locator_reg[4]/Q  -type DFF DFF
add mapped point internal_f_bit_locator[5]/q internal_f_bit_locator_reg[5]/Q  -type DFF DFF
add mapped point internal_f_bit_locator[6]/q internal_f_bit_locator_reg[6]/Q  -type DFF DFF
add mapped point internal_f_bit_locator[7]/q internal_f_bit_locator_reg[7]/Q  -type DFF DFF
add mapped point internal_interpreted_addr[0]/q internal_interpreted_addr_reg[0]/Q  -type DFF DFF
add mapped point internal_interpreted_addr[3]/q internal_interpreted_addr_reg[3]/Q  -type DFF DFF
add mapped point internal_interpreted_addr[4]/q internal_interpreted_addr_reg[4]/Q  -type DFF DFF
add mapped point internal_interpreted_addr[5]/q internal_interpreted_addr_reg[5]/Q  -type DFF DFF
add mapped point internal_interpreted_addr[6]/q internal_interpreted_addr_reg[6]/Q  -type DFF DFF
add mapped point internal_oscillator/OUTPUT_CLK/q internal_oscillator_OUTPUT_CLK_reg/Q  -type DFF DFF
add mapped point internal_oscillator/clk_cycle_counting[0]/q internal_oscillator_clk_cycle_counting_reg[0]/Q  -type DFF DFF
add mapped point internal_oscillator/clk_cycle_counting[1]/q internal_oscillator_clk_cycle_counting_reg[1]/Q  -type DFF DFF
add mapped point internal_oscillator/clk_cycle_counting[3]/q internal_oscillator_clk_cycle_counting_reg[3]/Q  -type DFF DFF
add mapped point internal_oscillator/clk_cycle_counting[5]/q internal_oscillator_clk_cycle_counting_reg[5]/Q  -type DFF DFF
add mapped point internal_oscillator/clk_cycle_counting[6]/q internal_oscillator_clk_cycle_counting_reg[6]/Q  -type DFF DFF
add mapped point BIDIR_SHIFTREG_ENABLER/q BIDIR_SHIFTREG_ENABLER_reg/Q  -type DFF DFF
add mapped point BIDIR_SHIFTREG_ENABLER/q BIDIR_SHIFTREG_ENABLER_reg/QN  -type DFF DFF
add mapped point HIGH_PULSE_COUNTING[2]/q HIGH_PULSE_COUNTING_reg[2]/Q  -type DFF DFF
add mapped point HIGH_PULSE_COUNTING[2]/q HIGH_PULSE_COUNTING_reg[2]/QN  -type DFF DFF
add mapped point HIGH_PULSE_COUNTING[3]/q HIGH_PULSE_COUNTING_reg[3]/Q  -type DFF DFF
add mapped point HIGH_PULSE_COUNTING[3]/q HIGH_PULSE_COUNTING_reg[3]/QN  -type DFF DFF
add mapped point HIGH_PULSE_COUNTING[4]/q HIGH_PULSE_COUNTING_reg[4]/Q  -type DFF DFF
add mapped point HIGH_PULSE_COUNTING[4]/q HIGH_PULSE_COUNTING_reg[4]/QN  -type DFF DFF
add mapped point LOW_PULSE_COUNTING[0]/q LOW_PULSE_COUNTING_reg[0]/Q  -type DFF DFF
add mapped point LOW_PULSE_COUNTING[0]/q LOW_PULSE_COUNTING_reg[0]/QN  -type DFF DFF
add mapped point LOW_PULSE_COUNTING[2]/q LOW_PULSE_COUNTING_reg[2]/Q  -type DFF DFF
add mapped point LOW_PULSE_COUNTING[2]/q LOW_PULSE_COUNTING_reg[2]/QN  -type DFF DFF
add mapped point LOW_PULSE_COUNTING[3]/q LOW_PULSE_COUNTING_reg[3]/Q  -type DFF DFF
add mapped point LOW_PULSE_COUNTING[3]/q LOW_PULSE_COUNTING_reg[3]/QN  -type DFF DFF
add mapped point LOW_PULSE_COUNTING[4]/q LOW_PULSE_COUNTING_reg[4]/Q  -type DFF DFF
add mapped point LOW_PULSE_COUNTING[4]/q LOW_PULSE_COUNTING_reg[4]/QN  -type DFF DFF
add mapped point LOW_PULSE_COUNTING[5]/q LOW_PULSE_COUNTING_reg[5]/Q  -type DFF DFF
add mapped point LOW_PULSE_COUNTING[5]/q LOW_PULSE_COUNTING_reg[5]/QN  -type DFF DFF
add mapped point current_state[0]/q current_state_reg[0]/Q  -type DFF DFF
add mapped point current_state[0]/q current_state_reg[0]/QN  -type DFF DFF
add mapped point current_state[2]/q current_state_reg[2]/Q  -type DFF DFF
add mapped point current_state[2]/q current_state_reg[2]/QN  -type DFF DFF
add mapped point internal_interpreted_addr[1]/q internal_interpreted_addr_reg[1]/Q  -type DFF DFF
add mapped point internal_interpreted_addr[1]/q internal_interpreted_addr_reg[1]/QN  -type DFF DFF
add mapped point internal_interpreted_addr[2]/q internal_interpreted_addr_reg[2]/Q  -type DFF DFF
add mapped point internal_interpreted_addr[2]/q internal_interpreted_addr_reg[2]/QN  -type DFF DFF
add mapped point internal_interpreted_addr[7]/q internal_interpreted_addr_reg[7]/Q  -type DFF DFF
add mapped point internal_interpreted_addr[7]/q internal_interpreted_addr_reg[7]/QN  -type DFF DFF
add mapped point internal_oscillator/clk_cycle_counting[2]/q internal_oscillator_clk_cycle_counting_reg[2]/Q  -type DFF DFF
add mapped point internal_oscillator/clk_cycle_counting[2]/q internal_oscillator_clk_cycle_counting_reg[2]/QN  -type DFF DFF
add mapped point internal_oscillator/clk_cycle_counting[4]/q internal_oscillator_clk_cycle_counting_reg[4]/Q  -type DFF DFF
add mapped point internal_oscillator/clk_cycle_counting[4]/q internal_oscillator_clk_cycle_counting_reg[4]/QN  -type DFF DFF
add mapped point reset_counters/q reset_counters_reg/Q  -type DFF DFF
add mapped point reset_counters/q reset_counters_reg/QN  -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
add mapped point addr_translator/comp_endereco addr_translator/comp_endereco -type BBOX BBOX
