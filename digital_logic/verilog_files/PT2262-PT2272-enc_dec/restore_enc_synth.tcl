
# XM-Sim Command File
# TOOL:	xmsim(64)	24.09-s001
#
#
# You can restore this configuration with:
#
#      xrun -64bit /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/encoder/codificador_pt2262_tb.sv /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/encoder/codificador_pt2262.v /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/libs/fast_vdd1v2_basicCells.v /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/addr_interpreter/comp_endereco.sv /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/bit_gen/bit_generator.sv /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/oscillator/clock_divider.sv +access+rw +gui -s -input restore_enc_synth.tcl -input /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/restore_enc_synth.tcl
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
probe -create -database waves codificador_pt2262_tb.DUT.A codificador_pt2262_tb.DUT.D codificador_pt2262_tb.DUT.F_BIT_LOCATOR codificador_pt2262_tb.DUT.INTERPRETED_ADDR codificador_pt2262_tb.DUT.bit_gen_input codificador_pt2262_tb.DUT.clk codificador_pt2262_tb.DUT.cod_o codificador_pt2262_tb.DUT.current_state codificador_pt2262_tb.DUT.internal_oscillator_clk_cycle_counting codificador_pt2262_tb.DUT.n_0 codificador_pt2262_tb.DUT.n_1 codificador_pt2262_tb.DUT.n_2 codificador_pt2262_tb.DUT.n_3 codificador_pt2262_tb.DUT.n_4 codificador_pt2262_tb.DUT.n_5 codificador_pt2262_tb.DUT.n_6 codificador_pt2262_tb.DUT.n_7 codificador_pt2262_tb.DUT.n_8 codificador_pt2262_tb.DUT.n_9 codificador_pt2262_tb.DUT.n_10 codificador_pt2262_tb.DUT.n_11 codificador_pt2262_tb.DUT.n_12 codificador_pt2262_tb.DUT.n_13 codificador_pt2262_tb.DUT.n_14 codificador_pt2262_tb.DUT.n_17 codificador_pt2262_tb.DUT.n_18 codificador_pt2262_tb.DUT.n_19 codificador_pt2262_tb.DUT.n_20 codificador_pt2262_tb.DUT.n_21 codificador_pt2262_tb.DUT.n_22 codificador_pt2262_tb.DUT.n_24 codificador_pt2262_tb.DUT.n_25 codificador_pt2262_tb.DUT.n_26 codificador_pt2262_tb.DUT.n_27 codificador_pt2262_tb.DUT.n_28 codificador_pt2262_tb.DUT.n_29 codificador_pt2262_tb.DUT.n_30 codificador_pt2262_tb.DUT.n_31 codificador_pt2262_tb.DUT.n_32 codificador_pt2262_tb.DUT.n_33 codificador_pt2262_tb.DUT.n_34 codificador_pt2262_tb.DUT.n_35 codificador_pt2262_tb.DUT.n_36 codificador_pt2262_tb.DUT.n_37 codificador_pt2262_tb.DUT.n_38 codificador_pt2262_tb.DUT.n_41 codificador_pt2262_tb.DUT.n_42 codificador_pt2262_tb.DUT.n_43 codificador_pt2262_tb.DUT.n_44 codificador_pt2262_tb.DUT.n_45 codificador_pt2262_tb.DUT.n_46 codificador_pt2262_tb.DUT.n_47 codificador_pt2262_tb.DUT.n_48 codificador_pt2262_tb.DUT.n_49 codificador_pt2262_tb.DUT.n_50 codificador_pt2262_tb.DUT.n_51 codificador_pt2262_tb.DUT.n_53 codificador_pt2262_tb.DUT.n_54 codificador_pt2262_tb.DUT.n_55 codificador_pt2262_tb.DUT.n_56 codificador_pt2262_tb.DUT.n_57 codificador_pt2262_tb.DUT.n_58 codificador_pt2262_tb.DUT.n_59 codificador_pt2262_tb.DUT.n_61 codificador_pt2262_tb.DUT.n_62 codificador_pt2262_tb.DUT.n_63 codificador_pt2262_tb.DUT.n_65 codificador_pt2262_tb.DUT.n_66 codificador_pt2262_tb.DUT.n_67 codificador_pt2262_tb.DUT.n_68 codificador_pt2262_tb.DUT.n_69 codificador_pt2262_tb.DUT.n_70 codificador_pt2262_tb.DUT.n_71 codificador_pt2262_tb.DUT.n_72 codificador_pt2262_tb.DUT.n_73 codificador_pt2262_tb.DUT.n_75 codificador_pt2262_tb.DUT.n_76 codificador_pt2262_tb.DUT.n_77 codificador_pt2262_tb.DUT.n_78 codificador_pt2262_tb.DUT.n_79 codificador_pt2262_tb.DUT.n_80 codificador_pt2262_tb.DUT.n_81 codificador_pt2262_tb.DUT.n_82 codificador_pt2262_tb.DUT.n_83 codificador_pt2262_tb.DUT.n_84 codificador_pt2262_tb.DUT.n_85 codificador_pt2262_tb.DUT.n_86 codificador_pt2262_tb.DUT.n_87 codificador_pt2262_tb.DUT.n_88 codificador_pt2262_tb.DUT.n_89 codificador_pt2262_tb.DUT.n_90 codificador_pt2262_tb.DUT.n_91 codificador_pt2262_tb.DUT.n_92 codificador_pt2262_tb.DUT.n_94 codificador_pt2262_tb.DUT.n_95 codificador_pt2262_tb.DUT.n_96 codificador_pt2262_tb.DUT.n_97 codificador_pt2262_tb.DUT.n_98 codificador_pt2262_tb.DUT.n_99 codificador_pt2262_tb.DUT.n_100 codificador_pt2262_tb.DUT.n_101 codificador_pt2262_tb.DUT.n_102 codificador_pt2262_tb.DUT.n_103 codificador_pt2262_tb.DUT.n_104 codificador_pt2262_tb.DUT.n_105 codificador_pt2262_tb.DUT.n_106 codificador_pt2262_tb.DUT.n_107 codificador_pt2262_tb.DUT.n_108 codificador_pt2262_tb.DUT.n_109 codificador_pt2262_tb.DUT.n_110 codificador_pt2262_tb.DUT.n_111 codificador_pt2262_tb.DUT.n_115 codificador_pt2262_tb.DUT.n_116 codificador_pt2262_tb.DUT.n_117 codificador_pt2262_tb.DUT.n_118 codificador_pt2262_tb.DUT.n_119 codificador_pt2262_tb.DUT.n_121 codificador_pt2262_tb.DUT.n_122 codificador_pt2262_tb.DUT.n_123 codificador_pt2262_tb.DUT.n_124 codificador_pt2262_tb.DUT.n_125 codificador_pt2262_tb.DUT.n_126 codificador_pt2262_tb.DUT.n_127 codificador_pt2262_tb.DUT.n_128 codificador_pt2262_tb.DUT.n_129 codificador_pt2262_tb.DUT.n_130 codificador_pt2262_tb.DUT.n_131 codificador_pt2262_tb.DUT.n_132 codificador_pt2262_tb.DUT.n_133 codificador_pt2262_tb.DUT.n_134 codificador_pt2262_tb.DUT.n_135 codificador_pt2262_tb.DUT.n_136 codificador_pt2262_tb.DUT.n_137 codificador_pt2262_tb.DUT.n_138 codificador_pt2262_tb.DUT.n_139 codificador_pt2262_tb.DUT.n_140 codificador_pt2262_tb.DUT.n_142 codificador_pt2262_tb.DUT.n_143 codificador_pt2262_tb.DUT.n_144 codificador_pt2262_tb.DUT.n_145 codificador_pt2262_tb.DUT.n_146 codificador_pt2262_tb.DUT.n_147 codificador_pt2262_tb.DUT.n_148 codificador_pt2262_tb.DUT.n_150 codificador_pt2262_tb.DUT.n_151 codificador_pt2262_tb.DUT.n_152 codificador_pt2262_tb.DUT.n_154 codificador_pt2262_tb.DUT.n_156 codificador_pt2262_tb.DUT.n_158 codificador_pt2262_tb.DUT.n_160 codificador_pt2262_tb.DUT.n_161 codificador_pt2262_tb.DUT.n_162 codificador_pt2262_tb.DUT.n_163 codificador_pt2262_tb.DUT.n_165 codificador_pt2262_tb.DUT.n_166 codificador_pt2262_tb.DUT.n_167 codificador_pt2262_tb.DUT.n_168 codificador_pt2262_tb.DUT.n_169 codificador_pt2262_tb.DUT.n_170 codificador_pt2262_tb.DUT.n_171 codificador_pt2262_tb.DUT.n_172 codificador_pt2262_tb.DUT.n_173 codificador_pt2262_tb.DUT.n_174 codificador_pt2262_tb.DUT.n_175 codificador_pt2262_tb.DUT.n_176 codificador_pt2262_tb.DUT.n_177 codificador_pt2262_tb.DUT.n_178 codificador_pt2262_tb.DUT.n_179 codificador_pt2262_tb.DUT.n_180 codificador_pt2262_tb.DUT.n_181 codificador_pt2262_tb.DUT.n_182 codificador_pt2262_tb.DUT.n_203 codificador_pt2262_tb.DUT.osc_clk codificador_pt2262_tb.DUT.past_osc_clk codificador_pt2262_tb.DUT.reset codificador_pt2262_tb.DUT.signal_creator_current_state codificador_pt2262_tb.DUT.signal_creator_enable_pulse_counting codificador_pt2262_tb.DUT.signal_creator_enable_pulse_counting_sync codificador_pt2262_tb.DUT.signal_creator_is_first_run codificador_pt2262_tb.DUT.signal_creator_pulse_counter codificador_pt2262_tb.DUT.signal_creator_pulse_counter_sync codificador_pt2262_tb.DUT.sync
probe -create -database waves BIT_GENERATOR.bit_sent BIT_GENERATOR.current_state BIT_GENERATOR.enable_generation BIT_GENERATOR.enable_pulse_counting BIT_GENERATOR.enable_pulse_counting_sync BIT_GENERATOR.input_bit BIT_GENERATOR.is_first_run BIT_GENERATOR.next_state BIT_GENERATOR.osc_clk BIT_GENERATOR.output_signal BIT_GENERATOR.pulse_counter BIT_GENERATOR.pulse_counter_sync BIT_GENERATOR.rst
probe -create -database waves CLOCK_DIVIDER.INPUT_CLK CLOCK_DIVIDER.OUTPUT_CLK CLOCK_DIVIDER.RST CLOCK_DIVIDER.clk_cycle_counting CLOCK_DIVIDER.divider_index_ceil

simvision -input restore_enc_synth.tcl.svcf
