#!/bin/bash

# Set the working directory
export WORKING_DIR=$PWD

# Set the path to the address interpreter module
export ADDRESS_INTERPRETER_PATH="$WORKING_DIR/addr_interpreter"

# Set the path to the bit signal generator module
export BIT_SIGNAL_GENERATOR_PATH="$WORKING_DIR/bit_gen"

# Set the path to the oscillator module
export OSCILLATOR_PATH="$WORKING_DIR/oscillator"

# Set the path to the encoder
export ENCODER_PATH="$WORKING_DIR/encoder"

# Set the path to the libs
export LIBS_PATH="$WORKING_DIR/libs"

# Set the path to scripts
export SCRIPTS_PATH="$WORKING_DIR/scripts"

# Set the path to logs directory
export LOGS_PATH="$WORKING_DIR/logs"

# Define the reports folder path
export REPORTS_PATH="$WORKING_DIR/reports"

# Set the path to the decoder
export DECODER_PATH="$WORKING_DIR/decoder"

# Set the path to the shift register module
export BIDIR_SHIFTREG_PATH="$WORKING_DIR/bidir_shift_register"

# Check if the logs directory exists. If not it not exists, create it.
if [ ! -d "$LOGS_PATH" ]; then
  mkdir -p $LOGS_PATH
fi

# Check if REPORTS_PATH the folder exists
if [ ! -d "$REPORTS_PATH" ]; then
    mkdir -p "$REPORTS_PATH"
fi

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <arg1> [xrun_raw, xrun_synth, xrun_compile, genus]"
    exit 1
fi

# Run Xcelium to compile the code.

# xrun -64bit ${DECODER_PATH}/decodificador_pt2272_tb.sv ${DECODER_PATH}/decodificador_pt2272.sv \
#             ${ENCODER_PATH}/codificador_pt2262.sv \
#             ${ADDRESS_INTERPRETER_PATH}/addr_interpreter.sv \
#             ${ADDRESS_INTERPRETER_PATH}/comp_endereco.sv \
#             ${BIT_SIGNAL_GENERATOR_PATH}/bit_generator.sv \
#             ${OSCILLATOR_PATH}/clock_divider.sv \
#             ${BIDIR_SHIFTREG}/bidir_shiftreg.sv \
#             +access+rw +gui \
#             -s -input restore_dec.tcl




if [ "$1" == "xrun_raw" ]; then
    #Run for simulation
    echo "Running simulation with the raw source code..."
    xrun -64bit ${DECODER_PATH}/decodificador_pt2272_tb.sv ${DECODER_PATH}/decodificador_pt2272.sv \
            ${ENCODER_PATH}/codificador_pt2262.sv \
            ${ADDRESS_INTERPRETER_PATH}/addr_interpreter.sv \
            ${ADDRESS_INTERPRETER_PATH}/comp_endereco.sv \
            ${BIT_SIGNAL_GENERATOR_PATH}/bit_generator.sv \
            ${OSCILLATOR_PATH}/clock_divider.sv \
            ${BIDIR_SHIFTREG_PATH}/bidir_shiftreg.sv \
            +access+rw +gui \
            -s -input restore_dec.tcl
elif [ "$1" == "xrun_compile" ]; then
    #Run for simulation
    xrun -compile -64bit ${DECODER_PATH}/decodificador_pt2272_tb.sv ${DECODER_PATH}/decodificador_pt2272.sv \
        ${ENCODER_PATH}/codificador_pt2262.sv \
        ${ADDRESS_INTERPRETER_PATH}/addr_interpreter.sv \
        ${ADDRESS_INTERPRETER_PATH}/comp_endereco.sv \
        ${BIT_SIGNAL_GENERATOR_PATH}/bit_generator.sv \
        ${OSCILLATOR_PATH}/clock_divider.sv \
        ${BIDIR_SHIFTREG_PATH}/bidir_shiftreg.sv
elif [ "$1" == "xrun_synth" ]; then
    echo "Running simulation with synthesized code..."
    xrun -64bit ${DECODER_PATH}/decodificador_pt2272_tb.sv ${DECODER_PATH}/decodificador_pt2272.v \
        ${LIBS_PATH}/fast_vdd1v2_basicCells.v \
        ${ENCODER_PATH}/codificador_pt2262.sv \
        ${ADDRESS_INTERPRETER_PATH}/addr_interpreter.sv \
        ${ADDRESS_INTERPRETER_PATH}/comp_endereco.sv \
        ${BIT_SIGNAL_GENERATOR_PATH}/bit_generator.sv \
        ${OSCILLATOR_PATH}/clock_divider.sv \
        ${BIDIR_SHIFTREG_PATH}/bidir_shiftreg.sv \
        +access+rw +gui
elif [ "$1" == "genus" ]; then
    echo "Running synthesis with genus..."
    sleep 1
    genus -log "$LOGS_PATH/decoder.log" -f $SCRIPTS_PATH/decoder_synth.tcl
else
    echo "Invalid argument. Usage: $0 <arg1> [simulation or synthesis]"
    exit 1
fi


