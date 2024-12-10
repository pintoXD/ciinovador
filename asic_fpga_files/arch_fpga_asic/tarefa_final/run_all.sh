#!/bin/bash
export WORKING_DIR=$PWD


# Define the folder path
REPORTS_DIR="$WORKING_DIR/reports"

# Check if the folder exists
if [ ! -d "$REPORTS_DIR" ]; then
    mkdir -p "$REPORTS_DIR"
fi





