#!/bin/bash

export DESIGNS="multiplier32FP" ;# put here the name of current design
export USER=$USER;# put here YOUR user name at this machine
export PROJECT_DIR=${PWD}
export BACKEND_DIR=${PROJECT_DIR}/backend
export FRONTEND_DIR=${PROJECT_DIR}/frontend
export TECH_DIR=/home/tools/cadence/gpdk; # techonology dependant comand only valid for UFC guys. Uncomment this line if you are from UFC.
export HDL_NAME=${DESIGNS}
export VLOG_LIST="$BACKEND_DIR/synthesis/deliverables/${DESIGNS}.v  $BACKEND_DIR/synthesis/deliverables/${DESIGNS}_io.v  $BACKEND_DIR/synthesis/deliverables/${DESIGNS}_chip.v"
export LIB_DIR=${TECH_DIR}/gsclib045_svt_v4.4/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_svt_v4.4/gsclib045/timing
export LIB_VERILOG_FILES=${TECH_DIR}/gsclib045_svt_v4.4/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_svt_v4.4/gsclib045/verilog



# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <arg1> [-xrun_raw, -xrun_compiled, -xrun_sdf, -genus, -innovus, -clear_work]"
    exit 1
fi

if [ $1 == "-clear_work" ]; then
    # Para limpar a pasta de trabalho
    rm -r ${PROJECT_DIR}/frontend/work/*
    rm -r ${PROJECT_DIR}/backend/synthesis/work/*
    rm -r ${PROJECT_DIR}/backend/layout/work/*
    cp ${FRONTEND_DIR}/vetor.txt ${FRONTEND_DIR}/work/vetor.txt
fi

if [ $1 == "-clear_deliverables" ]; then
    # Para limpar a pasta de trabalho
    rm -r ${PROJECT_DIR}/backend/synthesis/deliverables/*
    rm -r ${PROJECT_DIR}/backend/layout/deliverables/*
fi

if [ $1 == "-clear_reports" ]; then
    # Para limpar a pasta de trabalho
    rm -r ${PROJECT_DIR}/backend/synthesis/reports/*
    rm -r ${PROJECT_DIR}/backend/layout/reports/*
fi

if [ $1 == "-touch_work" ]; then
    # Para limpar a pasta de trabalho
    touch ${PROJECT_DIR}/frontend/work/teste.txt
    touch ${PROJECT_DIR}/backend/synthesis/work/teste.txt
    touch ${PROJECT_DIR}/backend/layout/work/teste.txt
fi



if [ $1 == "-xrun_raw" ]; then
    # Para executar o XCELIUM
    cd ${PROJECT_DIR}/frontend/work
    ### run HDL
    xrun -timescale 1ns/10ps -64bit ${FRONTEND_DIR}/${DESIGNS}.sv ${FRONTEND_DIR}/${DESIGNS}_tb.sv -top ${DESIGNS}_tb -access +rwc
    # xrun -64bit ${FRONTEND_DIR}/${DESIGNS}.sv ${FRONTEND_DIR}/${DESIGNS}_tb.sv -top ${DESIGNS}_tb -access +rwc -gui
fi

if [ $1 == "-xrun_compiled" ]; then
    # Para executar o XCELIUM
    cd ${PROJECT_DIR}/frontend/work
    ### run netlist (logic synthesis)
    # xrun -64bit ${LIB_VERILOG_FILES}/slow_vdd1v0_basicCells.v ${PROJECT_DIR}/backend/synthesis/deliverables/${DESIGNS}.v ${FRONTEND_DIR}/${DESIGNS}_tb.sv -top ${DESIGNS}_tb -access +rwc -gui
    xrun -timescale 1ns/10ps -64bit ${LIB_VERILOG_FILES}/slow_vdd1v0_basicCells.v ${PROJECT_DIR}/backend/synthesis/deliverables/${DESIGNS}.v ${FRONTEND_DIR}/${DESIGNS}_tb.sv -top ${DESIGNS}_tb -access +rwc
fi

if [ $1 == "-xrun_sdf" ]; then
    # Para executar o XCELIUM
    cd ${PROJECT_DIR}/frontend/work
    ### run netlist (logic syntesis) with compiled SDF 
    xmsdfc -iocondsort -compile ${PROJECT_DIR}/backend/synthesis/deliverables/${DESIGNS}_worst.sdf && \
    xrun -timescale 1ns/10ps -mess -64bit -noneg_tchk ${LIB_VERILOG_FILES}/slow_vdd1v0_basicCells.v \
    ${PROJECT_DIR}/backend/synthesis/deliverables/${DESIGNS}.v ${FRONTEND_DIR}/${DESIGNS}_tb.sv -top ${DESIGNS}_tb \
    -access +rwc -sdf_cmd_file ${PROJECT_DIR}/frontend/sdf_cmd_file.cmd 
fi

if [ $1 == "-xrun_sdf_min_max" ]; then
    # Para executar o XCELIUM
    cd ${PROJECT_DIR}/frontend/work
    ### run netlist (logic syntesis) with compiled SDF for MIN
    xmsdfc -iocondsort -compile ${PROJECT_DIR}/backend/synthesis/deliverables/${DESIGNS}_worst.sdf && \
    xrun -timescale 1ns/10ps -mess -64bit -noneg_tchk ${LIB_VERILOG_FILES}/slow_vdd1v0_basicCells.v \
    ${PROJECT_DIR}/backend/synthesis/deliverables/${DESIGNS}.v ${FRONTEND_DIR}/${DESIGNS}_MIN_tb.sv -top ${DESIGNS}_tb \
    -access +rwc -sdf_cmd_file ${PROJECT_DIR}/frontend/sdf_cmd_file.cmd

    sleep 1

    ### run netlist (logic syntesis) with compiled SDF for MAX
    xmsdfc -iocondsort -compile ${PROJECT_DIR}/backend/synthesis/deliverables/${DESIGNS}_worst.sdf && \
    xrun -timescale 1ns/10ps -mess -64bit -noneg_tchk ${LIB_VERILOG_FILES}/slow_vdd1v0_basicCells.v \
    ${PROJECT_DIR}/backend/synthesis/deliverables/${DESIGNS}.v ${FRONTEND_DIR}/${DESIGNS}_MAX_tb.sv -top ${DESIGNS}_tb \
    -access +rwc -sdf_cmd_file ${PROJECT_DIR}/frontend/sdf_cmd_file.cmd
fi

if [ $1 == "-genus" ]; then
    # Para executar o GENUS
    cd ${PROJECT_DIR}/backend/synthesis/work
    # programa e carrega script para síntese automatizada
    genus -abort_on_error -lic_startup Genus_Synthesis -lic_startup_options Genus_Physical_Opt \
        -log ${BACKEND_DIR}/synthesis/work/genus/genus \
        -overwrite -files ${PROJECT_DIR}/backend/synthesis/scripts/${DESIGNS}.tcl
fi

if [ $1 == "-innovus" ]; then
    # Para executar o INNOVUS
    cd ${PROJECT_DIR}/backend/layout/work
    # innovus
    # innovus -stylus -log ${BACKEND_DIR}/synthesis/work/innovus/ -file ${PROJECT_DIR}/backend/layout/scripts/layout.tcl
    innovus -stylus -file ${PROJECT_DIR}/backend/layout/scripts/layout.tcl
fi









