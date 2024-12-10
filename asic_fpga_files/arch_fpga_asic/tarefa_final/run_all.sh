#!/bin/bash
export WORKING_DIR=$PWD


# Define the folder path
REPORTS_DIR="$WORKING_DIR/reports"

# Netlist output directory
NETLIST_DIR="$WORKING_DIR/netlist"

# Check if REPORTS_DIR the folder exists
if [ ! -d "$REPORTS_DIR" ]; then
    mkdir -p "$REPORTS_DIR"
fi

# Check if NETLIST_DIR the folder exists
if [ ! -d "$NETLIST_DIR" ]; then
    mkdir -p "$NETLIST_DIR"
fi

#running tests from ula8_tb.sv that instantiates the ula8.sv module
xrun -64bit ula8_tb.sv ula8.sv
RETVAL=$?

# Check if the simulation was successful
if [ $RETVAL -eq 0 ]; then
    echo "Simulation successful"
else
    echo "Simulation failed"
fi

# Launching genus synthesis tool
genus -f scripts/synth_tsmc18.tcl






