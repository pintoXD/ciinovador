
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
database -open -vcd -into verilog.dump _verilog.dump1 -timescale fs
database -open -shm -into waves.shm waves -default
database -open -vcd -into test.vcd _test.vcd1 -timescale fs
probe -create -database waves tb_sinaleira2.U1.clk tb_sinaleira2.U1.estado_atual_ff tb_sinaleira2.U1.pedestre tb_sinaleira2.U1.pedestre_2_verde tb_sinaleira2.U1.pedestre_vermelho tb_sinaleira2.U1.proximo_estado tb_sinaleira2.U1.reset tb_sinaleira2.U1.rua_1_amarelo tb_sinaleira2.U1.rua_1_verde tb_sinaleira2.U1.rua_1_vermelho tb_sinaleira2.U1.rua_2_amarelo tb_sinaleira2.U1.rua_2_verde tb_sinaleira2.U1.rua_2_vermelho
probe -create -database waves tb_sinaleira2.U1.clk tb_sinaleira2.U1.estado_atual_ff tb_sinaleira2.U1.pedestre tb_sinaleira2.U1.pedestre_2_verde tb_sinaleira2.U1.pedestre_vermelho tb_sinaleira2.U1.proximo_estado tb_sinaleira2.U1.reset tb_sinaleira2.U1.rua_1_amarelo tb_sinaleira2.U1.rua_1_verde tb_sinaleira2.U1.rua_1_vermelho tb_sinaleira2.U1.rua_2_amarelo tb_sinaleira2.U1.rua_2_verde tb_sinaleira2.U1.rua_2_vermelho

simvision -input /home/cinovador/Documents/prova-logica-digital/respostas/q3/.simvision/55774_cinovador__autosave.tcl.svcf
