# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.10-p002_1 on Thu Mar 13 18:23:55 -03 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design sequential

create_clock -name "clk" -period 100.0 -waveform {0.0 50.0} [get_ports clk]
set_load -pin_load 0.045 [get_ports {Q[1]}]
set_load -pin_load 0.045 [get_ports {Q[0]}]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports A]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports B]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports C]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports rst]
set_output_delay -clock [get_clocks clk] -add_delay 2.958 [get_ports {Q[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 2.958 [get_ports {Q[0]}]
set_input_transition -rise -min 0.146 [get_ports A]
set_input_transition -rise -max 0.264 [get_ports A]
set_input_transition -fall -min 0.164 [get_ports A]
set_input_transition -fall -max 0.252 [get_ports A]
set_input_transition -rise -min 0.146 [get_ports B]
set_input_transition -rise -max 0.264 [get_ports B]
set_input_transition -fall -min 0.164 [get_ports B]
set_input_transition -fall -max 0.252 [get_ports B]
set_input_transition -rise -min 0.146 [get_ports C]
set_input_transition -rise -max 0.264 [get_ports C]
set_input_transition -fall -min 0.164 [get_ports C]
set_input_transition -fall -max 0.252 [get_ports C]
set_input_transition -rise -min 0.146 [get_ports rst]
set_input_transition -rise -max 0.264 [get_ports rst]
set_input_transition -fall -min 0.164 [get_ports rst]
set_input_transition -fall -max 0.252 [get_ports rst]
set_ideal_net [get_nets rst]
set_ideal_net [get_nets clk]
set_clock_latency  0.35 [get_clocks clk]
set_clock_uncertainty -setup 0.25 [get_clocks clk]
set_clock_uncertainty -hold 0.25 [get_clocks clk]
