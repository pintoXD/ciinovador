
# XM-Sim Command File
# TOOL:	xmsim(64)	24.09-s001
#
#
# You can restore this configuration with:
#
#      xrun -64bit /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/decoder/decodificador_pt2272_tb.sv /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/decoder/decodificador_pt2272_mapped.sv /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/encoder/codificador_pt2262.sv /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/libs/fast_vdd1v2_basicCells.v /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/addr_interpreter/comp_endereco.sv +access+rw +gui -input /home/cinovador/Documents/course_files/digital_logic/verilog_files/PT2262-PT2272-enc_dec/restore_dec_synth.tcl
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
probe -create -database waves decodificador_pt2272_tb.DUT.A decodificador_pt2272_tb.DUT.BIDIR_SHIFTREG_OP_MODE decodificador_pt2272_tb.DUT.BIDIR_SHIFTREG_PARALLEL_OUT decodificador_pt2272_tb.DUT.BIDIR_SHIFTREG_PT2272_BIT_IN decodificador_pt2272_tb.DUT.BIDIR_SHIFTREG_RESET decodificador_pt2272_tb.DUT.D decodificador_pt2272_tb.DUT.F_BIT_LOCATOR decodificador_pt2272_tb.DUT.HIGH_PULSE_COUNTING decodificador_pt2272_tb.DUT.INTERPRETED_ADDR decodificador_pt2272_tb.DUT.LOW_PULSE_COUNTING decodificador_pt2272_tb.DUT.PREVIOUS_cod_i decodificador_pt2272_tb.DUT.clk decodificador_pt2272_tb.DUT.cod_i decodificador_pt2272_tb.DUT.current_state decodificador_pt2272_tb.DUT.dv decodificador_pt2272_tb.DUT.internal_f_bit_locator decodificador_pt2272_tb.DUT.internal_interpreted_addr decodificador_pt2272_tb.DUT.internal_oscillator_clk_cycle_counting decodificador_pt2272_tb.DUT.osc_clk decodificador_pt2272_tb.DUT.reset decodificador_pt2272_tb.DUT.reset_counters decodificador_pt2272_tb.DUT.n_0 decodificador_pt2272_tb.DUT.n_1 decodificador_pt2272_tb.DUT.n_2 decodificador_pt2272_tb.DUT.n_3 decodificador_pt2272_tb.DUT.n_4 decodificador_pt2272_tb.DUT.n_5 decodificador_pt2272_tb.DUT.n_6 decodificador_pt2272_tb.DUT.n_7 decodificador_pt2272_tb.DUT.n_8 decodificador_pt2272_tb.DUT.n_9 decodificador_pt2272_tb.DUT.n_10 decodificador_pt2272_tb.DUT.n_11 decodificador_pt2272_tb.DUT.n_12 decodificador_pt2272_tb.DUT.n_13 decodificador_pt2272_tb.DUT.n_14 decodificador_pt2272_tb.DUT.n_15 decodificador_pt2272_tb.DUT.n_16 decodificador_pt2272_tb.DUT.n_17 decodificador_pt2272_tb.DUT.n_18 decodificador_pt2272_tb.DUT.n_19 decodificador_pt2272_tb.DUT.n_20 decodificador_pt2272_tb.DUT.n_21 decodificador_pt2272_tb.DUT.n_22 decodificador_pt2272_tb.DUT.n_23 decodificador_pt2272_tb.DUT.n_24 decodificador_pt2272_tb.DUT.n_25 decodificador_pt2272_tb.DUT.n_26 decodificador_pt2272_tb.DUT.n_27 decodificador_pt2272_tb.DUT.n_28 decodificador_pt2272_tb.DUT.n_29 decodificador_pt2272_tb.DUT.n_30 decodificador_pt2272_tb.DUT.n_31 decodificador_pt2272_tb.DUT.n_32 decodificador_pt2272_tb.DUT.n_33 decodificador_pt2272_tb.DUT.n_34 decodificador_pt2272_tb.DUT.n_35 decodificador_pt2272_tb.DUT.n_36 decodificador_pt2272_tb.DUT.n_37 decodificador_pt2272_tb.DUT.n_38 decodificador_pt2272_tb.DUT.n_39 decodificador_pt2272_tb.DUT.n_40 decodificador_pt2272_tb.DUT.n_41 decodificador_pt2272_tb.DUT.n_42 decodificador_pt2272_tb.DUT.n_43 decodificador_pt2272_tb.DUT.n_44 decodificador_pt2272_tb.DUT.n_45 decodificador_pt2272_tb.DUT.n_46 decodificador_pt2272_tb.DUT.n_47 decodificador_pt2272_tb.DUT.n_48 decodificador_pt2272_tb.DUT.n_49 decodificador_pt2272_tb.DUT.n_50 decodificador_pt2272_tb.DUT.n_51 decodificador_pt2272_tb.DUT.n_52 decodificador_pt2272_tb.DUT.n_53 decodificador_pt2272_tb.DUT.n_54 decodificador_pt2272_tb.DUT.n_55 decodificador_pt2272_tb.DUT.n_56 decodificador_pt2272_tb.DUT.n_57 decodificador_pt2272_tb.DUT.n_58 decodificador_pt2272_tb.DUT.n_59 decodificador_pt2272_tb.DUT.n_60 decodificador_pt2272_tb.DUT.n_61 decodificador_pt2272_tb.DUT.n_62 decodificador_pt2272_tb.DUT.n_63 decodificador_pt2272_tb.DUT.n_64 decodificador_pt2272_tb.DUT.n_65 decodificador_pt2272_tb.DUT.n_66 decodificador_pt2272_tb.DUT.n_67 decodificador_pt2272_tb.DUT.n_68 decodificador_pt2272_tb.DUT.n_69 decodificador_pt2272_tb.DUT.n_70 decodificador_pt2272_tb.DUT.n_71 decodificador_pt2272_tb.DUT.n_72 decodificador_pt2272_tb.DUT.n_73 decodificador_pt2272_tb.DUT.n_74 decodificador_pt2272_tb.DUT.n_75 decodificador_pt2272_tb.DUT.n_76 decodificador_pt2272_tb.DUT.n_77 decodificador_pt2272_tb.DUT.n_78 decodificador_pt2272_tb.DUT.n_79 decodificador_pt2272_tb.DUT.n_80 decodificador_pt2272_tb.DUT.n_81 decodificador_pt2272_tb.DUT.n_82 decodificador_pt2272_tb.DUT.n_83 decodificador_pt2272_tb.DUT.n_84 decodificador_pt2272_tb.DUT.n_85 decodificador_pt2272_tb.DUT.n_86 decodificador_pt2272_tb.DUT.n_87 decodificador_pt2272_tb.DUT.n_88 decodificador_pt2272_tb.DUT.n_89 decodificador_pt2272_tb.DUT.n_90 decodificador_pt2272_tb.DUT.n_91 decodificador_pt2272_tb.DUT.n_92 decodificador_pt2272_tb.DUT.n_93 decodificador_pt2272_tb.DUT.n_94 decodificador_pt2272_tb.DUT.n_95 decodificador_pt2272_tb.DUT.n_96 decodificador_pt2272_tb.DUT.n_97 decodificador_pt2272_tb.DUT.n_98 decodificador_pt2272_tb.DUT.n_99 decodificador_pt2272_tb.DUT.n_100 decodificador_pt2272_tb.DUT.n_101 decodificador_pt2272_tb.DUT.n_102 decodificador_pt2272_tb.DUT.n_103 decodificador_pt2272_tb.DUT.n_104 decodificador_pt2272_tb.DUT.n_105 decodificador_pt2272_tb.DUT.n_106 decodificador_pt2272_tb.DUT.n_107 decodificador_pt2272_tb.DUT.n_108 decodificador_pt2272_tb.DUT.n_109 decodificador_pt2272_tb.DUT.n_110 decodificador_pt2272_tb.DUT.n_111 decodificador_pt2272_tb.DUT.n_112 decodificador_pt2272_tb.DUT.n_113 decodificador_pt2272_tb.DUT.n_114 decodificador_pt2272_tb.DUT.n_115 decodificador_pt2272_tb.DUT.n_116 decodificador_pt2272_tb.DUT.n_117 decodificador_pt2272_tb.DUT.n_118 decodificador_pt2272_tb.DUT.n_119 decodificador_pt2272_tb.DUT.n_120 decodificador_pt2272_tb.DUT.n_121 decodificador_pt2272_tb.DUT.n_122 decodificador_pt2272_tb.DUT.n_123 decodificador_pt2272_tb.DUT.n_124 decodificador_pt2272_tb.DUT.n_125 decodificador_pt2272_tb.DUT.n_126 decodificador_pt2272_tb.DUT.n_127 decodificador_pt2272_tb.DUT.n_128 decodificador_pt2272_tb.DUT.n_129 decodificador_pt2272_tb.DUT.n_130 decodificador_pt2272_tb.DUT.n_131 decodificador_pt2272_tb.DUT.n_132 decodificador_pt2272_tb.DUT.n_133 decodificador_pt2272_tb.DUT.n_134 decodificador_pt2272_tb.DUT.n_135 decodificador_pt2272_tb.DUT.n_136 decodificador_pt2272_tb.DUT.n_137 decodificador_pt2272_tb.DUT.n_138 decodificador_pt2272_tb.DUT.n_139 decodificador_pt2272_tb.DUT.n_140 decodificador_pt2272_tb.DUT.n_141 decodificador_pt2272_tb.DUT.n_142 decodificador_pt2272_tb.DUT.n_143 decodificador_pt2272_tb.DUT.n_144 decodificador_pt2272_tb.DUT.n_145 decodificador_pt2272_tb.DUT.n_146 decodificador_pt2272_tb.DUT.n_147 decodificador_pt2272_tb.DUT.n_148 decodificador_pt2272_tb.DUT.n_149 decodificador_pt2272_tb.DUT.n_150 decodificador_pt2272_tb.DUT.n_151 decodificador_pt2272_tb.DUT.n_152 decodificador_pt2272_tb.DUT.n_153 decodificador_pt2272_tb.DUT.n_154 decodificador_pt2272_tb.DUT.n_155 decodificador_pt2272_tb.DUT.n_156 decodificador_pt2272_tb.DUT.n_157 decodificador_pt2272_tb.DUT.n_158 decodificador_pt2272_tb.DUT.n_159 decodificador_pt2272_tb.DUT.n_160 decodificador_pt2272_tb.DUT.n_161 decodificador_pt2272_tb.DUT.n_162 decodificador_pt2272_tb.DUT.n_163 decodificador_pt2272_tb.DUT.n_164 decodificador_pt2272_tb.DUT.n_165 decodificador_pt2272_tb.DUT.n_166 decodificador_pt2272_tb.DUT.n_167 decodificador_pt2272_tb.DUT.n_168 decodificador_pt2272_tb.DUT.n_169 decodificador_pt2272_tb.DUT.n_170 decodificador_pt2272_tb.DUT.n_171 decodificador_pt2272_tb.DUT.n_172 decodificador_pt2272_tb.DUT.n_173 decodificador_pt2272_tb.DUT.n_174 decodificador_pt2272_tb.DUT.n_175 decodificador_pt2272_tb.DUT.n_176 decodificador_pt2272_tb.DUT.n_177 decodificador_pt2272_tb.DUT.n_178 decodificador_pt2272_tb.DUT.n_179 decodificador_pt2272_tb.DUT.n_180 decodificador_pt2272_tb.DUT.n_181 decodificador_pt2272_tb.DUT.n_182 decodificador_pt2272_tb.DUT.n_183 decodificador_pt2272_tb.DUT.n_184 decodificador_pt2272_tb.DUT.n_185 decodificador_pt2272_tb.DUT.n_186 decodificador_pt2272_tb.DUT.n_187 decodificador_pt2272_tb.DUT.n_188 decodificador_pt2272_tb.DUT.n_189 decodificador_pt2272_tb.DUT.n_190 decodificador_pt2272_tb.DUT.n_191 decodificador_pt2272_tb.DUT.n_192 decodificador_pt2272_tb.DUT.n_193

simvision -input restore_dec_synth.tcl.svcf
