
# XM-Sim Command File
# TOOL:	xmsim(64)	24.09-s001
#
#
# You can restore this configuration with:
#
#      xrun -64bit codificador_pt2262_tb.sv codificador_pt2262.sv ../addr_interpreter/addr_interpreter.sv ../addr_interpreter/comp_endereco.sv ../bit_gen/bit_generator.sv ../oscillator/clock_divider.sv +gui +access+rw -s -input /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/restore.tcl
#

set tcl_prompt1 {puts -nonewline "xcelium> "}
set tcl_prompt2 {puts -nonewline "> "}
set vlog_format %h
set vhdl_format %v
set real_precision 6
set display_unit auto
set time_unit module
set heap_garbage_size -200
set heap_garbage_time 0
set assert_report_level note
set assert_stop_level error
set autoscope yes
set assert_1164_warnings yes
set pack_assert_off {}
set severity_pack_assert_off {note warning}
set assert_output_stop_level failed
set tcl_debug_level 0
set relax_path_name 1
set vhdl_vcdmap XX01ZX01X
set intovf_severity_level ERROR
set probe_screen_format 0
set rangecnst_severity_level ERROR
set textio_severity_level ERROR
set vital_timing_checks_on 1
set vlog_code_show_force 0
set assert_count_attempts 1
set tcl_all64 false
set tcl_runerror_exit false
set assert_report_incompletes 0
set show_force 1
set force_reset_by_reinvoke 0
set tcl_relaxed_literal 0
set probe_exclude_patterns {}
set probe_packed_limit 4k
set probe_unpacked_limit 16k
set assert_internal_msg no
set svseed 1
set assert_reporting_mode 0
set vcd_compact_mode 0
set vhdl_forgen_loopindex_enum_pos 0
set xmreplay_dc_debug 0
set tcl_runcmd_interrupt next_command
set tcl_sigval_prefix {#}
alias . run
alias indago verisium
alias quit exit
database -open -shm -into waves.shm waves -default
probe -create -database waves codificador_pt2262_tb.DUT.A codificador_pt2262_tb.DUT.D codificador_pt2262_tb.DUT.F_BIT_LOCATOR codificador_pt2262_tb.DUT.INTERPRETED_ADDR codificador_pt2262_tb.DUT.bit_gen_enb codificador_pt2262_tb.DUT.bit_gen_input codificador_pt2262_tb.DUT.bit_gen_output codificador_pt2262_tb.DUT.bit_gen_rst codificador_pt2262_tb.DUT.bit_generated_flag codificador_pt2262_tb.DUT.bit_sent_flag codificador_pt2262_tb.DUT.clk codificador_pt2262_tb.DUT.cod_o codificador_pt2262_tb.DUT.current_state codificador_pt2262_tb.DUT.next_state codificador_pt2262_tb.DUT.osc_clk codificador_pt2262_tb.DUT.osc_clk_rose codificador_pt2262_tb.DUT.osc_rst codificador_pt2262_tb.DUT.past_osc_clk codificador_pt2262_tb.DUT.reset codificador_pt2262_tb.DUT.sync

simvision -input restore.tcl.svcf
