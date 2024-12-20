# Cadence Genus(TM) Synthesis Solution, Version 21.10-p002_1, built Aug 20 2021 10:13:13

# Date: Fri Dec 20 13:15:55 2024
# Host: cinova05.lesc.ufc.br (x86_64 w/Linux 4.18.0-553.27.1.el8_10.x86_64) (14cores*20cpus*1physical cpu*13th Gen Intel(R) Core(TM) i5-13500 24576KB)
# OS:   Rocky Linux release 8.10 (Green Obsidian)

read_libs libs/fast_vdd1v2_basicCells.lib
read_hdl -sv encoder/codificador_pt2262.sv bit_gen/bit_generator.sv oscillator/clock_divider.sv
read_hdl -sv encoder/codificador_pt2262.sv bit_gen/bit_generator.sv oscillator/clock_divider.sv
clear
read_hdl -sv encoder/codificador_pt2262.sv bit_gen/bit_generator.sv oscillator/clock_divider.sv
elaborate
elaborate
read_hdl -sv encoder/codificador_pt2262.sv bit_gen/bit_generator.sv oscillator/clock_divider.sv
elaborate
syn_gen
syn_map
syn_opt
report_area
report area
write_hdl > encoder/codificador_netlist.sv
exit
