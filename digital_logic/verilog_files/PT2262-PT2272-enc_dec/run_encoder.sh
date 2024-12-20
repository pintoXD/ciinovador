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


# Run Xcelium to compile the code.
# xrun -64bit ${ENCODER_PATH}/codificador_pt2262.sv ${ADDRESS_INTERPRETER_PATH}/addr_interpreter.sv \
#             ${ADDRESS_INTERPRETER_PATH}/comp_endereco.sv \
#             ${BIT_SIGNAL_GENERATOR_PATH}/bit_generator.sv \
#             ${OSCILLATOR_PATH}/clock_divider.sv

# xrun ${ENCODER_PATH}/codificador_pt2262_tb.sv ${ENCODER_PATH}/codificador_netlist.sv ${WORKING_DIR}/libs/fast_vdd1v2_basicCells.v ${ADDRESS_INTERPRETER_PATH}/addr_interpreter.sv ${ADDRESS_INTERPRETER_PATH}/comp_endereco.sv ${BIT_SIGNAL_GENERATOR_PATH}/bit_generator.sv ${OSCILLATOR_PATH}/clock_divider.sv +access+rw +gui
# xrun ${ENCODER_PATH}/codificador_pt2262_tb.sv ${ENCODER_PATH}/codificador_pt2262.sv ${ADDRESS_INTERPRETER_PATH}/addr_interpreter.sv ${ADDRESS_INTERPRETER_PATH}/comp_endereco.sv ${BIT_SIGNAL_GENERATOR_PATH}/bit_generator.sv ${OSCILLATOR_PATH}/clock_divider.sv +access+rw +gui

xrun -64bit ${ENCODER_PATH}/codificador_pt2262_tb.sv ${ENCODER_PATH}/codificador_pt2262.sv \
            ${ADDRESS_INTERPRETER_PATH}/addr_interpreter.sv \
            ${ADDRESS_INTERPRETER_PATH}/comp_endereco.sv \
            ${BIT_SIGNAL_GENERATOR_PATH}/bit_generator.sv \
            ${OSCILLATOR_PATH}/clock_divider.sv \
            +access+rw +gui \
            -s -input restore.tcl