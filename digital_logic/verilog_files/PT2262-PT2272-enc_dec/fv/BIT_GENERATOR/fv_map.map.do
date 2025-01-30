
//input ports
add mapped point osc_clk osc_clk -type PI PI
add mapped point rst rst -type PI PI
add mapped point enable_generation enable_generation -type PI PI
add mapped point input_bit[1] input_bit[1] -type PI PI
add mapped point input_bit[0] input_bit[0] -type PI PI

//output ports
add mapped point bit_sent bit_sent -type PO PO
add mapped point output_signal output_signal -type PO PO

//inout ports




//Sequential Pins
add mapped point current_state[0]/q current_state_reg[0]/Q  -type DFF DFF
add mapped point current_state[4]/q current_state_reg[4]/Q  -type DFF DFF
add mapped point current_state[2]/q current_state_reg[2]/Q  -type DFF DFF
add mapped point current_state[1]/q current_state_reg[1]/Q  -type DFF DFF
add mapped point current_state[3]/q current_state_reg[3]/Q  -type DFF DFF
add mapped point bit_sent/q bit_sent_reg/Q  -type DLAT DLAT
add mapped point bit_sent/q bit_sent_reg/QN  -type DLAT DLAT
add mapped point output_signal/q output_signal_reg/Q  -type DFF DFF
add mapped point pulse_counter_sync[6]/q pulse_counter_sync_reg[6]/Q  -type DFF DFF
add mapped point pulse_counter_sync[5]/q pulse_counter_sync_reg[5]/Q  -type DFF DFF
add mapped point is_first_run/q is_first_run_reg/Q  -type DFF DFF
add mapped point pulse_counter[4]/q pulse_counter_reg[4]/Q  -type DFF DFF
add mapped point enable_pulse_counting/q enable_pulse_counting_reg/Q  -type DFF DFF
add mapped point enable_pulse_counting_sync/q enable_pulse_counting_sync_reg/Q  -type DFF DFF
add mapped point pulse_counter_sync[4]/q pulse_counter_sync_reg[4]/Q  -type DFF DFF
add mapped point pulse_counter[3]/q pulse_counter_reg[3]/Q  -type DFF DFF
add mapped point pulse_counter_sync[3]/q pulse_counter_sync_reg[3]/Q  -type DFF DFF
add mapped point pulse_counter_sync[2]/q pulse_counter_sync_reg[2]/Q  -type DFF DFF
add mapped point pulse_counter[2]/q pulse_counter_reg[2]/Q  -type DFF DFF
add mapped point pulse_counter[1]/q pulse_counter_reg[1]/Q  -type DFF DFF
add mapped point pulse_counter_sync[1]/q pulse_counter_sync_reg[1]/Q  -type DFF DFF
add mapped point pulse_counter_sync[0]/q pulse_counter_sync_reg[0]/Q  -type DFF DFF
add mapped point pulse_counter[0]/q pulse_counter_reg[0]/Q  -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
