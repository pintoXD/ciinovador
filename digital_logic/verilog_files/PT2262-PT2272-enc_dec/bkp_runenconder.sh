#!/bin/bash

# Set the working directory
export WORKING_DIR=${PWD}

# Set the path to the address interpreter module
export ADDRESS_INTERPRETER_PATH=${WORKING_DIR}/addr_interpreter

# Set the path to the bit signal generator module
export BIT_SIGNAL_GENERATOR_PATH=${WORKING_DIR}/bit_gen

# Set the path to the oscillator module
export OSCILLATOR_PATH=${WORKING_DIR}/oscillator

# Set the path to the encoder
export ENCODER_PATH=${WORKING_DIR}/encoder


# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <arg1> [xrun_raw or xrun_synth]"
    exit 1
fi


if [ "$1" == "xrun_raw" ]; then
    #Run for simulation
    echo "Running simulation with the raw source code..."
    sleep 1
    xrun -64bit ${ENCODER_PATH}/codificador_pt2262_tb.sv ${ENCODER_PATH}/codificador_pt2262.sv \
            ${ADDRESS_INTERPRETER_PATH}/addr_interpreter.sv \
            ${ADDRESS_INTERPRETER_PATH}/comp_endereco.sv \
            ${BIT_SIGNAL_GENERATOR_PATH}/bit_generator.sv \
            ${OSCILLATOR_PATH}/clock_divider.sv \
            +access+rw +gui \
            -s -input restore.tcl
elif [ "$1" == "xrun_synth" ]; then
    echo "Running simulation with synthesized code..."
    sleep 1
    xrun -64bit ${ENCODER_PATH}/codificador_pt2262_tb.sv ${ENCODER_PATH}/codificador_pt2262.v \

        ${ADDRESS_INTERPRETER_PATH}/comp_endereco.sv \
        ${BIT_SIGNAL_GENERATOR_PATH}/bit_generator.sv \
        ${OSCILLATOR_PATH}/clock_divider.sv \
        +access+rw +gui \
        # -s -input restore.tcl
else
    echo "Invalid argument. Usage: $0 <arg1> [simulation or synthesis]"
    exit 1
fi

