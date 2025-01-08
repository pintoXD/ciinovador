
# XM-Sim Command File
# TOOL:	xmsim(64)	24.09-s001
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
probe -create -database waves PT2262_DECODER_TB.DUT.A PT2262_DECODER_TB.DUT.BIDIR_SHIFTREG_ENABLER PT2262_DECODER_TB.DUT.BIDIR_SHIFTREG_LEFT_SHIFT_OUT PT2262_DECODER_TB.DUT.BIDIR_SHIFTREG_OP_MODE PT2262_DECODER_TB.DUT.BIDIR_SHIFTREG_PARALLEL_IN PT2262_DECODER_TB.DUT.BIDIR_SHIFTREG_PARALLEL_OUT PT2262_DECODER_TB.DUT.BIDIR_SHIFTREG_PT2272_BIT_IN PT2262_DECODER_TB.DUT.BIDIR_SHIFTREG_RIGHT_SHIFT_OUT PT2262_DECODER_TB.DUT.BIDIR_SHIFTREG_SERIAL_IN PT2262_DECODER_TB.DUT.D PT2262_DECODER_TB.DUT.HIGH_PULSE_COUNTING PT2262_DECODER_TB.DUT.LOW_PULSE_COUNTING PT2262_DECODER_TB.DUT.PREVIOUS_cod_i PT2262_DECODER_TB.DUT.clk PT2262_DECODER_TB.DUT.cod_i PT2262_DECODER_TB.DUT.cod_i_FELL PT2262_DECODER_TB.DUT.cod_i_ROSE PT2262_DECODER_TB.DUT.current_state PT2262_DECODER_TB.DUT.dv PT2262_DECODER_TB.DUT.next_state PT2262_DECODER_TB.DUT.reset PT2262_DECODER_TB.DUT.reset_counters

simvision -input /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/decoder/.simvision/10106_cinovador__autosave.tcl.svcf
