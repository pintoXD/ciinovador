set working_dir $env(WORKING_DIR)
set source_dir $env(SOURCE_DIR)
set lib_dir $env(LIB_DIR)
set logs_dir $env(LOGS_DIR)
set netlist_dir $env(NETLIST_DIR)
set reports_dir $env(REPORTS_DIR)

# set tscm18_slow "tsmc18_slow"
# set gpdk45_slow "gpdk45_slow"
# set gpdk45_fast "gpdk45_fast"

# puts "Working directory: $working_dir"
# puts "Library directory: $lib_dir"
# puts "Netlist directory: $netlist_dir"
# puts "Reports directory: $reports_dir"

puts "Reading libraries and design files..."
read_lib $lib_dir/slow.lib
read_hdl -sv $working_dir/source/ula8.sv

#Elaborate the ULA8 module
puts "Elaborating the design..."
elaborate ula8

#Check for unseresolved references
puts "Checking for unresolved references..."
check_design -unresolved

#Perform synthesis
puts "Performing synthesis..."
syn_gen
syn_map
syn_opt

#Generate Reports
puts "Generating reports..."
report area > $reports_dir/ula8_tsmc18_area.txt
report power > $reports_dir/ula8_tsmc18_power.txt
report gates > $reports_dir/ula8_tsmc18_gates.txt

#Write the netlist
puts "Writing the netlist..."
write_hdl > $netlist_dir/ula8_tsmc18_netlist.v

exit