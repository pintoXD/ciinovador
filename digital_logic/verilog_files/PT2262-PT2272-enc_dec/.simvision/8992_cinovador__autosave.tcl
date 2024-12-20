
# XM-Sim Command File
# TOOL:	xmsim(64)	22.09-s013
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
alias . run
alias quit exit
database -open -shm -into waves.shm waves -default
probe -create -database waves PT2262_ENCODER_TB.DUT.A PT2262_ENCODER_TB.DUT.D PT2262_ENCODER_TB.DUT.F_BIT_LOCATOR PT2262_ENCODER_TB.DUT.INTERPRETED_ADDR PT2262_ENCODER_TB.DUT.bit_gen_enb PT2262_ENCODER_TB.DUT.bit_gen_input PT2262_ENCODER_TB.DUT.bit_gen_output PT2262_ENCODER_TB.DUT.bit_gen_rst PT2262_ENCODER_TB.DUT.bit_generated_flag PT2262_ENCODER_TB.DUT.bit_sent_flag PT2262_ENCODER_TB.DUT.clk PT2262_ENCODER_TB.DUT.cod_o PT2262_ENCODER_TB.DUT.current_state PT2262_ENCODER_TB.DUT.next_state PT2262_ENCODER_TB.DUT.osc_clk PT2262_ENCODER_TB.DUT.osc_clk_rose PT2262_ENCODER_TB.DUT.osc_rst PT2262_ENCODER_TB.DUT.past_osc_clk PT2262_ENCODER_TB.DUT.reset PT2262_ENCODER_TB.DUT.sync
probe -create -database waves PT2262_ENCODER_TB.DUT.signal_creator.bit_sent PT2262_ENCODER_TB.DUT.signal_creator.current_state PT2262_ENCODER_TB.DUT.signal_creator.enable_generation PT2262_ENCODER_TB.DUT.signal_creator.enable_pulse_counting PT2262_ENCODER_TB.DUT.signal_creator.enable_pulse_counting_sync PT2262_ENCODER_TB.DUT.signal_creator.input_bit PT2262_ENCODER_TB.DUT.signal_creator.is_first_run PT2262_ENCODER_TB.DUT.signal_creator.next_state PT2262_ENCODER_TB.DUT.signal_creator.osc_clk PT2262_ENCODER_TB.DUT.signal_creator.output_signal PT2262_ENCODER_TB.DUT.signal_creator.pulse_counter PT2262_ENCODER_TB.DUT.signal_creator.pulse_counter_sync PT2262_ENCODER_TB.DUT.signal_creator.rst

simvision -input /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/.simvision/8992_cinovador__autosave.tcl.svcf
