
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
add mapped point D[3] D[3] -type PI PI
add mapped point D[2] D[2] -type PI PI
add mapped point D[1] D[1] -type PI PI
add mapped point D[0] D[0] -type PI PI

//output ports
add mapped point sync sync -type PO PO
add mapped point cod_o cod_o -type PO PO

//inout ports




//Sequential Pins
add mapped point past_osc_clk/q past_osc_clk_reg/Q  -type DFF DFF
add mapped point current_state[0]/q current_state_reg[0]/Q  -type DFF DFF
add mapped point current_state[1]/q current_state_reg[1]/Q  -type DFF DFF
add mapped point current_state[2]/q current_state_reg[2]/Q  -type DFF DFF
add mapped point current_state[3]/q current_state_reg[3]/Q  -type DFF DFF
add mapped point current_state[4]/q current_state_reg[4]/Q  -type DFF DFF
add mapped point internal_oscillator/OUTPUT_CLK/q internal_oscillator_OUTPUT_CLK_reg/Q  -type DFF DFF
add mapped point internal_oscillator/clk_cycle_counting[0]/q internal_oscillator_clk_cycle_counting_reg[0]/Q  -type DFF DFF
add mapped point internal_oscillator/clk_cycle_counting[1]/q internal_oscillator_clk_cycle_counting_reg[1]/Q  -type DFF DFF
add mapped point internal_oscillator/clk_cycle_counting[2]/q internal_oscillator_clk_cycle_counting_reg[2]/Q  -type DFF DFF
add mapped point internal_oscillator/clk_cycle_counting[3]/q internal_oscillator_clk_cycle_counting_reg[3]/Q  -type DFF DFF
add mapped point internal_oscillator/clk_cycle_counting[4]/q internal_oscillator_clk_cycle_counting_reg[4]/Q  -type DFF DFF
add mapped point internal_oscillator/clk_cycle_counting[5]/q internal_oscillator_clk_cycle_counting_reg[5]/Q  -type DFF DFF
add mapped point internal_oscillator/clk_cycle_counting[6]/q internal_oscillator_clk_cycle_counting_reg[6]/Q  -type DFF DFF
add mapped point signal_creator/current_state[0]/q signal_creator_current_state_reg[0]/Q  -type DFF DFF
add mapped point signal_creator/current_state[1]/q signal_creator_current_state_reg[1]/Q  -type DFF DFF
add mapped point signal_creator/current_state[2]/q signal_creator_current_state_reg[2]/Q  -type DFF DFF
add mapped point signal_creator/enable_pulse_counting/q signal_creator_enable_pulse_counting_reg/Q  -type DFF DFF
add mapped point signal_creator/enable_pulse_counting_sync/q signal_creator_enable_pulse_counting_sync_reg/Q  -type DFF DFF
add mapped point signal_creator/is_first_run/q signal_creator_is_first_run_reg/Q  -type DFF DFF
add mapped point signal_creator/output_signal/q signal_creator_output_signal_reg/Q  -type DFF DFF
add mapped point signal_creator/pulse_counter[0]/q signal_creator_pulse_counter_reg[0]/Q  -type DFF DFF
add mapped point signal_creator/pulse_counter[1]/q signal_creator_pulse_counter_reg[1]/Q  -type DFF DFF
add mapped point signal_creator/pulse_counter[2]/q signal_creator_pulse_counter_reg[2]/Q  -type DFF DFF
add mapped point signal_creator/pulse_counter[3]/q signal_creator_pulse_counter_reg[3]/Q  -type DFF DFF
add mapped point signal_creator/pulse_counter[4]/q signal_creator_pulse_counter_reg[4]/Q  -type DFF DFF
add mapped point signal_creator/pulse_counter_sync[0]/q signal_creator_pulse_counter_sync_reg[0]/Q  -type DFF DFF
add mapped point signal_creator/pulse_counter_sync[1]/q signal_creator_pulse_counter_sync_reg[1]/Q  -type DFF DFF
add mapped point signal_creator/pulse_counter_sync[2]/q signal_creator_pulse_counter_sync_reg[2]/Q  -type DFF DFF
add mapped point signal_creator/pulse_counter_sync[3]/q signal_creator_pulse_counter_sync_reg[3]/Q  -type DFF DFF
add mapped point signal_creator/pulse_counter_sync[4]/q signal_creator_pulse_counter_sync_reg[4]/Q  -type DFF DFF
add mapped point signal_creator/pulse_counter_sync[5]/q signal_creator_pulse_counter_sync_reg[5]/Q  -type DFF DFF
add mapped point signal_creator/pulse_counter_sync[6]/q signal_creator_pulse_counter_sync_reg[6]/Q  -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
add mapped point addr_interpreter/comp_endereco addr_interpreter/comp_endereco -type BBOX BBOX
