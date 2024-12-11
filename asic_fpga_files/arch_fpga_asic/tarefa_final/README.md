# ASIC FPGA Final Lab

Final homework of ASIC FPGA.

## Requirements

To able to run the provided scripts, the environment variables for Cadence tools like genus, xcelium and virtuoso must be previously set. 
To check if everything's fine, please try to the mentioned softwares or take a look at your environment variables by running: `whereis genus` and `whereis xrun`. 

If the answers are not empty, the environment variables are set correctly.

## Directory Tree

This project is structured in folders. Each of it are briefly described below:

* `./library`: Contains the technology libraries and some of its Verilog implementations. The available libraries are:
  * `slow.lib`: TSCM18 library only with no Verilog implementation file;
  * `fast_vdd1v0_basicCells.lib` GPDK45 gsclib fast timing with its Verilog implementation called `fast_vdd1v0_basicCells.v`;
  * `slow_vdd1v0_basicCells.lib` GPDK45 gsclib slow timing with its Verilog implementation called `slow_vdd1v0_basicCells.v`;

* `./logs`: Stores some genus logs;

* `./netlist`: Where the resulting netlists from genus synthesis are stored. the following subdirectories are present:
  * `tsmc18_slow`: Subdirectory the stores the netlist generated from the synthesis using the `slow.lib`;
  * `gpdk45_slow`: Subdirectory the stores the netlist generated from the synthesis using the `slow_vdd1v0_basicCells.lib`;
  * `gpdk45_fast`: Subdirectory the stores the netlist generated from the synthesis using the `fast_vdd1v0_basicCells.lib`;

* `./reports`: Holds the area, power and gates Genus's reports for each one of the technologies being used. It has the following subdirectories:
  * `tsmc18_slow`: Subdirectory the stores the area, power and gate report generated from the synthesis using the `slow.lib`;
  * `gpdk45_slow`: Subdirectory the stores the area, power and gate report generated from the synthesis using the `slow_vdd1v0_basicCells.lib`;
  * `gpdk45_fast`: Subdirectory the stores the area, power and gate report generated from the synthesis using the `fast_vdd1v0_basicCells.lib`;
  * `simulation_reports.txt`: A file describing the results of the simulation using original module source code and its netlists.

* `./scripts`: Here are the TCL scripts used with Genus to generate the requested synthesis.  
  * `synth_tsmc18.tcl`: Used in the synthesis with `slow.lib`;
  * `synth_gpkd45_slow.tcl`: Used in the synthesis with `slow_vdd1v0_basicCells.lib`;
  * `synth_gpkd45_fast.tcl`: Used in the synthesis with `slow_vdd1v0_basicCells.lib`;

* `./source`: In this one are the source files from the requested Artithmetic Logic Unit. Below are the files:
  * `ula8.sv`: Implementation in SystemVerilog of the requested 8-bit ALU;
  * `ula8_tb.sv`: Testbench of the requested 8-bit ALU;