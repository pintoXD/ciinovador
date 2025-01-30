
# XM-Sim Command File
# TOOL:	xmsim(64)	24.09-s001
#
#
# You can restore this configuration with:
#
#      xrun -64bit /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/decoder/decodificador_pt2272_tb.sv /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/decoder/decodificador_pt2272.sv /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/encoder/codificador_pt2262.sv /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/addr_interpreter/addr_interpreter.sv /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/addr_interpreter/comp_endereco.sv /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/bit_gen/bit_generator.sv /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/oscillator/clock_divider.sv /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/bidir_shift_register/bidir_shiftreg.sv +access+rw +gui -s -input /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/restores/restore_dec.tcl
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
probe -create -database waves decodificador_pt2272_tb.DUT.A decodificador_pt2272_tb.DUT.BIDIR_SHIFTREG_LEFT_SHIFT_OUT decodificador_pt2272_tb.DUT.BIDIR_SHIFTREG_OP_MODE decodificador_pt2272_tb.DUT.BIDIR_SHIFTREG_PARALLEL_OUT decodificador_pt2272_tb.DUT.BIDIR_SHIFTREG_PT2272_BIT_IN decodificador_pt2272_tb.DUT.BIDIR_SHIFTREG_RIGHT_SHIFT_OUT decodificador_pt2272_tb.DUT.BIDIR_SHIFTREG_SIZE decodificador_pt2272_tb.DUT.D decodificador_pt2272_tb.DUT.F_BIT_LOCATOR decodificador_pt2272_tb.DUT.HIGH_PULSE_COUNTING decodificador_pt2272_tb.DUT.INTERPRETED_ADDR decodificador_pt2272_tb.DUT.LOW_PULSE_COUNTING decodificador_pt2272_tb.DUT.PREVIOUS_cod_i decodificador_pt2272_tb.DUT.clk decodificador_pt2272_tb.DUT.cod_i decodificador_pt2272_tb.DUT.cod_i_FELL decodificador_pt2272_tb.DUT.cod_i_ROSE decodificador_pt2272_tb.DUT.current_cod_i decodificador_pt2272_tb.DUT.current_state decodificador_pt2272_tb.DUT.dv decodificador_pt2272_tb.DUT.i decodificador_pt2272_tb.DUT.internal_f_bit_locator decodificador_pt2272_tb.DUT.internal_interpreted_addr decodificador_pt2272_tb.DUT.next_state decodificador_pt2272_tb.DUT.osc_clk decodificador_pt2272_tb.DUT.osc_rst decodificador_pt2272_tb.DUT.reset decodificador_pt2272_tb.DUT.reset_counters
probe -create -database waves decodificador_pt2272_tb.DUT.BIDIR_SHIFTREG_RESET decodificador_pt2272_tb.DUT.flag_dv decodificador_pt2272_tb.encoder_dut.A decodificador_pt2272_tb.encoder_dut.D decodificador_pt2272_tb.encoder_dut.F_BIT_LOCATOR decodificador_pt2272_tb.encoder_dut.INTERPRETED_ADDR decodificador_pt2272_tb.encoder_dut.bit_gen_enb decodificador_pt2272_tb.encoder_dut.bit_gen_input decodificador_pt2272_tb.encoder_dut.bit_gen_output decodificador_pt2272_tb.encoder_dut.bit_gen_rst decodificador_pt2272_tb.encoder_dut.bit_generated_flag decodificador_pt2272_tb.encoder_dut.bit_sent_flag decodificador_pt2272_tb.encoder_dut.clk decodificador_pt2272_tb.encoder_dut.cod_o decodificador_pt2272_tb.encoder_dut.current_state decodificador_pt2272_tb.encoder_dut.next_state decodificador_pt2272_tb.encoder_dut.osc_clk decodificador_pt2272_tb.encoder_dut.osc_clk_rose decodificador_pt2272_tb.encoder_dut.osc_rst decodificador_pt2272_tb.encoder_dut.past_osc_clk decodificador_pt2272_tb.encoder_dut.reset decodificador_pt2272_tb.encoder_dut.sync

simvision -input restores/restore_dec.tcl.svcf
