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


## Key files

### One script to rule them all
On the root of this directory we can find the `run_all.sh` file, a bash script that configures all the necessary environment variables and run all the syntehtis and simulations.
The the aforementioned reports and netlist folders are already populated by a firsr running of the `run_all.sh` script. To updated these directories contents, just run the command `./run_all.sh`.

### The other key files

The requested reports and netlist files were generated and are located and described below:

#### Reports
* `./reports/simulation_reports.txt`: A file describing the results of the simulation using original module source code and its netlists.
* `./reports/**/*_area.txt`: This pattern of files representes the area report created from a previoulsy generated synthesis, for a given technology;
* `./reports/**/*_gates.txt`: This pattern of files representes the gates report created from a previoulsy generated synthesis, for a given technology;
* `./reports/**/*_power.txt`: This pattern of files representes the power report created from a previoulsy generated synthesis, for a given technology;
* 
#### Netlist

* `./netlist/**/*_area.txt`: This pattern of files representes the verilog netlist created from a previoulsy generated synthesis, for a given technology;
* `./netlist/**/*_gates.txt`: This pattern of files representes the verilog netlist created from a previoulsy generated synthesis, for a given technology;
* `./netlist/**/*_power.txt`: This pattern of files representes the verilog netlist created from a previoulsy generated synthesis, for a given technology;

#### Scripts

* `./scripts/synth_tsmc18.tcl`: Used in the synthesis with `slow.lib`;
* `./scripts/synth_gpkd45_slow.tcl`: Used in the synthesis with `slow_vdd1v0_basicCells.lib`;
* `./scripts/synth_gpkd45_fast.tcl`: Used in the synthesis with `slow_vdd1v0_basicCells.lib`;

#### Source code

* `./source/ula8.sv`: Implementation in SystemVerilog of the requested 8-bit ALU;
* `./source/ula8_tb.sv`: Testbench of the requested 8-bit ALU;


### Disclaimers

Even though the verilog netlist file for `tsmc18` tecnology is created by running the `run_all.sh` executable, it is now possible to using it to run the `ula8_tb.sv`
testbench. This happens due to the missing verilog file that implements this library. 

That's why the simulations were ran only with the gpk45 libraries.