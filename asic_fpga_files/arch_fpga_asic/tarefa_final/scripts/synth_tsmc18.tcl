set working_dir $env(WORKING_DIR)
set netlist_dir $env(NETLIST_DIR)
set reports_dir $env(REPORTS_DIR)

puts "Working directory: $working_dir"
puts "Netlist directory: $netlist_dir"
puts "Reports directory: $reports_dir"


# read_lib library/slow.lib

# read_hdl source/ula8.sv

# elaborate ula8

# check_design -unresolved

# syn_gen

# syn_map

# syn_opt

# report area > reports/ula8_tsmc18_area.txt

# report power > reports/ula8_tsmc18_power.txt

# report gates > reports/ula8_tsmc18_gates.txt

# write_hdl > ula8_tsmc18_netlist.sv