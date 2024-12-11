#!/usr/bin/env tclsh



# Set the working directory
set WORKING_DIR [pwd]

# Source directory
set SOURCE_DIR "$WORKING_DIR/source"

# Scripts directory
set SCRIPTS_DIR "$WORKING_DIR/scripts"

# Library directory
set LIB_DIR "$WORKING_DIR/library"

# Logs directory
set LOGS_DIR "$WORKING_DIR/logs"

# Define the folder path
set REPORTS_DIR "$WORKING_DIR/reports"

# Netlist output directory
set NETLIST_DIR "$WORKING_DIR/netlist"

# Setting lib's names
set GPDK45_SLOW_LIB_NAME "gpdk45_slow"
set GPDK45_SLOW_V "slow_vdd1v0_basicCells.v"
set GPDK45_FAST_LIB_NAME "gpdk45_fast"
set GPDK45_FAST_V "fast_vdd1v0_basicCells.v"
set TSMC18 "tsmc18_slow"

# Check if directories exist and create them if they do not
foreach dir [list $REPORTS_DIR $LIB_DIR $LOGS_DIR $NETLIST_DIR] {
    if {![file isdirectory $dir]} {
        file mkdir $dir
    }
}

# Running tests from ula8_tb.sv that instantiates the ula8.sv module
# set cmd "xrun -64bit $SOURCE_DIR/ula8_tb.sv $SOURCE_DIR/ula8.sv"
puts "Running design simulation..."
set retval [catch { exec xrun -64bit $SOURCE_DIR/ula8_tb.sv $SOURCE_DIR/ula8.sv } result]

# Check if the simulation was successful
if {$retval == 0} {
    puts "Simulation successful"
} else {
    puts "Simulation failed"
    exit 1
}


# if { 0 } {
# Launching genus synthesis tool
foreach script [list "synth_tsmc18.tcl" "synth_gpdk45_slow.tcl" "synth_gpdk45_fast.tcl"] {
    # set cmd "genus -abort_on_error -log logs/genus -f $SCRIPTS_DIR/$script"
    puts "Running $script synthesis..."
    catch {exec genus -abort_on_error -log logs/genus -f $SCRIPTS_DIR/$script} result
    puts $result
}

# Running tests from ula8_tb.sv that instantiates the ula8.sv module using the resulting netlist as source file
# set cmd "xrun -64bit $SOURCE_DIR/ula8_tb.sv $NETLIST_DIR/$GPDK45_SLOW_LIB_NAME/ula8_${GPDK45_SLOW_LIB_NAME}_netlist.v $LIB_DIR/$GPDK45_SLOW_V"
set retval_slow [catch {exec xrun -64bit $SOURCE_DIR/ula8_tb.sv $NETLIST_DIR/$GPDK45_SLOW_LIB_NAME/ula8_${GPDK45_SLOW_LIB_NAME}_netlist.v $LIB_DIR/$GPDK45_SLOW_V} result]

# Check if the simulation was successful
if {$retval_slow == 0} {
    puts "Netlist $GPDK45_SLOW_LIB_NAME Simulation successful"
} else {
    puts "Netlist $GPDK45_SLOW_LIB_NAME Simulation failed"
    # exit 1
}

# Running tests from ula8_tb.sv that instantiates the ula8.sv module using the resulting netlist as source file
# set cmd "xrun -64bit $SOURCE_DIR/ula8_tb.sv $NETLIST_DIR/$GPDK45_FAST_LIB_NAME/ula8_${GPDK45_FAST_LIB_NAME}_netlist.v $LIB_DIR/$GPDK45_FAST_V"
set retval_fast [catch {exec xrun -64bit $SOURCE_DIR/ula8_tb.sv $NETLIST_DIR/$GPDK45_FAST_LIB_NAME/ula8_${GPDK45_FAST_LIB_NAME}_netlist.v $LIB_DIR/$GPDK45_FAST_V} result]

# Check if the simulation was successful
if {$retval_fast == 0} {
    puts "Netlist $GPDK45_FAST_LIB_NAME Simulation successful"
} else {
    puts "Netlist $GPDK45_FAST_LIB_NAME Simulation failed"
    # exit 1
}

# Check overall simulation results
if {$retval == 0 && $retval_slow == 0 && $retval_fast == 0} {
    set timestamp [clock format [clock seconds] -format "%Y-%m-%d_%H-%M-%S"]
    set report_file "$REPORTS_DIR/simulation_reports.txt"
    set fileId [open $report_file "a"]
    puts $fileId "$timestamp"
    puts $fileId "Design Simulation: Passed!"
    puts $fileId "Netlist $GPDK45_SLOW_LIB_NAME Simulation: Passed!"
    puts $fileId "Netlist $GPDK45_FAST_LIB_NAME Simulation: Passed!"
    close $fileId
} else {
    set timestamp [clock format [clock seconds] -format "%Y-%m-%d_%H-%M-%S"]
    set report_file "$REPORTS_DIR/simulation_reports.txt"
    set fileId [open $report_file "a"]
    puts $fileId "$timestamp"
    puts $fileId "Some test failed"
    puts $fileId "Design Simulation Return: $retval"
    puts $fileId "Netlist $GPDK45_SLOW_LIB_NAME Simulation: $retval_slow"
    puts $fileId "Netlist $GPDK45_FAST_LIB_NAME Simulation: $retval_fast"
    close $fileId
    # exit 1
}

# Check if directories and files exist and delete them if they do
foreach dir [list "$WORKING_DIR/fv" "$WORKING_DIR/waves.shm" "$WORKING_DIR/.simvision" "$WORKING_DIR/xcelium.d"] {
    if {[file isdirectory $dir]} {
        file delete -force $dir
    }
}

foreach file [list "$WORKING_DIR/xrun.history" "$WORKING_DIR/xrun.key" "$WORKING_DIR/xrun.log"] {
    if {[file exists $file]} {
        file delete $file
    }
}

# }