
// Generated by Cadence Genus(TM) Synthesis Solution 21.10-p002_1
// Generated on: Jan 14 2025 11:00:45 -03 (Jan 14 2025 14:00:45 UTC)

// Verification Directory fv/decodificador_pt2272 

module ADDRESS_INTERPRETER(A, INTERPRETED_ADDR, F_BIT_LOCATOR);
  input [7:0] A;
  output [7:0] INTERPRETED_ADDR, F_BIT_LOCATOR;
  wire [7:0] A;
  wire [7:0] INTERPRETED_ADDR, F_BIT_LOCATOR;
  comp_endereco comp_endereco(.A (A), .A_01 (INTERPRETED_ADDR), .A_F
       (F_BIT_LOCATOR));
endmodule

module decodificador_pt2272(clk, reset, A, cod_i, D, dv);
  input clk, reset, cod_i;
  input [7:0] A;
  output [3:0] D;
  output dv;
  wire clk, reset, cod_i;
  wire [7:0] A;
  wire [3:0] D;
  wire dv;
  wire [7:0] INTERPRETED_ADDR;
  wire [7:0] F_BIT_LOCATOR;
  wire [2:0] BIDIR_SHIFTREG_OP_MODE;
  wire [1:0] BIDIR_SHIFTREG_PT2272_BIT_IN;
  wire [4:0] HIGH_PULSE_COUNTING;
  wire [7:0] LOW_PULSE_COUNTING;
  wire [25:0] BIDIR_SHIFTREG_PARALLEL_OUT;
  wire [2:0] current_state;
  wire [6:0] internal_oscillator_clk_cycle_counting;
  wire BIDIR_SHIFTREG_RESET, PREVIOUS_cod_i, flag_dv, n_0, n_1, n_2,
       n_3, n_4;
  wire n_5, n_6, n_7, n_8, n_9, n_10, n_11, n_12;
  wire n_13, n_14, n_15, n_16, n_17, n_18, n_19, n_20;
  wire n_21, n_22, n_23, n_24, n_25, n_26, n_27, n_28;
  wire n_29, n_30, n_31, n_32, n_33, n_34, n_35, n_36;
  wire n_37, n_38, n_39, n_40, n_41, n_42, n_43, n_44;
  wire n_45, n_46, n_47, n_48, n_49, n_50, n_51, n_52;
  wire n_53, n_54, n_55, n_56, n_57, n_58, n_59, n_60;
  wire n_61, n_62, n_63, n_64, n_65, n_66, n_67, n_68;
  wire n_69, n_70, n_71, n_72, n_73, n_74, n_75, n_76;
  wire n_77, n_78, n_79, n_80, n_81, n_82, n_83, n_84;
  wire n_85, n_86, n_87, n_88, n_89, n_90, n_91, n_92;
  wire n_93, n_94, n_95, n_96, n_97, n_98, n_99, n_100;
  wire n_101, n_102, n_103, n_104, n_105, n_106, n_107, n_108;
  wire n_109, n_110, n_111, n_112, n_113, n_114, n_115, n_116;
  wire n_117, n_118, n_119, n_120, n_121, n_122, n_123, n_124;
  wire n_125, n_126, n_127, n_128, n_129, n_130, n_131, n_132;
  wire n_133, n_134, n_135, n_136, n_137, n_138, n_139, n_140;
  wire n_141, n_142, n_143, n_144, n_145, n_146, n_147, n_148;
  wire n_149, n_150, n_151, n_152, n_153, n_154, n_155, n_156;
  wire n_157, n_158, n_159, n_160, osc_clk, reset_counters;
  ADDRESS_INTERPRETER addr_translator(.A (A), .INTERPRETED_ADDR
       (INTERPRETED_ADDR), .F_BIT_LOCATOR (F_BIT_LOCATOR));
  DFFQXL \BIDIR_SHIFTREG_OP_MODE_reg[0] (.CK (osc_clk), .D (n_103), .Q
       (BIDIR_SHIFTREG_OP_MODE[0]));
  SDFFQX1 \BIDIR_SHIFTREG_PT2272_BIT_IN_reg[0] (.CK (osc_clk), .D
       (BIDIR_SHIFTREG_PT2272_BIT_IN[0]), .SI (n_10), .SE (n_81), .Q
       (BIDIR_SHIFTREG_PT2272_BIT_IN[0]));
  DFFHQX1 \BIDIR_SHIFTREG_PT2272_BIT_IN_reg[1] (.CK (osc_clk), .D
       (n_105), .Q (BIDIR_SHIFTREG_PT2272_BIT_IN[1]));
  DFFSHQX1 BIDIR_SHIFTREG_RESET_reg(.SN (n_4), .CK (osc_clk), .D
       (n_84), .Q (BIDIR_SHIFTREG_RESET));
  DFFHQX1 \D_reg[0] (.CK (osc_clk), .D (n_122), .Q (D[0]));
  DFFHQX1 \D_reg[1] (.CK (osc_clk), .D (n_121), .Q (D[1]));
  DFFHQX1 \D_reg[2] (.CK (osc_clk), .D (n_124), .Q (D[2]));
  DFFHQX1 \D_reg[3] (.CK (osc_clk), .D (n_123), .Q (D[3]));
  DFFRHQX1 \HIGH_PULSE_COUNTING_reg[0] (.RN (n_4), .CK (osc_clk), .D
       (n_83), .Q (HIGH_PULSE_COUNTING[0]));
  DFFRHQX1 \HIGH_PULSE_COUNTING_reg[1] (.RN (n_4), .CK (osc_clk), .D
       (n_90), .Q (HIGH_PULSE_COUNTING[1]));
  DFFRHQX1 \HIGH_PULSE_COUNTING_reg[2] (.RN (n_4), .CK (osc_clk), .D
       (n_128), .Q (HIGH_PULSE_COUNTING[2]));
  DFFRHQX1 \LOW_PULSE_COUNTING_reg[1] (.RN (n_4), .CK (osc_clk), .D
       (n_94), .Q (LOW_PULSE_COUNTING[1]));
  DFFRHQX1 \LOW_PULSE_COUNTING_reg[2] (.RN (n_4), .CK (osc_clk), .D
       (n_109), .Q (LOW_PULSE_COUNTING[2]));
  DFFRHQX1 \LOW_PULSE_COUNTING_reg[5] (.RN (n_4), .CK (osc_clk), .D
       (n_151), .Q (LOW_PULSE_COUNTING[5]));
  DFFRHQX1 \LOW_PULSE_COUNTING_reg[6] (.RN (n_4), .CK (osc_clk), .D
       (n_158), .Q (LOW_PULSE_COUNTING[6]));
  DFFRHQX1 \LOW_PULSE_COUNTING_reg[7] (.RN (n_4), .CK (osc_clk), .D
       (n_160), .Q (LOW_PULSE_COUNTING[7]));
  DFFRHQX1 PREVIOUS_cod_i_reg(.RN (n_4), .CK (cod_i), .D (cod_i), .Q
       (PREVIOUS_cod_i));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[2] (.RN (n_14), .CK (osc_clk), .D
       (BIDIR_SHIFTREG_PARALLEL_OUT[2]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[4]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[2]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[3] (.RN (n_14), .CK (osc_clk), .D
       (BIDIR_SHIFTREG_PARALLEL_OUT[3]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[5]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[3]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[4] (.RN (n_14), .CK (osc_clk), .D
       (BIDIR_SHIFTREG_PARALLEL_OUT[4]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[6]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[4]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[5] (.RN (n_14), .CK (osc_clk), .D
       (BIDIR_SHIFTREG_PARALLEL_OUT[5]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[7]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[5]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[6] (.RN (n_14), .CK (osc_clk), .D
       (BIDIR_SHIFTREG_PARALLEL_OUT[6]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[8]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[6]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[7] (.RN (n_14), .CK (osc_clk), .D
       (BIDIR_SHIFTREG_PARALLEL_OUT[7]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[9]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[7]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[8] (.RN (n_14), .CK (osc_clk), .D
       (BIDIR_SHIFTREG_PARALLEL_OUT[8]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[10]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[8]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[9] (.RN (n_14), .CK (osc_clk), .D
       (BIDIR_SHIFTREG_PARALLEL_OUT[9]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[11]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[9]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[10] (.RN (n_14), .CK (osc_clk),
       .D (BIDIR_SHIFTREG_PARALLEL_OUT[10]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[12]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[10]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[11] (.RN (n_14), .CK (osc_clk),
       .D (BIDIR_SHIFTREG_PARALLEL_OUT[11]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[13]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[11]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[12] (.RN (n_14), .CK (osc_clk),
       .D (BIDIR_SHIFTREG_PARALLEL_OUT[12]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[14]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[12]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[13] (.RN (n_14), .CK (osc_clk),
       .D (BIDIR_SHIFTREG_PARALLEL_OUT[13]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[15]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[13]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[14] (.RN (n_14), .CK (osc_clk),
       .D (BIDIR_SHIFTREG_PARALLEL_OUT[14]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[16]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[14]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[15] (.RN (n_14), .CK (osc_clk),
       .D (BIDIR_SHIFTREG_PARALLEL_OUT[15]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[17]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[15]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[16] (.RN (n_14), .CK (osc_clk),
       .D (BIDIR_SHIFTREG_PARALLEL_OUT[16]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[18]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[16]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[17] (.RN (n_14), .CK (osc_clk),
       .D (BIDIR_SHIFTREG_PARALLEL_OUT[17]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[19]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[17]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[18] (.RN (n_14), .CK (osc_clk),
       .D (BIDIR_SHIFTREG_PARALLEL_OUT[18]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[20]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[18]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[19] (.RN (n_14), .CK (osc_clk),
       .D (BIDIR_SHIFTREG_PARALLEL_OUT[19]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[21]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[19]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[20] (.RN (n_14), .CK (osc_clk),
       .D (BIDIR_SHIFTREG_PARALLEL_OUT[20]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[22]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[20]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[21] (.RN (n_14), .CK (osc_clk),
       .D (BIDIR_SHIFTREG_PARALLEL_OUT[21]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[23]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[21]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[22] (.RN (n_14), .CK (osc_clk),
       .D (BIDIR_SHIFTREG_PARALLEL_OUT[22]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[24]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[22]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[23] (.RN (n_14), .CK (osc_clk),
       .D (BIDIR_SHIFTREG_PARALLEL_OUT[23]), .SI
       (BIDIR_SHIFTREG_PARALLEL_OUT[25]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[23]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[24] (.RN (n_14), .CK (osc_clk),
       .D (BIDIR_SHIFTREG_PARALLEL_OUT[24]), .SI
       (BIDIR_SHIFTREG_PT2272_BIT_IN[0]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[24]));
  SDFFRHQX1 \RCVD_DATA_SHIFTREG_q_reg[25] (.RN (n_14), .CK (osc_clk),
       .D (BIDIR_SHIFTREG_PARALLEL_OUT[25]), .SI
       (BIDIR_SHIFTREG_PT2272_BIT_IN[1]), .SE
       (BIDIR_SHIFTREG_OP_MODE[0]), .Q
       (BIDIR_SHIFTREG_PARALLEL_OUT[25]));
  DFFRHQX1 \current_state_reg[2] (.RN (n_4), .CK (osc_clk), .D (n_134),
       .Q (current_state[2]));
  DFFRHQX1 dv_reg(.RN (n_4), .CK (osc_clk), .D (n_110), .Q (dv));
  DFFRHQX1 flag_dv_reg(.RN (n_4), .CK (osc_clk), .D (n_148), .Q
       (flag_dv));
  SDFFRHQX1 internal_oscillator_OUTPUT_CLK_reg(.RN (n_4), .CK (clk), .D
       (n_95), .SI (n_96), .SE (osc_clk), .Q (osc_clk));
  DFFRHQX1 \internal_oscillator_clk_cycle_counting_reg[0] (.RN (n_4),
       .CK (clk), .D (n_107), .Q
       (internal_oscillator_clk_cycle_counting[0]));
  DFFRHQX1 \internal_oscillator_clk_cycle_counting_reg[1] (.RN (n_4),
       .CK (clk), .D (n_101), .Q
       (internal_oscillator_clk_cycle_counting[1]));
  DFFRHQX1 \internal_oscillator_clk_cycle_counting_reg[3] (.RN (n_4),
       .CK (clk), .D (n_125), .Q
       (internal_oscillator_clk_cycle_counting[3]));
  DFFRHQX1 \internal_oscillator_clk_cycle_counting_reg[5] (.RN (n_4),
       .CK (clk), .D (n_154), .Q
       (internal_oscillator_clk_cycle_counting[5]));
  DFFRHQX1 \internal_oscillator_clk_cycle_counting_reg[6] (.RN (n_4),
       .CK (clk), .D (n_156), .Q
       (internal_oscillator_clk_cycle_counting[6]));
  NOR2XL g6801__2398(.A (reset_counters), .B (n_159), .Y (n_160));
  AOI22XL g6803__5107(.A0 (n_48), .A1 (n_157), .B0
       (LOW_PULSE_COUNTING[7]), .B1 (n_47), .Y (n_159));
  AOI21XL g6804__6260(.A0 (n_60), .A1 (n_155), .B0 (reset_counters), .Y
       (n_158));
  XNOR2X1 g6806__4319(.A (LOW_PULSE_COUNTING[7]), .B (n_145), .Y
       (n_157));
  NOR2XL g6809__8428(.A (n_95), .B (n_152), .Y (n_156));
  OAI211X1 g6810__5526(.A0 (LOW_PULSE_COUNTING[6]), .A1 (n_130), .B0
       (n_48), .C0 (n_145), .Y (n_155));
  NOR2XL g6816__6783(.A (n_95), .B (n_142), .Y (n_154));
  NOR2XL g6817__3680(.A (reset_counters), .B (n_146), .Y (n_153));
  AOI21XL g6818__1617(.A0 (internal_oscillator_clk_cycle_counting[5]),
       .A1 (n_126), .B0 (internal_oscillator_clk_cycle_counting[6]), .Y
       (n_152));
  AOI21XL g6819__2802(.A0 (n_61), .A1 (n_141), .B0 (reset_counters), .Y
       (n_151));
  NOR2XL g6820__1705(.A (reset_counters), .B (n_144), .Y (n_150));
  OAI21XL g6821__5122(.A0 (n_53), .A1 (n_139), .B0 (n_93), .Y (n_149));
  OAI2BB1X1 g6823__8246(.A0N (flag_dv), .A1N (n_26), .B0 (n_2), .Y
       (n_148));
  OAI221X1 g6824__7098(.A0 (n_92), .A1 (n_106), .B0 (n_15), .B1 (n_68),
       .C0 (n_3), .Y (n_147));
  AOI22XL g6825__6131(.A0 (n_50), .A1 (n_137), .B0
       (HIGH_PULSE_COUNTING[4]), .B1 (n_49), .Y (n_146));
  NAND2XL g6829__1881(.A (LOW_PULSE_COUNTING[6]), .B (n_130), .Y
       (n_145));
  AOI22XL g6830__5115(.A0 (n_48), .A1 (n_132), .B0
       (LOW_PULSE_COUNTING[4]), .B1 (n_47), .Y (n_144));
  AOI21XL g6831__7482(.A0 (n_55), .A1 (n_133), .B0 (reset_counters), .Y
       (n_143));
  XNOR2X1 g6833__4733(.A (internal_oscillator_clk_cycle_counting[5]),
       .B (n_126), .Y (n_142));
  OAI211X1 g6834__6161(.A0 (LOW_PULSE_COUNTING[5]), .A1 (n_120), .B0
       (n_48), .C0 (n_140), .Y (n_141));
  INVXL g6835(.A (n_130), .Y (n_140));
  AOI21XL g6836__9315(.A0 (n_129), .A1 (n_131), .B0
       (HIGH_PULSE_COUNTING[0]), .Y (n_139));
  OAI32X1 g6839__9945(.A0 (HIGH_PULSE_COUNTING[3]), .A1 (n_16), .A2
       (n_108), .B0 (n_74), .B1 (n_131), .Y (n_138));
  XNOR2X1 g6840__2883(.A (HIGH_PULSE_COUNTING[4]), .B (n_111), .Y
       (n_137));
  AOI211XL g6841__2346(.A0 (n_11), .A1 (n_87), .B0 (n_95), .C0 (n_126),
       .Y (n_136));
  AOI21XL g6842__1666(.A0 (n_58), .A1 (n_112), .B0 (reset_counters), .Y
       (n_135));
  OAI21XL g6844__7410(.A0 (n_53), .A1 (n_117), .B0 (n_93), .Y (n_134));
  OAI211X1 g6845__6417(.A0 (HIGH_PULSE_COUNTING[3]), .A1 (n_99), .B0
       (n_50), .C0 (n_111), .Y (n_133));
  OAI221X1 g6846__5477(.A0 (LOW_PULSE_COUNTING[4]), .A1 (n_86), .B0
       (n_5), .B1 (n_76), .C0 (n_27), .Y (n_132));
  NAND3BXL g6852__2398(.AN (n_5), .B (LOW_PULSE_COUNTING[3]), .C (n_1),
       .Y (n_129));
  AOI21XL g6853__5107(.A0 (n_56), .A1 (n_100), .B0 (reset_counters), .Y
       (n_128));
  AOI221X1 g6854__6260(.A0 (BIDIR_SHIFTREG_PARALLEL_OUT[13]), .A1
       (n_38), .B0 (n_6), .B1 (n_23), .C0 (n_102), .Y (n_127));
  NAND4BXL g6855__4319(.AN (n_27), .B (HIGH_PULSE_COUNTING[3]), .C
       (n_18), .D (n_91), .Y (n_131));
  AND2X1 g6856__8428(.A (n_120), .B (LOW_PULSE_COUNTING[5]), .Y
       (n_130));
  NOR2XL g6864__5526(.A (n_11), .B (n_87), .Y (n_126));
  INVXL g6867(.A (n_119), .Y (n_125));
  INVXL g6868(.A (n_116), .Y (n_124));
  INVXL g6869(.A (n_115), .Y (n_123));
  INVXL g6870(.A (n_114), .Y (n_122));
  INVXL g6871(.A (n_113), .Y (n_121));
  OAI211X1 g6872__6783(.A0 (internal_oscillator_clk_cycle_counting[3]),
       .A1 (n_54), .B0 (n_87), .C0 (n_96), .Y (n_119));
  AOI221X1 g6873__3680(.A0 (BIDIR_SHIFTREG_PARALLEL_OUT[15]), .A1
       (n_40), .B0 (n_45), .B1 (n_35), .C0 (n_88), .Y (n_118));
  AOI221X1 g6874__1617(.A0 (n_18), .A1 (n_27), .B0
       (HIGH_PULSE_COUNTING[4]), .B1 (LOW_PULSE_COUNTING[4]), .C0
       (n_106), .Y (n_117));
  AOI32X1 g6875__2802(.A0 (BIDIR_SHIFTREG_PARALLEL_OUT[20]), .A1
       (BIDIR_SHIFTREG_PARALLEL_OUT[21]), .A2 (n_98), .B0 (D[2]), .B1
       (n_97), .Y (n_116));
  AOI32X1 g6876__1705(.A0 (BIDIR_SHIFTREG_PARALLEL_OUT[18]), .A1
       (BIDIR_SHIFTREG_PARALLEL_OUT[19]), .A2 (n_98), .B0 (D[3]), .B1
       (n_97), .Y (n_115));
  AOI32X1 g6877__5122(.A0 (BIDIR_SHIFTREG_PARALLEL_OUT[24]), .A1
       (BIDIR_SHIFTREG_PARALLEL_OUT[25]), .A2 (n_98), .B0 (D[0]), .B1
       (n_97), .Y (n_114));
  AOI32X1 g6878__8246(.A0 (BIDIR_SHIFTREG_PARALLEL_OUT[22]), .A1
       (BIDIR_SHIFTREG_PARALLEL_OUT[23]), .A2 (n_98), .B0 (D[1]), .B1
       (n_97), .Y (n_113));
  OAI211X1 g6879__7098(.A0 (LOW_PULSE_COUNTING[3]), .A1 (n_76), .B0
       (n_48), .C0 (n_86), .Y (n_112));
  NOR2XL g6880__6131(.A (n_5), .B (n_86), .Y (n_120));
  NAND2XL g6881__1881(.A (n_63), .B (n_89), .Y (n_110));
  AOI21XL g6882__5115(.A0 (n_62), .A1 (n_79), .B0 (reset_counters), .Y
       (n_109));
  NAND2BXL g6883__7482(.AN (n_92), .B (n_91), .Y (n_108));
  NAND2XL g6884__4733(.A (internal_oscillator_clk_cycle_counting[0]),
       .B (n_96), .Y (n_107));
  NAND2XL g6885__6161(.A (HIGH_PULSE_COUNTING[3]), .B (n_99), .Y
       (n_111));
  OAI32X1 g6888__9315(.A0 (reset), .A1 (current_state[2]), .A2 (n_9),
       .B0 (n_21), .B1 (n_81), .Y (n_105));
  AOI211XL g6889__9945(.A0 (n_12), .A1 (n_29), .B0 (n_54), .C0 (n_95),
       .Y (n_104));
  AO21X1 g6890__2883(.A0 (BIDIR_SHIFTREG_OP_MODE[0]), .A1 (n_82), .B0
       (n_81), .Y (n_103));
  OAI211X1 g6891__2346(.A0 (BIDIR_SHIFTREG_PARALLEL_OUT[6]), .A1
       (n_22), .B0 (n_57), .C0 (n_80), .Y (n_102));
  NOR3BXL g6892__1666(.AN (n_29), .B (n_34), .C (n_95), .Y (n_101));
  OAI211X1 g6894__7410(.A0 (HIGH_PULSE_COUNTING[2]), .A1 (n_30), .B0
       (n_50), .C0 (n_75), .Y (n_100));
  OAI221X1 g6895__6417(.A0 (HIGH_PULSE_COUNTING[3]), .A1
       (LOW_PULSE_COUNTING[3]), .B0 (n_17), .B1 (n_16), .C0 (n_91), .Y
       (n_106));
  INVX1 g6896(.A (n_75), .Y (n_99));
  INVX1 g6897(.A (n_98), .Y (n_97));
  INVX1 g6898(.A (n_95), .Y (n_96));
  NOR2XL g6899__5477(.A (reset_counters), .B (n_78), .Y (n_94));
  NOR2BX1 g6902__2398(.AN (flag_dv), .B (n_82), .Y (n_98));
  NOR3BXL g6903__5107(.AN (internal_oscillator_clk_cycle_counting[5]),
       .B (n_11), .C (n_71), .Y (n_95));
  AOI21XL g6905__6260(.A0 (n_59), .A1 (n_72), .B0 (reset_counters), .Y
       (n_90));
  OAI21XL g6906__4319(.A0 (dv), .A1 (n_51), .B0 (flag_dv), .Y (n_89));
  NAND4XL g6907__8428(.A (n_42), .B (n_41), .C (n_66), .D (n_67), .Y
       (n_88));
  OA22X1 g6908__5526(.A0 (n_49), .A1 (n_77), .B0 (n_32), .B1 (n_53), .Y
       (n_93));
  NAND3BXL g6909__6783(.AN (n_74), .B (HIGH_PULSE_COUNTING[4]), .C
       (n_5), .Y (n_92));
  NOR4X1 g6910__3680(.A (LOW_PULSE_COUNTING[6]), .B
       (LOW_PULSE_COUNTING[5]), .C (HIGH_PULSE_COUNTING[0]), .D (n_64),
       .Y (n_91));
  NOR2XL g6911__1617(.A (reset_counters), .B (n_70), .Y (n_85));
  NOR2XL g6912__2802(.A (n_14), .B (n_51), .Y (n_84));
  NOR2XL g6913__1705(.A (reset_counters), .B (n_73), .Y (n_83));
  NAND2XL g6914__5122(.A (internal_oscillator_clk_cycle_counting[3]),
       .B (n_54), .Y (n_87));
  NAND2XL g6915__8246(.A (LOW_PULSE_COUNTING[3]), .B (n_76), .Y (n_86));
  AOI221X1 g6916__7098(.A0 (BIDIR_SHIFTREG_PARALLEL_OUT[17]), .A1
       (n_43), .B0 (BIDIR_SHIFTREG_PARALLEL_OUT[11]), .B1 (n_36), .C0
       (n_65), .Y (n_80));
  OAI211X1 g6917__6131(.A0 (LOW_PULSE_COUNTING[2]), .A1 (n_28), .B0
       (n_48), .C0 (n_52), .Y (n_79));
  AOI22XL g6918__1881(.A0 (n_48), .A1 (n_44), .B0
       (LOW_PULSE_COUNTING[1]), .B1 (n_47), .Y (n_78));
  NAND2XL g6919__5115(.A (n_4), .B (n_51), .Y (n_82));
  AND2X1 g6920__7482(.A (n_68), .B (n_4), .Y (n_81));
  INVXL g6921(.A (n_51), .Y (n_77));
  INVX1 g6922(.A (n_52), .Y (n_76));
  NAND2XL g6925__4733(.A (HIGH_PULSE_COUNTING[2]), .B (n_30), .Y
       (n_75));
  NAND2BXL g6926__6161(.AN (n_53), .B (n_32), .Y (n_74));
  XNOR2X1 g6927__9315(.A (HIGH_PULSE_COUNTING[0]), .B (n_50), .Y
       (n_73));
  OAI211X1 g6928__9945(.A0 (HIGH_PULSE_COUNTING[1]), .A1
       (HIGH_PULSE_COUNTING[0]), .B0 (n_50), .C0 (n_69), .Y (n_72));
  NAND4BXL g6929__2883(.AN (n_34), .B
       (internal_oscillator_clk_cycle_counting[6]), .C
       (internal_oscillator_clk_cycle_counting[3]), .D
       (internal_oscillator_clk_cycle_counting[2]), .Y (n_71));
  XNOR2X1 g6930__2346(.A (LOW_PULSE_COUNTING[0]), .B (n_48), .Y (n_70));
  INVXL g6931(.A (n_30), .Y (n_69));
  NAND2XL g6951__1666(.A (BIDIR_SHIFTREG_PARALLEL_OUT[5]), .B (n_39),
       .Y (n_67));
  OAI211X1 g6952__7410(.A0 (INTERPRETED_ADDR[3]), .A1
       (BIDIR_SHIFTREG_PARALLEL_OUT[9]), .B0 (n_24), .C0 (n_46), .Y
       (n_66));
  OAI33X1 g6953__6417(.A0 (n_13), .A1
       (BIDIR_SHIFTREG_PARALLEL_OUT[17]), .A2
       (BIDIR_SHIFTREG_PARALLEL_OUT[16]), .B0
       (BIDIR_SHIFTREG_PARALLEL_OUT[11]), .B1 (n_20), .B2
       (BIDIR_SHIFTREG_PARALLEL_OUT[10]), .Y (n_65));
  NAND3BXL g6954__5477(.AN (HIGH_PULSE_COUNTING[2]), .B
       (LOW_PULSE_COUNTING[2]), .C (n_33), .Y (n_64));
  NAND3BXL g6955__2398(.AN (n_26), .B (dv), .C (current_state[2]), .Y
       (n_63));
  NAND2XL g6956__5107(.A (LOW_PULSE_COUNTING[2]), .B (n_47), .Y (n_62));
  NAND2XL g6957__6260(.A (LOW_PULSE_COUNTING[5]), .B (n_47), .Y (n_61));
  NAND2XL g6958__4319(.A (LOW_PULSE_COUNTING[6]), .B (n_47), .Y (n_60));
  NAND2XL g6959__8428(.A (HIGH_PULSE_COUNTING[1]), .B (n_49), .Y
       (n_59));
  NAND2XL g6960__5526(.A (LOW_PULSE_COUNTING[3]), .B (n_47), .Y (n_58));
  NAND2XL g6961__6783(.A (BIDIR_SHIFTREG_PARALLEL_OUT[7]), .B (n_37),
       .Y (n_57));
  NAND2XL g6962__3680(.A (HIGH_PULSE_COUNTING[2]), .B (n_49), .Y
       (n_56));
  NAND2XL g6963__1617(.A (HIGH_PULSE_COUNTING[3]), .B (n_49), .Y
       (n_55));
  AOI21XL g6964__2802(.A0 (current_state[2]), .A1 (n_26), .B0 (n_51),
       .Y (n_68));
  INVX1 g6970(.A (n_50), .Y (n_49));
  INVX1 g6971(.A (n_48), .Y (n_47));
  NAND3BXL g6972__1705(.AN (BIDIR_SHIFTREG_PARALLEL_OUT[8]), .B
       (F_BIT_LOCATOR[3]), .C (BIDIR_SHIFTREG_PARALLEL_OUT[9]), .Y
       (n_46));
  NAND3BXL g6973__5122(.AN (BIDIR_SHIFTREG_PARALLEL_OUT[2]), .B
       (F_BIT_LOCATOR[0]), .C (BIDIR_SHIFTREG_PARALLEL_OUT[3]), .Y
       (n_45));
  OAI21XL g6974__8246(.A0 (LOW_PULSE_COUNTING[1]), .A1 (n_7), .B0
       (n_31), .Y (n_44));
  NOR2XL g6975__7098(.A (n_12), .B (n_29), .Y (n_54));
  NAND3XL g6976__6131(.A (current_state[0]), .B (current_state[2]), .C
       (n_10), .Y (n_53));
  NAND2XL g6977__1881(.A (LOW_PULSE_COUNTING[2]), .B (n_28), .Y (n_52));
  NOR2XL g6978__5115(.A (current_state[2]), .B (n_26), .Y (n_51));
  AND2X1 g6979__7482(.A (PREVIOUS_cod_i), .B (cod_i), .Y (n_50));
  NOR2BX1 g6980__4733(.AN (PREVIOUS_cod_i), .B (cod_i), .Y (n_48));
  MXI2XL g6981__6161(.A (F_BIT_LOCATOR[7]), .B (INTERPRETED_ADDR[7]),
       .S0 (BIDIR_SHIFTREG_PARALLEL_OUT[16]), .Y (n_43));
  NAND3BXL g6982__9315(.AN (BIDIR_SHIFTREG_PARALLEL_OUT[15]), .B
       (INTERPRETED_ADDR[6]), .C (n_8), .Y (n_42));
  NAND3BXL g6983__9945(.AN (BIDIR_SHIFTREG_PARALLEL_OUT[5]), .B
       (INTERPRETED_ADDR[1]), .C (n_19), .Y (n_41));
  MXI2XL g6984__2883(.A (F_BIT_LOCATOR[6]), .B (INTERPRETED_ADDR[6]),
       .S0 (BIDIR_SHIFTREG_PARALLEL_OUT[14]), .Y (n_40));
  MXI2XL g6985__2346(.A (F_BIT_LOCATOR[1]), .B (INTERPRETED_ADDR[1]),
       .S0 (BIDIR_SHIFTREG_PARALLEL_OUT[4]), .Y (n_39));
  OAI22XL g6986__1666(.A0 (F_BIT_LOCATOR[5]), .A1
       (BIDIR_SHIFTREG_PARALLEL_OUT[12]), .B0 (INTERPRETED_ADDR[5]),
       .B1 (n_6), .Y (n_38));
  MXI2XL g6987__7410(.A (F_BIT_LOCATOR[2]), .B (INTERPRETED_ADDR[2]),
       .S0 (BIDIR_SHIFTREG_PARALLEL_OUT[6]), .Y (n_37));
  MXI2XL g6988__6417(.A (F_BIT_LOCATOR[4]), .B (INTERPRETED_ADDR[4]),
       .S0 (BIDIR_SHIFTREG_PARALLEL_OUT[10]), .Y (n_36));
  AOI21XL g6989__5477(.A0 (INTERPRETED_ADDR[0]), .A1
       (BIDIR_SHIFTREG_PARALLEL_OUT[2]), .B0 (n_25), .Y (n_35));
  INVXL g6990(.A (n_31), .Y (n_32));
  NOR2XL g6992__2398(.A (internal_oscillator_clk_cycle_counting[1]), .B
       (internal_oscillator_clk_cycle_counting[0]), .Y (n_34));
  NOR2XL g6993__5107(.A (HIGH_PULSE_COUNTING[1]), .B
       (LOW_PULSE_COUNTING[7]), .Y (n_33));
  NAND2XL g6994__6260(.A (LOW_PULSE_COUNTING[1]), .B (n_7), .Y (n_31));
  AND2X1 g6995__4319(.A (HIGH_PULSE_COUNTING[0]), .B
       (HIGH_PULSE_COUNTING[1]), .Y (n_30));
  NAND2XL g6996__8428(.A (internal_oscillator_clk_cycle_counting[1]),
       .B (internal_oscillator_clk_cycle_counting[0]), .Y (n_29));
  NOR2XL g6998__5526(.A (INTERPRETED_ADDR[0]), .B
       (BIDIR_SHIFTREG_PARALLEL_OUT[3]), .Y (n_25));
  NAND2XL g6999__6783(.A (INTERPRETED_ADDR[3]), .B
       (BIDIR_SHIFTREG_PARALLEL_OUT[8]), .Y (n_24));
  NOR2BX1 g7000__3680(.AN (INTERPRETED_ADDR[5]), .B
       (BIDIR_SHIFTREG_PARALLEL_OUT[13]), .Y (n_23));
  NAND2BXL g7001__1617(.AN (BIDIR_SHIFTREG_PARALLEL_OUT[7]), .B
       (INTERPRETED_ADDR[2]), .Y (n_22));
  AND2X1 g7002__2802(.A (LOW_PULSE_COUNTING[1]), .B
       (LOW_PULSE_COUNTING[0]), .Y (n_28));
  NAND2XL g7003__1705(.A (LOW_PULSE_COUNTING[4]), .B (n_16), .Y (n_27));
  NAND2XL g7004__5122(.A (n_9), .B (n_10), .Y (n_26));
  INVXL g7005(.A (BIDIR_SHIFTREG_PT2272_BIT_IN[1]), .Y (n_21));
  INVXL g7006(.A (INTERPRETED_ADDR[4]), .Y (n_20));
  INVXL g7007(.A (BIDIR_SHIFTREG_PARALLEL_OUT[4]), .Y (n_19));
  INVXL g7012(.A (BIDIR_SHIFTREG_RESET), .Y (n_14));
  INVXL g7013(.A (INTERPRETED_ADDR[7]), .Y (n_13));
  INVXL g7019(.A (BIDIR_SHIFTREG_PARALLEL_OUT[14]), .Y (n_8));
  INVX1 g7022(.A (BIDIR_SHIFTREG_PARALLEL_OUT[12]), .Y (n_6));
  INVXL g7024(.A (reset), .Y (n_4));
  NAND2BX1 g2__8246(.AN (n_74), .B (n_139), .Y (n_3));
  NAND4BXL g7025__7098(.AN (n_26), .B (current_state[2]), .C (n_118),
       .D (n_127), .Y (n_2));
  NOR4BX1 g7026__6131(.AN (LOW_PULSE_COUNTING[6]), .B
       (HIGH_PULSE_COUNTING[4]), .C (HIGH_PULSE_COUNTING[3]), .D (n_0),
       .Y (n_1));
  NAND4BXL g7027__1881(.AN (LOW_PULSE_COUNTING[2]), .B
       (LOW_PULSE_COUNTING[5]), .C (HIGH_PULSE_COUNTING[2]), .D (n_33),
       .Y (n_0));
  DFFRX1 \HIGH_PULSE_COUNTING_reg[4] (.RN (n_4), .CK (osc_clk), .D
       (n_153), .Q (HIGH_PULSE_COUNTING[4]), .QN (n_18));
  DFFRX1 \HIGH_PULSE_COUNTING_reg[3] (.RN (n_4), .CK (osc_clk), .D
       (n_143), .Q (HIGH_PULSE_COUNTING[3]), .QN (n_17));
  DFFRX1 \LOW_PULSE_COUNTING_reg[3] (.RN (n_4), .CK (osc_clk), .D
       (n_135), .Q (LOW_PULSE_COUNTING[3]), .QN (n_16));
  DFFRX1 reset_counters_reg(.RN (n_4), .CK (osc_clk), .D (n_147), .Q
       (reset_counters), .QN (n_15));
  DFFRX1 \internal_oscillator_clk_cycle_counting_reg[2] (.RN (n_4), .CK
       (clk), .D (n_104), .Q
       (internal_oscillator_clk_cycle_counting[2]), .QN (n_12));
  DFFRX1 \internal_oscillator_clk_cycle_counting_reg[4] (.RN (n_4), .CK
       (clk), .D (n_136), .Q
       (internal_oscillator_clk_cycle_counting[4]), .QN (n_11));
  DFFRX1 \current_state_reg[1] (.RN (n_4), .CK (osc_clk), .D (n_138),
       .Q (current_state[1]), .QN (n_10));
  DFFRX1 \current_state_reg[0] (.RN (n_4), .CK (osc_clk), .D (n_149),
       .Q (current_state[0]), .QN (n_9));
  DFFRX1 \LOW_PULSE_COUNTING_reg[0] (.RN (n_4), .CK (osc_clk), .D
       (n_85), .Q (LOW_PULSE_COUNTING[0]), .QN (n_7));
  DFFRX1 \LOW_PULSE_COUNTING_reg[4] (.RN (n_4), .CK (osc_clk), .D
       (n_150), .Q (LOW_PULSE_COUNTING[4]), .QN (n_5));
endmodule

