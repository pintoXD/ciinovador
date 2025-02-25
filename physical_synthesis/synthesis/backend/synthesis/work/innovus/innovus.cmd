#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Mon Feb 10 09:31:40 2025                
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
set TECH_DIR $env(TECH_DIR)
set LIB_DIR $env(LIB_DIR)
set DESIGNS $env(DESIGNS)
set HDL_NAME $env(HDL_NAME)
set INTERCONNECT_MODE ple
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
set NET_ZERO VSS
set NET_ONE VDD
#@ source ${LAYOUT_DIR}/scripts/${DESIGNS}.globals
#@ Begin verbose source /home/cinovador/Documents/course_files/physical_synthesis/synthesis/backend/layout/scripts/ieee754multiplier.globals (pre)
set defHierChar {/}
set delaycal_input_transition_delay {0.1ps}
set fpIsMaxIoHeight 0
set init_design_settop 0
set init_gnd_net $NET_ZERO
set init_lef_file $LEF_INIT
set init_mmmc_file ${BACKEND_DIR}/layout/scripts/${DESIGNS}.view
set init_oa_search_lib {}
set init_pwr_net $NET_ONE
set init_verilog ${BACKEND_DIR}/synthesis/deliverables/${DESIGNS}.v
set lsgOCPGainMult 1.000000
#@ End verbose source /home/cinovador/Documents/course_files/physical_synthesis/synthesis/backend/layout/scripts/ieee754multiplier.globals
set_db init_power_nets $NET_ONE
set_db init_ground_nets $NET_ZERO
read_mmmc ${LAYOUT_DIR}/scripts/${DESIGNS}.view
#@ Begin verbose source /home/cinovador/Documents/course_files/physical_synthesis/synthesis/backend/layout/scripts/ieee754multiplier.view (pre)
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
#@ End verbose source /home/cinovador/Documents/course_files/physical_synthesis/synthesis/backend/layout/scripts/ieee754multiplier.view
read_physical -lef $LEF_INIT
read_netlist ${BACKEND_DIR}/synthesis/deliverables/${DESIGNS}.v
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
create_clock_tree_spec ;
get_db clock_trees
ccopt_design ;
set_db timing_analysis_type best_case_worst_case
set_db timing_analysis_clock_propagation_mode sdc_control
time_design -post_cts
time_design -post_cts -hold
write_db 03_cts.enc
gui_show
#@ End verbose source: /home/cinovador/Documents/course_files/physical_synthesis/synthesis/backend/layout/scripts/layout.tcl
gui_pan 1.93900 2.19500
gui_pan 5.78500 5.10450
gui_pan 16.43650 20.33700
gui_pan 23.45550 31.10900
