//***************************************************************************//
//                           VERILOG MAINSIM FILE                            //
// Modus(TM) DFT Software Solution, Version 22.12-s028_1, built Jul 11 2023  //
//***************************************************************************//
//                                                                           //
//  FILE CREATED..............March 27, 2025 at 09:45:09                     //
//                                                                           //
//  PROJECT NAME..............test_scripts                                   //
//                                                                           //
//  TESTMODE..................FULLSCAN                                       //
//                                                                           //
//  INEXPERIMENT..............multiplier32FP_atpg                            //
//                                                                           //
//  TDR.......................dummy.tdr                                      //
//                                                                           //
//  TEST PERIOD...............80.000   TEST TIME UNITS...........ns          //
//  TEST PULSE WIDTH..........8.000                                          //
//  TEST STROBE OFFSET........72.000   TEST STROBE TYPE..........edge        //
//  TEST BIDI OFFSET..........0.000                                          //
//  TEST PI OFFSET............0.000    X VALUE...................X           //
//                                                                           //
//  SCAN FORMAT...............parallel SCAN OVERLAP..............yes         //
//  SCAN PERIOD...............80.000   SCAN TIME UNITS...........ns          //
//  SCAN PULSE WIDTH..........8.000                                          //
//  SCAN STROBE OFFSET........8.000    SCAN STROBE TYPE..........edge        //
//  SCAN BIDI OFFSET..........0.000                                          //
//  SCAN PI OFFSET............0.000    X VALUE...................X           //
//                                                                           //
//                                                                           //
//   Individually set PIs                                                    //
//  "clk" (PI # 66)                                                          //
//  TEST OFFSET...............8.000    PULSE WIDTH...............8.000       //
//  SCAN OFFSET...............16.000   PULSE WIDTH...............8.000       //
//                                                                           //
//  "rst_n" (PI # 67)                                                        //
//  TEST OFFSET...............8.000    PULSE WIDTH...............8.000       //
//  SCAN OFFSET...............0.000                                          //
//                                                                           //
//  Active TESTMODEs TM = 1 ..FULLSCAN                                       //
//                                                                           //
//***************************************************************************//

