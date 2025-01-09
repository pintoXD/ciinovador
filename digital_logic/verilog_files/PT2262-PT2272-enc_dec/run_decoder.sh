#!/bin/bash

# Set the working directory
export WORKING_DIR=${PWD}

# Set the path to the address interpreter module
export ADDRESS_INTERPRETER_PATH=${WORKING_DIR}/addr_interpreter

# Set the path to the bit signal generator module
export BIT_SIGNAL_GENERATOR_PATH=${WORKING_DIR}/bit_gen

# Set the path to the oscillator module
export OSCILLATOR_PATH=${WORKING_DIR}/oscillator

# Set the path to the shift register module
export BIDIR_SHIFTREG=${WORKING_DIR}/bidir_shift_register

# Set the path to the encoder
export ENCODER_PATH=${WORKING_DIR}/encoder

# Set the path to the decoder
export DECODER_PATH=${WORKING_DIR}/decoder


# Run Xcelium to compile the code.

xrun -64bit ${DECODER_PATH}/decodificador_pt2272_tb.sv ${DECODER_PATH}/decodificador_pt2272.sv \
            ${ENCODER_PATH}/codificador_pt2262.sv \
            ${ADDRESS_INTERPRETER_PATH}/addr_interpreter.sv \
            ${ADDRESS_INTERPRETER_PATH}/comp_endereco.sv \
            ${BIT_SIGNAL_GENERATOR_PATH}/bit_generator.sv \
            ${OSCILLATOR_PATH}/clock_divider.sv \
            ${BIDIR_SHIFTREG}/bidir_shiftreg.sv \
            +access+rw +gui \
            -s -input restore_dec.tcl