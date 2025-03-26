#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Thu Feb 27 17:50:59 2025                
#                                                     
#######################################################

#@(#)CDS: Innovus v21.15-s110_1 (64bit) 09/23/2022 13:08 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 21.15-s110_1 NR220912-2004/21_15-UB (database version 18.20.592) {superthreading v2.17}
#@(#)CDS: AAE 21.15-s039 (64bit) 09/23/2022 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 21.15-s038_1 () Sep 20 2022 11:42:13 ( )
#@(#)CDS: SYNTECH 21.15-s012_1 () Sep  5 2022 10:25:51 ( )
#@(#)CDS: CPE v21.15-s076
#@(#)CDS: IQuantus/TQuantus 21.1.1-s867 (64bit) Sun Jun 26 22:12:54 PDT 2022 (Linux 3.10.0-693.el7.x86_64)

#@ source /home/cinovador/Documents/course_files/physical_synthesis/synthesis/backend/layout/scripts/layout.tcl
#@ Begin verbose source (pre): source /home/cinovador/Documents/course_files/physical_synthesis/synthesis/backend/layout/scripts/layout.tcl
set PROJECT_DIR $env(PROJECT_DIR)
set BACKEND_DIR $env(BACKEND_DIR)
set TECH_DIR $env(TECH_DIR)
set DESIGNS $env(DESIGNS)
set HDL_NAME $env(HDL_NAME)
set VLOG_LIST $env(VLOG_LIST)
set INTERCONNECT_MODE ple
set FRONTEND_DIR $env(FRONTEND_DIR)
set MAIN_CLOCK_NAME clk
set MAIN_RST_NAME rst_n
set BEST_LIB_OPERATING_CONDITION PVT_1P32V_0C
set WORST_LIB_OPERATING_CONDITION PVT_0P9V_125C
set period_clk 100.0  ;
set clk_uncertainty 0.05 ;
set clk_latency 0.10 ;
set in_delay 0.30 ;
set out_delay 0.30;
set out_load 0.045 ;
set slew "146 164 264 252" ;
set slew_min_rise 0.146 ;
set slew_min_fall 0.164 ;
set slew_max_rise 0.264 ;
set slew_max_fall 0.252 ;
set NET_ZERO VSS ;
set NET_ONE VDD ;
#@ source ${PROJECT_DIR}/backend/synthesis/scripts/common/path.tcl
#@ Begin verbose source /home/cinovador/Documents/course_files/physical_synthesis/synthesis/backend/synthesis/scripts/common/path.tcl (pre)
set BACKEND_DIR ${PROJECT_DIR}/backend
set SYNT_DIR ${BACKEND_DIR}/synthesis
set SCRIPT_DIR ${SYNT_DIR}/scripts
set RPT_DIR ${SYNT_DIR}/reports
set DEV_DIR ${SYNT_DIR}/deliverables
set LAYOUT_DIR ${BACKEND_DIR}/layout
set FRONTEND_DIR ${PROJECT_DIR}/frontend
set OTHERS ""
lappend FRONTEND_DIR $OTHERS
set LIB_DIR ${TECH_DIR}/gsclib045_svt_v4.4/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_svt_v4.4/gsclib045/timing
set LEF_DIR ${TECH_DIR}/gsclib045_svt_v4.4/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_svt_v4.4/gsclib045/lef
#@ End verbose source /home/cinovador/Documents/course_files/physical_synthesis/synthesis/backend/synthesis/scripts/common/path.tcl
set WORST_LIST ${LIB_DIR}/slow_vdd1v0_basicCells.lib
set BEST_LIST ${LIB_DIR}/fast_vdd1v2_basicCells.lib
set LEF_INIT "${TECH_DIR}/gsclib045_svt_v4.4/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_svt_v4.4/gsclib045/lef/gsclib045_tech.lef ${TECH_DIR}/gsclib045_svt_v4.4/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_svt_v4.4/gsclib045/lef/gsclib045_macro.lef" ;
set CAP_MAX ${TECH_DIR}/gpdk045_v_6_0/soce/gpdk045.basic.CapTbl
set CAP_MIN ${TECH_DIR}/gpdk045_v_6_0/soce/gpdk045.basic.CapTbl
set QRC_LIST ${TECH_DIR}/gpdk045_v_6_0/qrc/rcworst/qrcTechFile
set_db init_power_nets $NET_ONE
set_db init_ground_nets $NET_ZERO
read_mmmc ${LAYOUT_DIR}/scripts/${DESIGNS}.view
#@ Begin verbose source /home/cinovador/Documents/course_files/physical_synthesis/synthesis/backend/layout/scripts/multiplier32FP.view (pre)
create_library_set -name fast -timing $BEST_LIST
create_library_set -name slow -timing $WORST_LIST
create_rc_corner -name rc_best -cap_table $CAP_MIN -T 0
create_rc_corner -name rc_worst -cap_table $CAP_MAX -T 125
create_opcond -name oc_slow -process {1.0} -voltage {0.90} -temperature {125}
create_opcond -name oc_fast -process {1.0} -voltage {1.32} -temperature {0}
create_timing_condition -name slow_timing -library_sets [list slow] -opcond oc_slow
create_timing_condition -name fast_timing -library_sets [list fast] -opcond oc_fast
create_delay_corner -name slow_max -timing_condition slow_timing -rc_corner rc_worst
create_delay_corner -name fast_min -timing_condition fast_timing -rc_corner rc_best
create_constraint_mode -name normal_genus_slow_max -sdc_files ${PROJECT_DIR}/backend/synthesis/constraints/$DESIGNS.sdc
create_analysis_view -name analysis_normal_slow_max -constraint_mode {normal_genus_slow_max} -delay_corner slow_max
create_analysis_view -name analysis_normal_fast_min -constraint_mode {normal_genus_slow_max} -delay_corner fast_min
set_analysis_view -setup [list analysis_normal_slow_max] -hold [list analysis_normal_fast_min]
#@ End verbose source /home/cinovador/Documents/course_files/physical_synthesis/synthesis/backend/layout/scripts/multiplier32FP.view
read_physical -lef $LEF_INIT
read_netlist ../../synthesis/deliverables/${DESIGNS}.v
init_design
connect_global_net $NET_ONE -type pg_pin -pin_base_name $NET_ONE -inst_base_name *
connect_global_net $NET_ZERO -type pg_pin -pin_base_name $NET_ZERO -inst_base_name *
set_db design_process_node 45
create_floorplan -core_margins_by die -site CoreSite -core_density_size 1 0.7 2.5 2.5 2.5 2.5
set_db add_rings_skip_shared_inner_ring none
set_db add_rings_avoid_short 1
set_db add_rings_ignore_rows 0
set_db add_rings_extend_over_row 0
add_rings -type core_rings -jog_distance 0.6 -threshold 0.6 -nets "$NET_ONE $NET_ZERO" -follow core -layer {bottom Metal11 top Metal11 right Metal10 left Metal10} -width 0.7 -spacing 0.4 -offset 0.6
add_stripes -block_ring_top_layer_limit Metal11 -max_same_layer_jog_length 0.44 -pad_core_ring_bottom_layer_limit Metal9 -set_to_set_distance 7 -pad_core_ring_top_layer_limit Metal11 -spacing 0.4 -layer Metal10 -block_ring_bottom_layer_limit Metal9 -width 0.22 -start_offset 1 -nets "$NET_ONE $NET_ZERO"
route_special -connect core_pin -layer_change_range { Metal1(1) Metal11(11) } -block_pin_target nearest_target -core_pin_target first_after_row_end -allow_jogging 1 -crossover_via_layer_range { Metal1(1) Metal11(11) } -nets "$NET_ONE $NET_ZERO" -allow_layer_change 1 -target_via_layer_range { Metal1(1) Metal11(11) }
write_db 01_power.enc
set_db place_global_place_io_pins 1
set_db place_global_reorder_scan 0
place_design
write_db 02_placement.enc
set_db extract_rc_engine pre_route
extract_rc ;
set_db timing_analysis_type best_case_worst_case
time_design -pre_cts
get_db clock_trees
#@ source ${BACKEND_DIR}/layout/scripts/cts.ccopt
#@ Begin verbose source /home/cinovador/Documents/course_files/physical_synthesis/synthesis/backend/layout/scripts/cts.ccopt (pre)
set BUFFERS_CTS "CLKBUFX20 CLKBUFX16 CLKBUFX12 CLKBUFX8 CLKBUFX6 CLKBUFX4 CLKBUFX3 CLKBUFX2"
set_db cts_buffer_cells $BUFFERS_CTS ;
get_db cts_buffer_cells;
get_db cts_inverter_cells;
set INVERTERS_CTS "INVX20 CLKINVX20 INVX16 INVX12 INVX8 INVX6 INVX4 INVX3 INVX2 INVX1 INVXL"
set_db cts_inverter_cells $INVERTERS_CTS ;
#@ End verbose source /home/cinovador/Documents/course_files/physical_synthesis/synthesis/backend/layout/scripts/cts.ccopt
create_clock_tree_spec -out_file ${BACKEND_DIR}/layout/scripts/cts.spec ;
get_db clock_trees
ccopt_design ;
set_db timing_analysis_type best_case_worst_case
set_db timing_analysis_clock_propagation_mode sdc_control
time_design -post_cts
time_design -post_cts -hold
write_db 03_cts.enc
route_design
set_db timing_analysis_type ocv
time_design -post_route
set_interactive_constraint_modes {normal_genus_slow_max} ;
set_propagated_clock [all_clocks]
set_db timing_analysis_check_type setup
report_timing
set_db timing_analysis_check_type hold
report_timing
write_db 04_route.enc
add_fillers -base_cells {FILL8 FILL64 FILL4 FILL32 FILL2 FILL16 FILL1}
write_db 05_filler.enc
check_drc
delete_routes -regular_wire_with_drc ;
route_design ;
check_drc ;
route_eco -fix_drc ;
check_drc ;
route_eco -route_only_layers 2:6;
check_drc ;
write_db 06_drc.enc
write_netlist ${BACKEND_DIR}/layout/deliverables/${DESIGNS}_layout.v
write_sdf -edge check_edge -map_setuphold merge_always -map_recrem merge_always -version 3.0  ${BACKEND_DIR}/layout/deliverables/${DESIGNS}_layout.sdf
get_db power_method ;
report_power -power_unit uW > ${BACKEND_DIR}/layout/deliverables/reports/power_report_no_VCD.rpt
set_db power_corner min
read_activity_file -format VCD -scope ${DESIGNS}/DUT ${PROJECT_DIR}/frontend/work/${DESIGNS}_MAX_tb.vcd
report_power -power_unit uW > ${BACKEND_DIR}/layout/deliverables/reports/power_report_VCD_MAX.rpt
read_activity_file -format VCD -scope ${DESIGNS}/DUT ${PROJECT_DIR}/frontend/work/${DESIGNS}_MIN_tb.vcd -reset
report_power -power_unit uW > ${BACKEND_DIR}/layout/deliverables/reports/power_report_VCD_MIN.rpt
add_metal_fill -layers {Metal1 Metal2 Metal3 Metal4 Metal5 Metal6 Metal7 Metal8 Metal9 Metal10 Metal11} ;
write_stream -mode ALL -unit 2000 ${BACKEND_DIR}/layout/deliverables/${DESIGNS}.gsd
ls streamOut.map ;
write_def ${BACKEND_DIR}/layout/deliverables/${DESIGNS}_layout.def
write_db 07_to-drc-lvs.enc
#@ End verbose source: /home/cinovador/Documents/course_files/physical_synthesis/synthesis/backend/layout/scripts/layout.tcl
exit