// Command Line: write_vectors -WORKDIR /home/cinovador/Documents/course_files/physical_synthesis/synthesis_dft_atpg/backend/synthesis/work/test_scripts -TESTMODE FULLSCAN -INEXPERIMENT multiplier32FP_atpg -STDOUT summary -language verilog -scanformat parallel

  `timescale 1 ns / 1 ps

  module test_scripts_FULLSCAN_multiplier32FP_atpg ;

//***************************************************************************//
//                DEFINE VARIABLES FOR ALL PRIMARY I/O PORTS                 //
//***************************************************************************//

  reg [1:69] stim_PIs;   
  reg [1:69] part_PIs;   

  reg [1:69] stim_CIs;   

  reg [1:38] meas_POs;   

  reg [1:38] scan_POs;   
  wire [1:38] part_POs;   

//***************************************************************************//
//                   DEFINE VARIABLES FOR ALL SHIFT CHAINS                   //
//***************************************************************************//

  reg [1:40] stim_CR_1;   

  reg [1:40] meas_OR_1;   

  reg [1:40] part_S_CR_1_TM_1;   

  wire [1:40] part_M_OR_1_TM_1;   


//***************************************************************************//
//                             OTHER DEFINITIONS                             //
//***************************************************************************//

  integer  CYCLE, SCANCYCLE, SERIALCYCLE, PInum, POnum, ORnum, MODENUM, EXPNUM, SCANOPNUM, SEQNUM, TASKNUM, START, NUM_SHIFTS, MultiShift, maxMultiShifts, MultiShiftsLeft, forcePointStart, forcePoint, SCANNUM, FREQNUM ; 
  integer  CMD, DATAID, SAVEID, TID, num_files, rc_read, repeat_depth, repeat_heart, repeat_num, MAX, FAILSETID, DIAG_DATAID; 
  integer  test_num, test_num_prev, failed_test_num, num_tests, num_failed_tests, total_num_tests, total_num_failed_tests, total_cycles, scan_num, overlap; 
  integer  num_repeats [1:15]; 
  reg      [1:8185] name_POs [1:38]; 
  reg      [130:0] good_compares, miscompares, miscompare_limit, total_good_compares, total_miscompares, measure_current; 
  reg      [63:0] start_of_repeat [1:15]; 
  reg      [63:0] start_of_current_line, fseek_offset; 
  reg      [130:0] line_number, save_line_number; 
  reg      count_cycles, sim_trace, sim_heart, sim_range, sim_range_measure, failset, global_term, sim_debug, sim_more_debug, diag_debug; 
  reg      [1:800] PATTERN, pattern, TESTFILE, INITFILE, SOD, EOD, eventID, DIAG_DEBUG_FILE; 
  reg      [1:8184] DATAFILE, SAVEFILE, COMMENT, FAILSET; 
  reg      [1:4096] PROCESSNAME; 

//***************************************************************************//
//        INSTANTIATE THE STRUCTURE AND CONNECT TO VERILOG VARIABLES         //
//***************************************************************************//

  multiplier32FP
    multiplier32FP_inst (
      .clk         ( part_PIs[66] ),      // pinName = clk;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      .rst_n       ( part_PIs[67] ),      // pinName = rst_n;  tf = +SC  ; testOffset = 8.000000;  scanOffset = 0.000000;  
      .a_i         ({part_PIs[26]  ,      // pinName = a_i[31]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[25]  ,      // pinName = a_i[30]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[23]  ,      // pinName = a_i[29]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[22]  ,      // pinName = a_i[28]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[21]  ,      // pinName = a_i[27]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[20]  ,      // pinName = a_i[26]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[19]  ,      // pinName = a_i[25]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[18]  ,      // pinName = a_i[24]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[17]  ,      // pinName = a_i[23]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[16]  ,      // pinName = a_i[22]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[15]  ,      // pinName = a_i[21]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[14]  ,      // pinName = a_i[20]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[12]  ,      // pinName = a_i[19]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[11]  ,      // pinName = a_i[18]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[10]  ,      // pinName = a_i[17]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[09]  ,      // pinName = a_i[16]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[08]  ,      // pinName = a_i[15]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[07]  ,      // pinName = a_i[14]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[06]  ,      // pinName = a_i[13]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[05]  ,      // pinName = a_i[12]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[04]  ,      // pinName = a_i[11]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[03]  ,      // pinName = a_i[10]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[33]  ,      // pinName = a_i[9]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[32]  ,      // pinName = a_i[8]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[31]  ,      // pinName = a_i[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[30]  ,      // pinName = a_i[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[29]  ,      // pinName = a_i[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[28]  ,      // pinName = a_i[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[27]  ,      // pinName = a_i[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[24]  ,      // pinName = a_i[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[13]  ,      // pinName = a_i[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[02]}),      // pinName = a_i[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      .b_i         ({part_PIs[58]  ,      // pinName = b_i[31]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[57]  ,      // pinName = b_i[30]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[55]  ,      // pinName = b_i[29]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[54]  ,      // pinName = b_i[28]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[53]  ,      // pinName = b_i[27]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[52]  ,      // pinName = b_i[26]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[51]  ,      // pinName = b_i[25]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[50]  ,      // pinName = b_i[24]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[49]  ,      // pinName = b_i[23]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[48]  ,      // pinName = b_i[22]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[47]  ,      // pinName = b_i[21]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[46]  ,      // pinName = b_i[20]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[44]  ,      // pinName = b_i[19]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[43]  ,      // pinName = b_i[18]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[42]  ,      // pinName = b_i[17]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[41]  ,      // pinName = b_i[16]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[40]  ,      // pinName = b_i[15]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[39]  ,      // pinName = b_i[14]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[38]  ,      // pinName = b_i[13]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[37]  ,      // pinName = b_i[12]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[36]  ,      // pinName = b_i[11]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[35]  ,      // pinName = b_i[10]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[65]  ,      // pinName = b_i[9]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[64]  ,      // pinName = b_i[8]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[63]  ,      // pinName = b_i[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[62]  ,      // pinName = b_i[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[61]  ,      // pinName = b_i[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[60]  ,      // pinName = b_i[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[59]  ,      // pinName = b_i[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[56]  ,      // pinName = b_i[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[45]  ,      // pinName = b_i[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
                     part_PIs[34]}),      // pinName = b_i[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      .start_i     ( part_PIs[69] ),      // pinName = start_i; testOffset = 0.000000;  scanOffset = 0.000000;  
      .done_o      ( part_POs[01] ),      // pinName = done_o; 
      .nan_o       ( part_POs[03] ),      // pinName = nan_o; 
      .inifinit_o  ( part_POs[02] ),      // pinName = inifinit_o; 
      .overflow_o  ( part_POs[04] ),      // pinName = overflow_o; 
      .underflow_o ( part_POs[38] ),      // pinName = underflow_o; 
      .product_o   ({part_POs[29]  ,      // pinName = product_o[31]; 
                     part_POs[28]  ,      // pinName = product_o[30]; 
                     part_POs[26]  ,      // pinName = product_o[29]; 
                     part_POs[25]  ,      // pinName = product_o[28]; 
                     part_POs[24]  ,      // pinName = product_o[27]; 
                     part_POs[23]  ,      // pinName = product_o[26]; 
                     part_POs[22]  ,      // pinName = product_o[25]; 
                     part_POs[21]  ,      // pinName = product_o[24]; 
                     part_POs[20]  ,      // pinName = product_o[23]; 
                     part_POs[19]  ,      // pinName = product_o[22]; 
                     part_POs[18]  ,      // pinName = product_o[21]; 
                     part_POs[17]  ,      // pinName = product_o[20]; 
                     part_POs[15]  ,      // pinName = product_o[19]; 
                     part_POs[14]  ,      // pinName = product_o[18]; 
                     part_POs[13]  ,      // pinName = product_o[17]; 
                     part_POs[12]  ,      // pinName = product_o[16]; 
                     part_POs[11]  ,      // pinName = product_o[15]; 
                     part_POs[10]  ,      // pinName = product_o[14]; 
                     part_POs[09]  ,      // pinName = product_o[13]; 
                     part_POs[08]  ,      // pinName = product_o[12]; 
                     part_POs[07]  ,      // pinName = product_o[11]; 
                     part_POs[06]  ,      // pinName = product_o[10]; 
                     part_POs[36]  ,      // pinName = product_o[9]; 
                     part_POs[35]  ,      // pinName = product_o[8]; 
                     part_POs[34]  ,      // pinName = product_o[7]; 
                     part_POs[33]  ,      // pinName = product_o[6]; 
                     part_POs[32]  ,      // pinName = product_o[5]; 
                     part_POs[31]  ,      // pinName = product_o[4]; 
                     part_POs[30]  ,      // pinName = product_o[3]; 
                     part_POs[27]  ,      // pinName = product_o[2]; 
                     part_POs[16]  ,      // pinName = product_o[1]; 
                     part_POs[05]}),      // pinName = product_o[0]; 
      .SE          ( part_PIs[01] ),      // pinName = SE;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .scan_in     ( part_PIs[68] ),      // pinName = scan_in;  tf =  SI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .scan_out    ( part_POs[37] )     // pinName = scan_out;  tf =  SO  ; 
      );

//***************************************************************************//
//                        MAKE SOME OTHER CONNECTIONS                        //
//***************************************************************************//

  assign ( weak0, weak1 ) // Termination 
    part_POs [1] = global_term,     // pinName = done_o; 
    part_POs [2] = global_term,     // pinName = inifinit_o; 
    part_POs [3] = global_term,     // pinName = nan_o; 
    part_POs [4] = global_term,     // pinName = overflow_o; 
    part_POs [5] = global_term,     // pinName = product_o[0]; 
    part_POs [6] = global_term,     // pinName = product_o[10]; 
    part_POs [7] = global_term,     // pinName = product_o[11]; 
    part_POs [8] = global_term,     // pinName = product_o[12]; 
    part_POs [9] = global_term,     // pinName = product_o[13]; 
    part_POs [10] = global_term,     // pinName = product_o[14]; 
    part_POs [11] = global_term,     // pinName = product_o[15]; 
    part_POs [12] = global_term,     // pinName = product_o[16]; 
    part_POs [13] = global_term,     // pinName = product_o[17]; 
    part_POs [14] = global_term,     // pinName = product_o[18]; 
    part_POs [15] = global_term,     // pinName = product_o[19]; 
    part_POs [16] = global_term,     // pinName = product_o[1]; 
    part_POs [17] = global_term,     // pinName = product_o[20]; 
    part_POs [18] = global_term,     // pinName = product_o[21]; 
    part_POs [19] = global_term,     // pinName = product_o[22]; 
    part_POs [20] = global_term,     // pinName = product_o[23]; 
    part_POs [21] = global_term,     // pinName = product_o[24]; 
    part_POs [22] = global_term,     // pinName = product_o[25]; 
    part_POs [23] = global_term,     // pinName = product_o[26]; 
    part_POs [24] = global_term,     // pinName = product_o[27]; 
    part_POs [25] = global_term,     // pinName = product_o[28]; 
    part_POs [26] = global_term,     // pinName = product_o[29]; 
    part_POs [27] = global_term,     // pinName = product_o[2]; 
    part_POs [28] = global_term,     // pinName = product_o[30]; 
    part_POs [29] = global_term,     // pinName = product_o[31]; 
    part_POs [30] = global_term,     // pinName = product_o[3]; 
    part_POs [31] = global_term,     // pinName = product_o[4]; 
    part_POs [32] = global_term,     // pinName = product_o[5]; 
    part_POs [33] = global_term,     // pinName = product_o[6]; 
    part_POs [34] = global_term,     // pinName = product_o[7]; 
    part_POs [35] = global_term,     // pinName = product_o[8]; 
    part_POs [36] = global_term,     // pinName = product_o[9]; 
    part_POs [37] = global_term,     // pinName = scan_out;  tf =  SO  ; 
    part_POs [38] = global_term;      // pinName = underflow_o; 


  assign ( supply0, supply1 ) // CR = 1 
    multiplier32FP_inst.scan_in = part_S_CR_1_TM_1 [40] ,   // CR = 1;  pos = 1;  Pin Index = 67;  Pin Name = scan_in;  pinInvFromLatch = no;  Latch Index = 22;  Latch Name = \current_state_reg[0].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\current_state_reg[1] .SI = part_S_CR_1_TM_1 [39] ,   // CR = 1;  pos = 2;  Pin Index = 187;  Pin Name = \current_state_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 48;  Latch Name = \current_state_reg[1].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\current_state_reg[2] .SI = part_S_CR_1_TM_1 [38] ,   // CR = 1;  pos = 3;  Pin Index = 263;  Pin Name = \current_state_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 74;  Latch Name = \current_state_reg[2].__iNsT6.dff_primitive;   
    multiplier32FP_inst.done_o_reg.SI = part_S_CR_1_TM_1 [37] ,   // CR = 1;  pos = 4;  Pin Index = 3530;  Pin Name = done_o_reg.SI;  pinInvFromLatch = no;  Latch Index = 1229;  Latch Name = done_o_reg.__iNsT6.dff_primitive;   
    multiplier32FP_inst.inifinit_o_reg.SI = part_S_CR_1_TM_1 [36] ,   // CR = 1;  pos = 5;  Pin Index = 5807;  Pin Name = inifinit_o_reg.SI;  pinInvFromLatch = no;  Latch Index = 1965;  Latch Name = inifinit_o_reg.__iNsT6.dff_primitive;   
    multiplier32FP_inst.nan_o_reg.SI = part_S_CR_1_TM_1 [35] ,   // CR = 1;  pos = 6;  Pin Index = 20457;  Pin Name = nan_o_reg.SI;  pinInvFromLatch = no;  Latch Index = 6513;  Latch Name = nan_o_reg.__iNsT6.dff_primitive;   
    multiplier32FP_inst.overflow_o_reg.SI = part_S_CR_1_TM_1 [34] ,   // CR = 1;  pos = 7;  Pin Index = 20533;  Pin Name = overflow_o_reg.SI;  pinInvFromLatch = no;  Latch Index = 6539;  Latch Name = overflow_o_reg.__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[0] .SI = part_S_CR_1_TM_1 [33] ,   // CR = 1;  pos = 8;  Pin Index = 1098;  Pin Name = \product_o_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 397;  Latch Name = \product_o_reg[0].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[1] .SI = part_S_CR_1_TM_1 [32] ,   // CR = 1;  pos = 9;  Pin Index = 1934;  Pin Name = \product_o_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 683;  Latch Name = \product_o_reg[1].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[2] .SI = part_S_CR_1_TM_1 [31] ,   // CR = 1;  pos = 10;  Pin Index = 2770;  Pin Name = \product_o_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 969;  Latch Name = \product_o_reg[2].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[3] .SI = part_S_CR_1_TM_1 [30] ,   // CR = 1;  pos = 11;  Pin Index = 2998;  Pin Name = \product_o_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 1047;  Latch Name = \product_o_reg[3].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[4] .SI = part_S_CR_1_TM_1 [29] ,   // CR = 1;  pos = 12;  Pin Index = 3074;  Pin Name = \product_o_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 1073;  Latch Name = \product_o_reg[4].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[5] .SI = part_S_CR_1_TM_1 [28] ,   // CR = 1;  pos = 13;  Pin Index = 3150;  Pin Name = \product_o_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 1099;  Latch Name = \product_o_reg[5].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[6] .SI = part_S_CR_1_TM_1 [27] ,   // CR = 1;  pos = 14;  Pin Index = 3226;  Pin Name = \product_o_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 1125;  Latch Name = \product_o_reg[6].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[7] .SI = part_S_CR_1_TM_1 [26] ,   // CR = 1;  pos = 15;  Pin Index = 3302;  Pin Name = \product_o_reg[7].SI;  pinInvFromLatch = no;  Latch Index = 1151;  Latch Name = \product_o_reg[7].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[8] .SI = part_S_CR_1_TM_1 [25] ,   // CR = 1;  pos = 16;  Pin Index = 3378;  Pin Name = \product_o_reg[8].SI;  pinInvFromLatch = no;  Latch Index = 1177;  Latch Name = \product_o_reg[8].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[9] .SI = part_S_CR_1_TM_1 [24] ,   // CR = 1;  pos = 17;  Pin Index = 3454;  Pin Name = \product_o_reg[9].SI;  pinInvFromLatch = no;  Latch Index = 1203;  Latch Name = \product_o_reg[9].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[10] .SI = part_S_CR_1_TM_1 [23] ,   // CR = 1;  pos = 18;  Pin Index = 1174;  Pin Name = \product_o_reg[10].SI;  pinInvFromLatch = no;  Latch Index = 423;  Latch Name = \product_o_reg[10].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[11] .SI = part_S_CR_1_TM_1 [22] ,   // CR = 1;  pos = 19;  Pin Index = 1250;  Pin Name = \product_o_reg[11].SI;  pinInvFromLatch = no;  Latch Index = 449;  Latch Name = \product_o_reg[11].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[12] .SI = part_S_CR_1_TM_1 [21] ,   // CR = 1;  pos = 20;  Pin Index = 1326;  Pin Name = \product_o_reg[12].SI;  pinInvFromLatch = no;  Latch Index = 475;  Latch Name = \product_o_reg[12].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[13] .SI = part_S_CR_1_TM_1 [20] ,   // CR = 1;  pos = 21;  Pin Index = 1402;  Pin Name = \product_o_reg[13].SI;  pinInvFromLatch = no;  Latch Index = 501;  Latch Name = \product_o_reg[13].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[14] .SI = part_S_CR_1_TM_1 [19] ,   // CR = 1;  pos = 22;  Pin Index = 1478;  Pin Name = \product_o_reg[14].SI;  pinInvFromLatch = no;  Latch Index = 527;  Latch Name = \product_o_reg[14].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[15] .SI = part_S_CR_1_TM_1 [18] ,   // CR = 1;  pos = 23;  Pin Index = 1554;  Pin Name = \product_o_reg[15].SI;  pinInvFromLatch = no;  Latch Index = 553;  Latch Name = \product_o_reg[15].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[16] .SI = part_S_CR_1_TM_1 [17] ,   // CR = 1;  pos = 24;  Pin Index = 1630;  Pin Name = \product_o_reg[16].SI;  pinInvFromLatch = no;  Latch Index = 579;  Latch Name = \product_o_reg[16].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[17] .SI = part_S_CR_1_TM_1 [16] ,   // CR = 1;  pos = 25;  Pin Index = 1706;  Pin Name = \product_o_reg[17].SI;  pinInvFromLatch = no;  Latch Index = 605;  Latch Name = \product_o_reg[17].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[18] .SI = part_S_CR_1_TM_1 [15] ,   // CR = 1;  pos = 26;  Pin Index = 1782;  Pin Name = \product_o_reg[18].SI;  pinInvFromLatch = no;  Latch Index = 631;  Latch Name = \product_o_reg[18].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[19] .SI = part_S_CR_1_TM_1 [14] ,   // CR = 1;  pos = 27;  Pin Index = 1858;  Pin Name = \product_o_reg[19].SI;  pinInvFromLatch = no;  Latch Index = 657;  Latch Name = \product_o_reg[19].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[20] .SI = part_S_CR_1_TM_1 [13] ,   // CR = 1;  pos = 28;  Pin Index = 2010;  Pin Name = \product_o_reg[20].SI;  pinInvFromLatch = no;  Latch Index = 709;  Latch Name = \product_o_reg[20].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[21] .SI = part_S_CR_1_TM_1 [12] ,   // CR = 1;  pos = 29;  Pin Index = 2086;  Pin Name = \product_o_reg[21].SI;  pinInvFromLatch = no;  Latch Index = 735;  Latch Name = \product_o_reg[21].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[22] .SI = part_S_CR_1_TM_1 [11] ,   // CR = 1;  pos = 30;  Pin Index = 2162;  Pin Name = \product_o_reg[22].SI;  pinInvFromLatch = no;  Latch Index = 761;  Latch Name = \product_o_reg[22].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[23] .SI = part_S_CR_1_TM_1 [10] ,   // CR = 1;  pos = 31;  Pin Index = 2238;  Pin Name = \product_o_reg[23].SI;  pinInvFromLatch = no;  Latch Index = 787;  Latch Name = \product_o_reg[23].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[24] .SI = part_S_CR_1_TM_1 [9] ,   // CR = 1;  pos = 32;  Pin Index = 2314;  Pin Name = \product_o_reg[24].SI;  pinInvFromLatch = no;  Latch Index = 813;  Latch Name = \product_o_reg[24].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[25] .SI = part_S_CR_1_TM_1 [8] ,   // CR = 1;  pos = 33;  Pin Index = 2390;  Pin Name = \product_o_reg[25].SI;  pinInvFromLatch = no;  Latch Index = 839;  Latch Name = \product_o_reg[25].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[26] .SI = part_S_CR_1_TM_1 [7] ,   // CR = 1;  pos = 34;  Pin Index = 2466;  Pin Name = \product_o_reg[26].SI;  pinInvFromLatch = no;  Latch Index = 865;  Latch Name = \product_o_reg[26].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[27] .SI = part_S_CR_1_TM_1 [6] ,   // CR = 1;  pos = 35;  Pin Index = 2542;  Pin Name = \product_o_reg[27].SI;  pinInvFromLatch = no;  Latch Index = 891;  Latch Name = \product_o_reg[27].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[28] .SI = part_S_CR_1_TM_1 [5] ,   // CR = 1;  pos = 36;  Pin Index = 2618;  Pin Name = \product_o_reg[28].SI;  pinInvFromLatch = no;  Latch Index = 917;  Latch Name = \product_o_reg[28].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[29] .SI = part_S_CR_1_TM_1 [4] ,   // CR = 1;  pos = 37;  Pin Index = 2694;  Pin Name = \product_o_reg[29].SI;  pinInvFromLatch = no;  Latch Index = 943;  Latch Name = \product_o_reg[29].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[30] .SI = part_S_CR_1_TM_1 [3] ,   // CR = 1;  pos = 38;  Pin Index = 2846;  Pin Name = \product_o_reg[30].SI;  pinInvFromLatch = no;  Latch Index = 995;  Latch Name = \product_o_reg[30].__iNsT6.dff_primitive;   
    multiplier32FP_inst.\product_o_reg[31] .SI = part_S_CR_1_TM_1 [2] ,   // CR = 1;  pos = 39;  Pin Index = 2922;  Pin Name = \product_o_reg[31].SI;  pinInvFromLatch = no;  Latch Index = 1021;  Latch Name = \product_o_reg[31].__iNsT6.dff_primitive;   
    multiplier32FP_inst.underflow_o_reg.SI = part_S_CR_1_TM_1 [1] ;   // CR = 1;  pos = 40;  Pin Index = 20609;  Pin Name = underflow_o_reg.SI;  pinInvFromLatch = no;  Latch Index = 6565;  Latch Name = underflow_o_reg.__iNsT6.dff_primitive;   

  assign // OR = 1 
    part_M_OR_1_TM_1 [1] =  multiplier32FP_inst.scan_out ,   // OR = 1;  pos = 1;  Pin Index = 105;  Pin Name = scan_out;  pinInvFromLatch = no;  Latch Index = 6565;  Latch Name = underflow_o_reg.__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [2] =  multiplier32FP_inst.\product_o_reg[31] .Q ,   // OR = 1;  pos = 2;  Pin Index = 2923;  Pin Name = \product_o_reg[31].Q;  pinInvFromLatch = no;  Latch Index = 1021;  Latch Name = \product_o_reg[31].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [3] =  multiplier32FP_inst.\product_o_reg[30] .Q ,   // OR = 1;  pos = 3;  Pin Index = 2847;  Pin Name = \product_o_reg[30].Q;  pinInvFromLatch = no;  Latch Index = 995;  Latch Name = \product_o_reg[30].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [4] =  multiplier32FP_inst.\product_o_reg[29] .Q ,   // OR = 1;  pos = 4;  Pin Index = 2695;  Pin Name = \product_o_reg[29].Q;  pinInvFromLatch = no;  Latch Index = 943;  Latch Name = \product_o_reg[29].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [5] =  multiplier32FP_inst.\product_o_reg[28] .Q ,   // OR = 1;  pos = 5;  Pin Index = 2619;  Pin Name = \product_o_reg[28].Q;  pinInvFromLatch = no;  Latch Index = 917;  Latch Name = \product_o_reg[28].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [6] =  multiplier32FP_inst.\product_o_reg[27] .Q ,   // OR = 1;  pos = 6;  Pin Index = 2543;  Pin Name = \product_o_reg[27].Q;  pinInvFromLatch = no;  Latch Index = 891;  Latch Name = \product_o_reg[27].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [7] =  multiplier32FP_inst.\product_o_reg[26] .Q ,   // OR = 1;  pos = 7;  Pin Index = 2467;  Pin Name = \product_o_reg[26].Q;  pinInvFromLatch = no;  Latch Index = 865;  Latch Name = \product_o_reg[26].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [8] =  multiplier32FP_inst.\product_o_reg[25] .Q ,   // OR = 1;  pos = 8;  Pin Index = 2391;  Pin Name = \product_o_reg[25].Q;  pinInvFromLatch = no;  Latch Index = 839;  Latch Name = \product_o_reg[25].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [9] =  multiplier32FP_inst.\product_o_reg[24] .Q ,   // OR = 1;  pos = 9;  Pin Index = 2315;  Pin Name = \product_o_reg[24].Q;  pinInvFromLatch = no;  Latch Index = 813;  Latch Name = \product_o_reg[24].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [10] =  multiplier32FP_inst.\product_o_reg[23] .Q ,   // OR = 1;  pos = 10;  Pin Index = 2239;  Pin Name = \product_o_reg[23].Q;  pinInvFromLatch = no;  Latch Index = 787;  Latch Name = \product_o_reg[23].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [11] =  multiplier32FP_inst.\product_o_reg[22] .Q ,   // OR = 1;  pos = 11;  Pin Index = 2163;  Pin Name = \product_o_reg[22].Q;  pinInvFromLatch = no;  Latch Index = 761;  Latch Name = \product_o_reg[22].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [12] =  multiplier32FP_inst.\product_o_reg[21] .Q ,   // OR = 1;  pos = 12;  Pin Index = 2087;  Pin Name = \product_o_reg[21].Q;  pinInvFromLatch = no;  Latch Index = 735;  Latch Name = \product_o_reg[21].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [13] =  multiplier32FP_inst.\product_o_reg[20] .Q ,   // OR = 1;  pos = 13;  Pin Index = 2011;  Pin Name = \product_o_reg[20].Q;  pinInvFromLatch = no;  Latch Index = 709;  Latch Name = \product_o_reg[20].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [14] =  multiplier32FP_inst.\product_o_reg[19] .Q ,   // OR = 1;  pos = 14;  Pin Index = 1859;  Pin Name = \product_o_reg[19].Q;  pinInvFromLatch = no;  Latch Index = 657;  Latch Name = \product_o_reg[19].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [15] =  multiplier32FP_inst.\product_o_reg[18] .Q ,   // OR = 1;  pos = 15;  Pin Index = 1783;  Pin Name = \product_o_reg[18].Q;  pinInvFromLatch = no;  Latch Index = 631;  Latch Name = \product_o_reg[18].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [16] =  multiplier32FP_inst.\product_o_reg[17] .Q ,   // OR = 1;  pos = 16;  Pin Index = 1707;  Pin Name = \product_o_reg[17].Q;  pinInvFromLatch = no;  Latch Index = 605;  Latch Name = \product_o_reg[17].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [17] =  multiplier32FP_inst.\product_o_reg[16] .Q ,   // OR = 1;  pos = 17;  Pin Index = 1631;  Pin Name = \product_o_reg[16].Q;  pinInvFromLatch = no;  Latch Index = 579;  Latch Name = \product_o_reg[16].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [18] =  multiplier32FP_inst.\product_o_reg[15] .Q ,   // OR = 1;  pos = 18;  Pin Index = 1555;  Pin Name = \product_o_reg[15].Q;  pinInvFromLatch = no;  Latch Index = 553;  Latch Name = \product_o_reg[15].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [19] =  multiplier32FP_inst.\product_o_reg[14] .Q ,   // OR = 1;  pos = 19;  Pin Index = 1479;  Pin Name = \product_o_reg[14].Q;  pinInvFromLatch = no;  Latch Index = 527;  Latch Name = \product_o_reg[14].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [20] =  multiplier32FP_inst.\product_o_reg[13] .Q ,   // OR = 1;  pos = 20;  Pin Index = 1403;  Pin Name = \product_o_reg[13].Q;  pinInvFromLatch = no;  Latch Index = 501;  Latch Name = \product_o_reg[13].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [21] =  multiplier32FP_inst.\product_o_reg[12] .Q ,   // OR = 1;  pos = 21;  Pin Index = 1327;  Pin Name = \product_o_reg[12].Q;  pinInvFromLatch = no;  Latch Index = 475;  Latch Name = \product_o_reg[12].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [22] =  multiplier32FP_inst.\product_o_reg[11] .Q ,   // OR = 1;  pos = 22;  Pin Index = 1251;  Pin Name = \product_o_reg[11].Q;  pinInvFromLatch = no;  Latch Index = 449;  Latch Name = \product_o_reg[11].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [23] =  multiplier32FP_inst.\product_o_reg[10] .Q ,   // OR = 1;  pos = 23;  Pin Index = 1175;  Pin Name = \product_o_reg[10].Q;  pinInvFromLatch = no;  Latch Index = 423;  Latch Name = \product_o_reg[10].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [24] =  multiplier32FP_inst.\product_o_reg[9] .Q ,   // OR = 1;  pos = 24;  Pin Index = 3455;  Pin Name = \product_o_reg[9].Q;  pinInvFromLatch = no;  Latch Index = 1203;  Latch Name = \product_o_reg[9].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [25] =  multiplier32FP_inst.\product_o_reg[8] .Q ,   // OR = 1;  pos = 25;  Pin Index = 3379;  Pin Name = \product_o_reg[8].Q;  pinInvFromLatch = no;  Latch Index = 1177;  Latch Name = \product_o_reg[8].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [26] =  multiplier32FP_inst.\product_o_reg[7] .Q ,   // OR = 1;  pos = 26;  Pin Index = 3303;  Pin Name = \product_o_reg[7].Q;  pinInvFromLatch = no;  Latch Index = 1151;  Latch Name = \product_o_reg[7].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [27] =  multiplier32FP_inst.\product_o_reg[6] .Q ,   // OR = 1;  pos = 27;  Pin Index = 3227;  Pin Name = \product_o_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 1125;  Latch Name = \product_o_reg[6].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [28] =  multiplier32FP_inst.\product_o_reg[5] .Q ,   // OR = 1;  pos = 28;  Pin Index = 3151;  Pin Name = \product_o_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 1099;  Latch Name = \product_o_reg[5].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [29] =  multiplier32FP_inst.\product_o_reg[4] .Q ,   // OR = 1;  pos = 29;  Pin Index = 3075;  Pin Name = \product_o_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 1073;  Latch Name = \product_o_reg[4].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [30] =  multiplier32FP_inst.\product_o_reg[3] .Q ,   // OR = 1;  pos = 30;  Pin Index = 2999;  Pin Name = \product_o_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 1047;  Latch Name = \product_o_reg[3].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [31] =  multiplier32FP_inst.\product_o_reg[2] .Q ,   // OR = 1;  pos = 31;  Pin Index = 2771;  Pin Name = \product_o_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 969;  Latch Name = \product_o_reg[2].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [32] =  multiplier32FP_inst.\product_o_reg[1] .Q ,   // OR = 1;  pos = 32;  Pin Index = 1935;  Pin Name = \product_o_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 683;  Latch Name = \product_o_reg[1].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [33] =  multiplier32FP_inst.\product_o_reg[0] .Q ,   // OR = 1;  pos = 33;  Pin Index = 1099;  Pin Name = \product_o_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 397;  Latch Name = \product_o_reg[0].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [34] =  multiplier32FP_inst.overflow_o_reg.Q ,   // OR = 1;  pos = 34;  Pin Index = 20534;  Pin Name = overflow_o_reg.Q;  pinInvFromLatch = no;  Latch Index = 6539;  Latch Name = overflow_o_reg.__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [35] =  multiplier32FP_inst.nan_o_reg.Q ,   // OR = 1;  pos = 35;  Pin Index = 20458;  Pin Name = nan_o_reg.Q;  pinInvFromLatch = no;  Latch Index = 6513;  Latch Name = nan_o_reg.__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [36] =  multiplier32FP_inst.inifinit_o_reg.Q ,   // OR = 1;  pos = 36;  Pin Index = 5808;  Pin Name = inifinit_o_reg.Q;  pinInvFromLatch = no;  Latch Index = 1965;  Latch Name = inifinit_o_reg.__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [37] =  multiplier32FP_inst.done_o_reg.Q ,   // OR = 1;  pos = 37;  Pin Index = 3531;  Pin Name = done_o_reg.Q;  pinInvFromLatch = no;  Latch Index = 1229;  Latch Name = done_o_reg.__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [38] =  multiplier32FP_inst.\current_state_reg[2] .Q ,   // OR = 1;  pos = 38;  Pin Index = 264;  Pin Name = \current_state_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 74;  Latch Name = \current_state_reg[2].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [39] =  multiplier32FP_inst.\current_state_reg[1] .Q ,   // OR = 1;  pos = 39;  Pin Index = 188;  Pin Name = \current_state_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 48;  Latch Name = \current_state_reg[1].__iNsT6.dff_primitive;   
    part_M_OR_1_TM_1 [40] =  multiplier32FP_inst.\current_state_reg[0] .Q ;   // OR = 1;  pos = 40;  Pin Index = 112;  Pin Name = \current_state_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 22;  Latch Name = \current_state_reg[0].__iNsT6.dff_primitive;   

//***************************************************************************//
//                     OPEN THE FILE AND RUN SIMULATION                      //
//***************************************************************************//

  initial 
    begin 

      $timeformat ( -12, 2, " ps", 10 ); 

      `ifdef sdf_annotate 
        `ifdef SDF_Minimum 
          $sdf_annotate ("default.sdf",multiplier32FP_inst,,"sdf_Min.log","MINIMUM");
        `endif 
        `ifdef SDF_Maximum 
          $sdf_annotate ("default.sdf",multiplier32FP_inst,,"sdf_Max.log","MAXIMUM");
        `endif 
        `ifdef SDF_Typical
          $sdf_annotate ("default.sdf",multiplier32FP_inst,,"sdf_Typ.log","TYPICAL");
        `endif 
      `endif 

      `ifndef NOT_NC 
        if ( $test$plusargs ( "simvision" ) )  begin 
          $shm_open("simvision.shm"); 
          $shm_probe("AC"); 
        end  
      `endif 

      if ( $test$plusargs ( "vcd" ) )  begin 
        $dumpfile("out.vcd"); 
        $dumpvars(0,test_scripts_FULLSCAN_multiplier32FP_atpg ); 
      end  

      DATAFILE = 0; 
      sim_setup; 

      `ifdef MISCOMPAREDEBUG 
        diag_debug = 1'b0; 
        if ( $value$plusargs ( "MISCOMPAREDEBUGFILE=%s", DIAG_DEBUG_FILE )) begin 
          DIAG_DATAID = $fopen ( DIAG_DEBUG_FILE, "r" ); 
          if ( DIAG_DATAID ) begin 
            diag_debug = 1'b1; 
            $fclose ( DIAG_DATAID ); 
          end  
          else $display ( "\nERROR (TVE-951): Failed to open the file: Diagnostic 'MISCOMPAREDEBUGFILE' %0s. \n", DIAG_DEBUG_FILE ); 
        end  
      `endif  

      num_files = 0; 
      for ( TID = 1; TID <= 99; TID = TID + 1 ) begin 
        $sformat ( TESTFILE, "TESTFILE%0d=%s", TID, "%s" ); 
        if ( $value$plusargs ( TESTFILE, DATAFILE )) begin 
          DATAID = $fopen ( DATAFILE, "r" ); 
          if ( DATAID )  begin 
            sim_vector_file; 
            num_files = num_files + 1; 
          end  
          else $display ( "\nERROR (TVE-951): Failed to open the file: %0s. \n", DATAFILE ); 
        end  
      end  

      if ( FAILSETID )  $fclose ( FAILSETID ); 

      if ( DATAFILE )  begin
        $display ( "\nINFO (TVE-209): Cumulative Results: " ); 
        $display ( "                      Number of Files Simulated:  %0d ", num_files ); 
        $display ( "                      Total Number of Cycles:     %0d ", total_cycles ); 
        $display ( "                      Total Number of Tests:      %0d ", total_num_tests ); 
        $display ( "                        - Total Passed Tests:     %0d ", total_num_tests - total_num_failed_tests ); 
        $display ( "                        - Total Failed Tests:     %0d ", total_num_failed_tests ); 
        $display ( "                      Total Number of Compares:   %0.0f ", total_good_compares + total_miscompares ); 
        $display ( "                        - Total Good Compares:    %0.0f ", total_good_compares ); 
        $display ( "                        - Total Miscompares:      %0.0f \n", total_miscompares ); 
      end  
      else $display ( "\nWARNING (TVE-661): No input data files found. The data file must be specified using +TESTFILE1=<string>, +TESTFILE2=<string>, ... The +TESTFILEn=<string> keyword is an NC-Sim command. \n" ); 

      $finish; 

    end  

//***************************************************************************//
//                     DEFINE SIMULATION SETUP PROCEDURE                     //
//***************************************************************************//

  task sim_setup; 
    begin 

      total_good_compares = 0; 
      total_miscompares = 0; 
      miscompare_limit = 0; 
      total_num_tests = 0; 
      total_num_failed_tests = 0; 
      total_cycles = 0; 
      SOD = ""; 
      EOD = ""; 
      START = 0; 
      NUM_SHIFTS = 0; 
      MAX = 1; 

      sim_heart = 1'b0; 
      sim_range = 1'b1; 
      sim_range_measure = 1'b1; 
      sim_trace = 1'b0; 
      sim_debug = 1'b0; 
      sim_more_debug = 1'b0; 

      global_term = 1'bZ; 

      failset = 1'b0; 
      FAILSETID = 0; 

      CYCLE = 0; 
      SCANCYCLE = 0; 
      SERIALCYCLE = 0; 
      count_cycles = 1'b1; 
      SEQNUM = 0; 
      name_POs [1] = "done_o";      // pinName = done_o; 
      name_POs [2] = "inifinit_o";      // pinName = inifinit_o; 
      name_POs [3] = "nan_o";      // pinName = nan_o; 
      name_POs [4] = "overflow_o";      // pinName = overflow_o; 
      name_POs [5] = "product_o[0]";      // pinName = product_o[0]; 
      name_POs [6] = "product_o[10]";      // pinName = product_o[10]; 
      name_POs [7] = "product_o[11]";      // pinName = product_o[11]; 
      name_POs [8] = "product_o[12]";      // pinName = product_o[12]; 
      name_POs [9] = "product_o[13]";      // pinName = product_o[13]; 
      name_POs [10] = "product_o[14]";      // pinName = product_o[14]; 
      name_POs [11] = "product_o[15]";      // pinName = product_o[15]; 
      name_POs [12] = "product_o[16]";      // pinName = product_o[16]; 
      name_POs [13] = "product_o[17]";      // pinName = product_o[17]; 
      name_POs [14] = "product_o[18]";      // pinName = product_o[18]; 
      name_POs [15] = "product_o[19]";      // pinName = product_o[19]; 
      name_POs [16] = "product_o[1]";      // pinName = product_o[1]; 
      name_POs [17] = "product_o[20]";      // pinName = product_o[20]; 
      name_POs [18] = "product_o[21]";      // pinName = product_o[21]; 
      name_POs [19] = "product_o[22]";      // pinName = product_o[22]; 
      name_POs [20] = "product_o[23]";      // pinName = product_o[23]; 
      name_POs [21] = "product_o[24]";      // pinName = product_o[24]; 
      name_POs [22] = "product_o[25]";      // pinName = product_o[25]; 
      name_POs [23] = "product_o[26]";      // pinName = product_o[26]; 
      name_POs [24] = "product_o[27]";      // pinName = product_o[27]; 
      name_POs [25] = "product_o[28]";      // pinName = product_o[28]; 
      name_POs [26] = "product_o[29]";      // pinName = product_o[29]; 
      name_POs [27] = "product_o[2]";      // pinName = product_o[2]; 
      name_POs [28] = "product_o[30]";      // pinName = product_o[30]; 
      name_POs [29] = "product_o[31]";      // pinName = product_o[31]; 
      name_POs [30] = "product_o[3]";      // pinName = product_o[3]; 
      name_POs [31] = "product_o[4]";      // pinName = product_o[4]; 
      name_POs [32] = "product_o[5]";      // pinName = product_o[5]; 
      name_POs [33] = "product_o[6]";      // pinName = product_o[6]; 
      name_POs [34] = "product_o[7]";      // pinName = product_o[7]; 
      name_POs [35] = "product_o[8]";      // pinName = product_o[8]; 
      name_POs [36] = "product_o[9]";      // pinName = product_o[9]; 
      name_POs [37] = "scan_out";      // pinName = scan_out;  tf =  SO  ; 
      name_POs [38] = "underflow_o";      // pinName = underflow_o; 



      if ( $test$plusargs ( "MODUS_DEBUG" ) )  sim_trace = 1'b1; 

      if ( $test$plusargs ( "HEARTBEAT" ) )  sim_heart = 1'b1; 

      if ( $value$plusargs ( "START_RANGE=%s", SOD ) )  sim_range = 1'b0; 
      if ( $value$plusargs ( "START_RANGE=%s", SOD ) ) sim_range_measure = 1'b0;

      if ( $value$plusargs ( "END_RANGE=%s", EOD ) ); 

      if ( $value$plusargs ( "miscompare_limit=%0f", miscompare_limit ) ); 

      if ( $test$plusargs ( "FAILSET" ) )  failset = 1'b1; 

      stim_PIs = {69{1'bX}};   
      stim_CIs = 69'bXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX01XX; 
      meas_POs = {38{1'bX}};   
      stim_CR_1 = {40{1'b0}};   
      part_S_CR_1_TM_1 = {40{1'bZ}};   
      meas_OR_1 = {40{1'bX}};   

    end  
  endtask  

//***************************************************************************//
//                          FAILSET SETUP PROCEDURE                          //
//***************************************************************************//

  task failset_setup; 
    begin 

      $sformat ( FAILSET, "%0s_FAILSET", DATAFILE ); 
      FAILSETID = $fopen ( FAILSET, "w" ); 
      if ( ! FAILSETID ) 
        $display ( "\nERROR (TVE-951): Failed to open the file: %0s. \n", FAILSET ); 

    end  
  endtask 

//***************************************************************************//
//                           SET UP FOR SIMULATION                           //
//***************************************************************************//

  task sim_vector_file; 
    begin 

      CYCLE = 0; 
      SCANCYCLE = 0; 
      SERIALCYCLE = 0; 
      good_compares = 0; 
      miscompares = 0; 
      measure_current = 0; 
      test_num = 0; 
      test_num_prev = 0; 
      failed_test_num = 0; 
      num_tests = 0; 
      num_failed_tests = 0; 
      scan_num = 0; 
      overlap = 0; 
      repeat_depth = 0; 
      repeat_heart = 1000; 


      $display ( "\nINFO (TVE-200): Simulating vector file: %0s ", DATAFILE ); 

      $display ( "\nINFO (TVE-189): Design:  multiplier32FP   Test Mode:  FULLSCAN   InExperiment:  multiplier32FP_atpg " ); 
      start_of_current_line = $ftell ( DATAID ); 
      line_number = 1; 
      rc_read = $fscanf ( DATAID, "%d", CMD ); 
      while ( rc_read > 0 ) begin 

        cmd_code; 

        if ( rc_read > 0 )  begin 
          if ( sim_range )  begin 
            if (( miscompare_limit > 0 ) & ( miscompares > miscompare_limit ))  begin 
              sim_range = 1'b0; 
              if ( overlap )  num_tests = num_tests - 1; 
              $display ( "\nINFO (TVE-207): The miscompare limit (+miscompare_limit) of %0.0f has been reached. ", miscompare_limit ); 
            end  
            if ( EOD == pattern )  begin 
              sim_range = 1'b0; 
            end  
          end  
          start_of_current_line = $ftell ( DATAID ); 
          rc_read = $fscanf ( DATAID, "%d", CMD ); 
          if ( rc_read <= 0 )  begin 
            rc_read = $fgets ( COMMENT, DATAID ); 
            if ( rc_read > 0 )  bad_cmd_code; 
            else  line_number = 0; 
          end  
        end  
      end  

      if ( line_number == 0 )  begin
        $display ( "\nINFO (TVE-201): Simulation complete on vector file: %0s ", DATAFILE ); 
        $display ( "\nINFO (TVE-210): Results for vector file: %0s ", DATAFILE ); 
        $display ( "                      Number of Cycles:           %0d ", CYCLE ); 
        $display ( "                      Number of Tests:            %0d ", num_tests ); 
        $display ( "                        - Passed Tests:           %0d ", num_tests - num_failed_tests ); 
        $display ( "                        - Failed Tests:           %0d ", num_failed_tests ); 
        $display ( "                      Number of Compares:         %0.0f ", good_compares + miscompares ); 
        $display ( "                        - Good Compares:          %0.0f ", good_compares ); 
        $display ( "                        - Miscompares:            %0.0f ", miscompares ); 
        $display ( "                      Time:                       %t \n", $time ); 
      end  

      $fclose ( DATAID ); 

      total_good_compares = total_good_compares + good_compares; 

      total_miscompares = total_miscompares + miscompares; 

      total_num_tests = total_num_tests + num_tests; 

      total_num_failed_tests = total_num_failed_tests + num_failed_tests; 

      total_cycles = total_cycles + CYCLE; 

    end  
  endtask  

//***************************************************************************//
//                           DEFINE TEST PROCEDURE                           //
//***************************************************************************//

  task test_cycle; 
    begin 

      CYCLE = CYCLE + 1; 
      SERIALCYCLE = SERIALCYCLE + 1; 
     #0.000000;        // 0.000000 ns;  From the start of the cycle.
      part_PIs [1] = stim_PIs [1];      // pinName = SE;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [2] = stim_PIs [2];      // pinName = a_i[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [3] = stim_PIs [3];      // pinName = a_i[10]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [4] = stim_PIs [4];      // pinName = a_i[11]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [5] = stim_PIs [5];      // pinName = a_i[12]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [6] = stim_PIs [6];      // pinName = a_i[13]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [7] = stim_PIs [7];      // pinName = a_i[14]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [8] = stim_PIs [8];      // pinName = a_i[15]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [9] = stim_PIs [9];      // pinName = a_i[16]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [10] = stim_PIs [10];      // pinName = a_i[17]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [11] = stim_PIs [11];      // pinName = a_i[18]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [12] = stim_PIs [12];      // pinName = a_i[19]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [13] = stim_PIs [13];      // pinName = a_i[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [14] = stim_PIs [14];      // pinName = a_i[20]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [15] = stim_PIs [15];      // pinName = a_i[21]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [16] = stim_PIs [16];      // pinName = a_i[22]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [17] = stim_PIs [17];      // pinName = a_i[23]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [18] = stim_PIs [18];      // pinName = a_i[24]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [19] = stim_PIs [19];      // pinName = a_i[25]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [20] = stim_PIs [20];      // pinName = a_i[26]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [21] = stim_PIs [21];      // pinName = a_i[27]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [22] = stim_PIs [22];      // pinName = a_i[28]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [23] = stim_PIs [23];      // pinName = a_i[29]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [24] = stim_PIs [24];      // pinName = a_i[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [25] = stim_PIs [25];      // pinName = a_i[30]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [26] = stim_PIs [26];      // pinName = a_i[31]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [27] = stim_PIs [27];      // pinName = a_i[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [28] = stim_PIs [28];      // pinName = a_i[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [29] = stim_PIs [29];      // pinName = a_i[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [30] = stim_PIs [30];      // pinName = a_i[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [31] = stim_PIs [31];      // pinName = a_i[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [32] = stim_PIs [32];      // pinName = a_i[8]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [33] = stim_PIs [33];      // pinName = a_i[9]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [34] = stim_PIs [34];      // pinName = b_i[0]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [35] = stim_PIs [35];      // pinName = b_i[10]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [36] = stim_PIs [36];      // pinName = b_i[11]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [37] = stim_PIs [37];      // pinName = b_i[12]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [38] = stim_PIs [38];      // pinName = b_i[13]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [39] = stim_PIs [39];      // pinName = b_i[14]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [40] = stim_PIs [40];      // pinName = b_i[15]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [41] = stim_PIs [41];      // pinName = b_i[16]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [42] = stim_PIs [42];      // pinName = b_i[17]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [43] = stim_PIs [43];      // pinName = b_i[18]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [44] = stim_PIs [44];      // pinName = b_i[19]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [45] = stim_PIs [45];      // pinName = b_i[1]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [46] = stim_PIs [46];      // pinName = b_i[20]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [47] = stim_PIs [47];      // pinName = b_i[21]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [48] = stim_PIs [48];      // pinName = b_i[22]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [49] = stim_PIs [49];      // pinName = b_i[23]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [50] = stim_PIs [50];      // pinName = b_i[24]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [51] = stim_PIs [51];      // pinName = b_i[25]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [52] = stim_PIs [52];      // pinName = b_i[26]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [53] = stim_PIs [53];      // pinName = b_i[27]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [54] = stim_PIs [54];      // pinName = b_i[28]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [55] = stim_PIs [55];      // pinName = b_i[29]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [56] = stim_PIs [56];      // pinName = b_i[2]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [57] = stim_PIs [57];      // pinName = b_i[30]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [58] = stim_PIs [58];      // pinName = b_i[31]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [59] = stim_PIs [59];      // pinName = b_i[3]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [60] = stim_PIs [60];      // pinName = b_i[4]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [61] = stim_PIs [61];      // pinName = b_i[5]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [62] = stim_PIs [62];      // pinName = b_i[6]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [63] = stim_PIs [63];      // pinName = b_i[7]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [64] = stim_PIs [64];      // pinName = b_i[8]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [65] = stim_PIs [65];      // pinName = b_i[9]; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [68] = stim_PIs [68];      // pinName = scan_in;  tf =  SI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [69] = stim_PIs [69];      // pinName = start_i; testOffset = 0.000000;  scanOffset = 0.000000;  
     #8.000000;        // 8.000000 ns;  From the start of the cycle.
      part_PIs [66] = stim_PIs [66];      // pinName = clk;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      part_PIs [67] = stim_PIs [67];      // pinName = rst_n;  tf = +SC  ; testOffset = 8.000000;  scanOffset = 0.000000;  
     #8.000000;        // 16.000000 ns;  From the start of the cycle.
      part_PIs [66] = stim_CIs [66];      // pinName = clk;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      part_PIs [67] = stim_CIs [67];      // pinName = rst_n;  tf = +SC  ; testOffset = 8.000000;  scanOffset = 0.000000;  
     #56.000000;        // 72.000000 ns;  From the start of the cycle.

      for ( POnum = 1; POnum <= 38; POnum = POnum + 1 ) begin 
        if (( part_POs [ POnum ] !== meas_POs [ POnum ] ) & ( meas_POs [ POnum ] !== 1'bX )) begin 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-650): PO miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   On PO: %0s   ", meas_POs [ POnum ], part_POs [ POnum ], name_POs [ POnum ] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "multiplier32FP", name_POs [ POnum ], PATTERN, -1, part_POs [ POnum ] ); 
          end  
        end  
        else if ( meas_POs [ POnum ] !== 1'bX )  good_compares = good_compares + 1; 
      end  
     #8.000000;        // 80.000000 ns;  From the start of the cycle.
      meas_POs = {38{1'bX}}; 

    end  
  endtask  

//***************************************************************************//
//                       DEFINE SCAN PRECOND PROCEDURE                       //
//***************************************************************************//

  task Scan_Preconditioning_Sequence_TM_1_SEQ_1_SOP_1; 
    begin 

      PROCESSNAME = "SCAN PRECONDITIONING (Scan_Preconditioning_Sequence)";
      stim_PIs [1] = 1'b1;      // pinName = SE;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  

      test_cycle; 
      PROCESSNAME = "";
      PROCESSNAME = "";

    end  
  endtask  

//***************************************************************************//
//                      DEFINE SCAN SEQUENCE PROCEDURE                       //
//***************************************************************************//

  task Scan_Sequence_TM_1_SEQ_2_SOP_1; 
    begin 

      PROCESSNAME = "SCAN SEQUENCE (Scan_Sequence)";
      if (sim_range ) sim_range_measure = 1'b1 ;
      if ( overlap )  test_num = test_num - 1; 
      SERIALCYCLE = SERIALCYCLE + MAX; 
      CYCLE = CYCLE + 1; 
     #0.000000;        // 0.000000 ns;  From the start of the cycle.

      for ( SCANCYCLE = 1; SCANCYCLE <= MAX; SCANCYCLE = SCANCYCLE + 1 ) begin 

        if (( part_M_OR_1_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_1 [ 0 + SCANCYCLE ] ) & ( meas_OR_1 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = scan_out;  tf =  SO  ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 1;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_1 [ 0 + SCANCYCLE ], part_M_OR_1_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [37] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "multiplier32FP", name_POs [37], PATTERN, SCANCYCLE, part_M_OR_1_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_1 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 
      end  
     #0.000000;        // 0.000000 ns;  From the start of the cycle.
      part_S_CR_1_TM_1 [1:40] = stim_CR_1 [1:40]; 
     #16.000000;        // 16.000000 ns;  From the start of the cycle.
      part_PIs [66] = 1'b1;      // pinName = clk;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #8.000000;        // 24.000000 ns;  From the start of the cycle.
      part_PIs [66] = 1'b0;      // pinName = clk;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #56.000000;        // 80.000000 ns;  From the start of the cycle.
      part_S_CR_1_TM_1 = {40{1'bZ}};   
     #0; 
      meas_OR_1 = {40{1'bX}};   
      stim_CR_1 = {40{1'b0}};   
      stim_PIs = part_PIs; 
      SCANCYCLE = 0; 
      NUM_SHIFTS = 0; 
      if ( overlap )  test_num = test_num + 1; 
      PROCESSNAME = "";

    end  
  endtask  

//***************************************************************************//
//                 READ COMMANDS AND DATA AND RUN SIMULATION                 //
//***************************************************************************//

  task cmd_code; 
    begin 

      if ( sim_trace )  $display ( "\nCommand code:  %0d ", CMD ); 

      case ( CMD ) 

        000: begin 
          rc_read = 0;  // This will stop execution 
          line_number = line_number + 1; 
        end  

        100: begin 
          rc_read = $fgets ( COMMENT, DATAID ); 
          if ( rc_read > 0 )  begin 
          end  
          else  begin 
            $display ( "\nERROR (TVE-998): Unrecognizable data at line %0.0f in file: %0s \n", line_number, DATAFILE ); 
            $display ( "  Command code = %0d, Unrecognized data = %0s \n", CMD, COMMENT ); 
          end  
          line_number = line_number + 1; 
        end  

        104: begin 
          rc_read = $fgets ( PROCESSNAME, DATAID ); 
          if ( rc_read > 0 )  begin 
            if ( $value$plusargs ( "START_RANGE=%s", SOD ) ) begin
              if( sim_range == 1'b0 && PROCESSNAME == 4096'b100000010011010100111101000100010001010100100101001110010010010101010000001010) begin // PROCESSNAME == MODEINIT in ASCII
                sim_range = 1'b1 ;
              end
              if( sim_range==1'b1 && PROCESSNAME == 4096'b1000000010000000001010) begin // PROCESSNAME == '' in ASCII 
                sim_range = 1'b0 ;
              end
            end
          end  
          else  begin 
            $display ( "\nERROR (TVE-998): Unrecognizable data at line %0.0f in file: %0s \n", line_number, DATAFILE ); 
            $display ( "  Command code = %0d, Unrecognized data = %0s \n", CMD, PROCESSNAME ); 
          end  
          line_number = line_number + 1; 
        end  

        110: begin 
          rc_read = $fgets ( COMMENT, DATAID ); 
          if ( rc_read > 0 )  begin 
            $display ( "\n %0s ", COMMENT ); 
          end  
          else  begin 
            $display ( "\nERROR (TVE-998): Unrecognizable data at line %0.0f in file: %0s \n", line_number, DATAFILE ); 
            $display ( "  Command code = %0d, Unrecognized data = %0s \n", CMD, COMMENT ); 
          end  
          line_number = line_number + 1; 
        end  

        151: begin 
          test_num_prev = test_num; 
          rc_read = $fscanf ( DATAID, "%d", test_num ); 
          if ( rc_read > 0 )  begin 
            if (( test_num != test_num_prev ) && ( sim_range ))  num_tests = num_tests + 1; 
          end  
          else  bad_cmd_code; 

          rc_read = $fscanf ( DATAID, "%d", scan_num ); 
          if ( rc_read > 0 )  begin 
          end  
          else  bad_cmd_code; 

          rc_read = $fscanf ( DATAID, "%d", overlap ); 
          if ( rc_read > 0 )  begin 
          end  
          else  bad_cmd_code; 

          line_number = line_number + 1; 
        end  

        200: begin 
          if ( rc_read > 0 )  begin 
            rc_read = $fscanf ( DATAID, "%b", stim_PIs [1:69] ); 
            if ( rc_read <= 0 )  bad_cmd_code; 
            line_number = line_number + 1; 
          end  
        end  

        201: begin 
          if ( rc_read > 0 )  begin 
            rc_read = $fscanf ( DATAID, "%b", stim_CIs [1:69] ); 
            if ( rc_read <= 0 )  bad_cmd_code; 
            line_number = line_number + 1; 
          end  
        end  

        202: begin 
          if ( rc_read > 0 )  begin 
            rc_read = $fscanf ( DATAID, "%b", meas_POs [1:38] ); 
            if (sim_range_measure == 1'b0 ) meas_POs = 'bx;
            if ( rc_read <= 0 )  bad_cmd_code; 
            line_number = line_number + 1; 
          end  
        end  

        203: begin 
          rc_read = $fscanf ( DATAID, "%b", global_term ); 
          if ( rc_read > 0 )  begin 
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  

        300: begin 
          rc_read = $fscanf ( DATAID, "%d", MODENUM ); 
          if ( rc_read <= 0 )  bad_cmd_code; 
          else  begin 

            case ( MODENUM ) 

              1: begin 
                rc_read = $fscanf ( DATAID, "%d", SCANNUM ); 
                if ( rc_read <= 0 )  bad_cmd_code; 
                else  begin 

                  case ( SCANNUM ) 

                    1: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_1 [1:40] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                  endcase  
                end  
              end  

            endcase  
          end  
        end  

        301: begin 
          rc_read = $fscanf ( DATAID, "%d", MODENUM ); 
          if ( rc_read <= 0 )  bad_cmd_code; 
          else  begin 

            case ( MODENUM ) 

              1: begin 
                rc_read = $fscanf ( DATAID, "%d", SCANNUM ); 
                if ( rc_read <= 0 )  bad_cmd_code; 
                else  begin 

                  case ( SCANNUM ) 

                    1: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_1 [1:40] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_1 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                  endcase  
                end  
              end  

            endcase  
          end  
        end  

        400: begin 
          if ( sim_range )  test_cycle; 
          line_number = line_number + 1; 
        end  

        500: begin 
          repeat_depth = repeat_depth + 1; 
          rc_read = $fscanf ( DATAID, "%d", num_repeats [repeat_depth] ); 
          if ( rc_read > 0 )  begin 
            start_of_repeat[repeat_depth] = $ftell ( DATAID ); 
          end  
          else  bad_cmd_code; 
          if ((sim_range & sim_heart) && repeat_heart) 
            $display ( "\nINFO (TVE-202): Simulating Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t  Tests Passed %0d of %0d, Failed %0d.  Start of %0d cycles of a repeat loop.", test_num, pattern, CYCLE + 1, $time, num_tests - num_failed_tests, num_tests, num_failed_tests, num_repeats [repeat_depth] ); 
          line_number = line_number + 1; 
        end  

        501: begin 
          num_repeats [repeat_depth] = num_repeats [repeat_depth] - 1; 
          if ( num_repeats [repeat_depth] )  begin 
            if ((sim_range & sim_heart) && repeat_heart && (num_repeats [repeat_depth] % repeat_heart == 0 )) 
              $display ( "\nINFO (TVE-202): Simulating Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t  Tests Passed %0d of %0d, Failed %0d.  Number of cycles remaining in this repeat loop is %0d.", test_num, pattern, CYCLE + 1, $time, num_tests - num_failed_tests, num_tests, num_failed_tests, num_repeats [repeat_depth] ); 
            rc_read = $fseek ( DATAID, start_of_repeat [repeat_depth], 0 ); 
            rc_read = 1; 
            fseek_offset = $ftell ( DATAID ); 
            if ( fseek_offset != start_of_repeat [repeat_depth] )  begin 
              $display ( "\nERROR (TVE-956): A Verilog simulator limitation in the fseek routine has been reached.  The size of the Verilog Data file is so big that it can not support branching using fseek in the Verilog simulator.  Any branching after 9,223,372,036,854,775,807 (0x7fffffffffffffff) bytes of data will not run correctly under the Verilog simulator.  It is recommended that you break up the Verilog Data file using the keyword maxvectorsperfile.  The Verilog Data file:  %0s  \n", DATAFILE ); 
              rc_read = 0;  // This will stop execution 
            end  
          end  
          else  repeat_depth = repeat_depth - 1; 
          line_number = line_number + 1; 
        end  

        600: begin 
          rc_read = $fscanf ( DATAID, "%d", MODENUM ); 
          if ( rc_read <= 0 )  bad_cmd_code; 
          else  begin 

            case ( MODENUM ) 

              1: begin 
                rc_read = $fscanf ( DATAID, "%d", SEQNUM ); 
                if ( rc_read <= 0 )  bad_cmd_code; 
                else  begin 

                  case ( SEQNUM ) 

                    1: begin 
                      rc_read = $fscanf ( DATAID, "%d", MAX ); 
                      if ( rc_read > 0 )  begin 
                        if ( sim_range )  Scan_Preconditioning_Sequence_TM_1_SEQ_1_SOP_1; 
                      end  
                      else  bad_cmd_code; 
                      line_number = line_number + 1; 
                    end  

                    2: begin 
                      rc_read = $fscanf ( DATAID, "%d", MAX ); 
                      if ( rc_read > 0 )  begin 
                        if ( sim_range )  Scan_Sequence_TM_1_SEQ_2_SOP_1; 
                      end  
                      else  bad_cmd_code; 
                      line_number = line_number + 1; 
                    end  

                  endcase  
                end  
              end 

            endcase  
          end  
        end  

        900: begin 
          rc_read = $fscanf ( DATAID, "%s", pattern ); 
          if ( rc_read > 0 )  begin 
            if ( SOD == pattern )  begin 
              sim_range = 1'b1; 
            end  
            if (( sim_range ) & ( scan_num > 0 ))  begin 
              if ( overlap )  $display ( "\nINFO (TVE-211): Simulating Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t  Relative Scan: %0d  Overlap Tests %0d and %0d.  Tests Passed %0d of %0d, Failed %0d. ", test_num - 1, pattern, CYCLE + 1, $time, scan_num, test_num - 1, test_num, num_tests - num_failed_tests - 1, num_tests - 1, num_failed_tests ); 
              else  $display ( "\nINFO (TVE-211): Simulating Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t  Relative Scan: %0d  Tests Passed %0d of %0d, Failed %0d. ", test_num, pattern, CYCLE + 1, $time, scan_num, num_tests - num_failed_tests, num_tests, num_failed_tests ); 
              scan_num = 0; 
            end  
            else if ( sim_range & sim_heart )  begin 
              $display ( "\nINFO (TVE-202): Simulating Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t  Tests Passed %0d of %0d, Failed %0d. ", test_num, pattern, CYCLE + 1, $time, num_tests - num_failed_tests, num_tests, num_failed_tests ); 
            end  
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  

        901: begin 
          rc_read = $fscanf ( DATAID, "%s", PATTERN ); 
          if ( rc_read > 0 )  begin 
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  

        903: begin 
          measure_current = measure_current + 1; 
          line_number = line_number + 1; 
        end  

        904: begin 
          rc_read = $fscanf ( DATAID, "%s", eventID ); 
          if ( rc_read > 0 )  begin 
            `ifdef MISCOMPAREDEBUG 
              if ( diag_debug ) begin 
                $processSimulationDebugFile ( DIAG_DEBUG_FILE, "multiplier32FP_inst", eventID ); 
              end 
            `endif 
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  

        905: begin 
          rc_read = $fscanf ( DATAID, "%s", eventID ); 
          if ( rc_read > 0 )  begin 
            `ifdef MISCOMPAREDEBUG 
              if ( diag_debug ) begin 
                $processSimulationDebugFile ( DIAG_DEBUG_FILE, "multiplier32FP_inst", eventID ); 
              end 
            `endif 
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  


        default: begin 
          bad_cmd_code; 
          rc_read = 0;  // This will stop execution 
          line_number = line_number + 1; 
        end  

      endcase  

    end  
  endtask  

//***************************************************************************//
//                          PRINT BAD CMD CODE DATA                          //
//***************************************************************************//

  task bad_cmd_code; 
    begin 

      $display ( "\nERROR (TVE-998): Unrecognizable data at line %0.0f in file: %0s \n", line_number, DATAFILE ); 
      start_of_current_line = $ftell ( DATAID ); 
      rc_read = $fgets ( COMMENT, DATAID ); 
      $display ( "  Command code = %0d, Unrecognized data = %0s \n", CMD, COMMENT ); 
      rc_read = 0;  // This will stop execution 

    end  
  endtask  

  endmodule 
