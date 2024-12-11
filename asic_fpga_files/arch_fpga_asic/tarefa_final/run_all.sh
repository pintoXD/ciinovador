#!/bin/bash
export WORKING_DIR=$PWD

# Source directory
export SOURCE_DIR="$WORKING_DIR/source"

# Source directory
export SCRIPTS_DIR="$WORKING_DIR/scripts"

# Library directory
export LIB_DIR="$WORKING_DIR/library"

# Logs directory
export LOGS_DIR="$WORKING_DIR/logs"

# Define the folder path
export REPORTS_DIR="$WORKING_DIR/reports"


# Netlist output directory
export NETLIST_DIR="$WORKING_DIR/netlist"

# Setting lib's names
GPDK45_SLOW_LIB_NAME="gpdk45_slow"
GPDK45_SLOW_V="slow_vdd1v0_basicCells.v"
GPDK45_FAST_LIB_NAME="gpdk45_fast"
GPDK45_FAST_V="fast_vdd1v0_basicCells.v"
TSMC18="tsmc18_slow"


# Check if REPORTS_DIR the folder exists
if [ ! -d "$REPORTS_DIR" ]; then
    mkdir -p "$REPORTS_DIR"
fi

# Check if LIB_DIR the folder exists
if [ ! -d "$LIB_DIR" ]; then
    mkdir -p "$LIB_DIR"
fi

# Check if LOGS_DIR the folder exists
if [ ! -d "$LOGS_DIR" ]; then
    mkdir -p "$LOGS_DIR"
fi

# Check if NETLIST_DIR the folder exists
if [ ! -d "$NETLIST_DIR" ]; then
    mkdir -p "$NETLIST_DIR"
fi

running tests from ula8_tb.sv that instantiates the ula8.sv module
xrun -64bit $SOURCE_DIR/ula8_tb.sv $SOURCE_DIR/ula8.sv
RETVAL=$?

# Check if the simulation was successful
if [ $RETVAL -eq 0 ]; then
    echo "Simulation successful"
else
    echo "Simulation failed"
    exit 1
fi

Launching genus synthesis tool
genus -abort_on_error -log "logs/genus" -f $SCRIPTS_DIR/synth_tsmc18.tcl
genus -abort_on_error -log "logs/genus" -f $SCRIPTS_DIR/synth_gpdk45_slow.tcl
genus -abort_on_error -log "logs/genus" -f $SCRIPTS_DIR/synth_gpdk45_fast.tcl



#running tests from ula8_tb.sv that instantiates the ula8.sv module using the resulting netlist as source file.
xrun -64bit $SOURCE_DIR/ula8_tb.sv $NETLIST_DIR/$GPDK45_SLOW_LIB_NAME/ula8_${GPDK45_SLOW_LIB_NAME}_netlist.v $LIB_DIR/$GPDK45_SLOW_V
RETVAL_SLOW=$?

# Check if the simulation was successful
if [ $RETVAL_SLOW -eq 0 ]; then
    echo "Netlist $GPDK45_SLOW_LIB_NAME Simulation successful"
else
    echo "Netlist $GPDK45_SLOW_LIB_NAME Simulation failed"
    exit 1
fi

# running tests from ula8_tb.sv that instantiates the ula8.sv module using the resulting netlist as source file.
xrun -64bit $SOURCE_DIR/ula8_tb.sv $NETLIST_DIR/$GPDK45_FAST_LIB_NAME/ula8_${GPDK45_FAST_LIB_NAME}_netlist.v $LIB_DIR/$GPDK45_FAST_V
RETVAL_FAST=$?

# Check if the simulation was successful
if [ $RETVAL_FAST -eq 0 ]; then
    echo "Netlist $GPDK45_FAST_LIB_NAME Simulation successful"
else
    echo "Netlist $GPDK45_FAST_LIB_NAME Simulation failed"
    exit 1
fi

if [ $RETVAL -eq 0 ] && [ $RETVAL_SLOW -eq 0 ] && [ $RETVAL_FAST -eq 0 ]; then
    timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
    echo "$timestamp" >> $REPORTS_DIR/simulation_reports.txt
    echo "Design Simulation: Passed!" >> $REPORTS_DIR/simulation_reports.txt
    echo "Netlist $GPDK45_SLOW_LIB_NAME Simulation: Passed!" >> $REPORTS_DIR/simulation_reports.txt
    echo "Netlist $GPDK45_FAST_LIB_NAME Simulation: Passed!" >> $REPORTS_DIR/simulation_reports.txt
else
    timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
    echo "$timestamp" >> $REPORTS_DIR/simulation_reports.txt
    echo "Some test failed" >> $REPORTS_DIR/simulation_reports.txt
    echo "Design Simulation Return: $RETVAL" >> $REPORTS_DIR/simulation_reports.txt
    echo "Netlist $GPDK45_SLOW_LIB_NAME Simulation: $RETVAL_SLOW" >> $REPORTS_DIR/simulation_reports.txt
    echo "Netlist $GPDK45_FAST_LIB_NAME Simulation: $RETVAL_FAST" >> $REPORTS_DIR/simulation_reports.txt
    exit 1
fi




# Check if fv folder exists
if [ -d "$WORKING_DIR/fv" ]; then
    rm -r "$WORKING_DIR/fv"
fi

# Check if waves.shm folder exists
if [ -d "$WORKING_DIR/waves.shm" ]; then
    rm -r "$WORKING_DIR/waves.shm"
fi

# Check if .simvision folder exists
if [ -d "$WORKING_DIR/.simvision" ]; then
    rm -r "$WORKING_DIR/.simvision"
fi

# Check if xcelium.d folder exists
if [ -d "$WORKING_DIR/xcelium.d" ]; then
    rm -r "$WORKING_DIR/xcelium.d"
    
fi

# Check if xrun.history folder exists
if [ -f "$WORKING_DIR/xrun.history" ]; then
    rm "$WORKING_DIR/xrun.history"
fi

# Check if xrun.key folder exists
if [ -f "$WORKING_DIR/xrun.key" ]; then
    rm "$WORKING_DIR/xrun.key"
fi

# Check if xrun.log folder exists
if [ -f "$WORKING_DIR/xrun.log" ]; then
    rm "$WORKING_DIR/xrun.log"
fi


