set working_dir $env(WORKING_DIR)
set source_dir $env(SOURCE_DIR)
set lib_dir $env(LIB_DIR)
set logs_dir $env(LOGS_DIR)
set netlist_dir $env(NETLIST_DIR)
set reports_dir $env(REPORTS_DIR)

set tech_list [list "tsmc18_slow" "gpdk45_slow" "gpdk45_fast"]
array set tech_lib_names {
    tsmc18_slow "slow.lib"
    gpdk45_slow "slow_vdd1v0_basicCells.lib"
    gpdk45_fast "fast_vdd1v0_basicCells.lib"
}

set tech "gpdk45_slow"

puts "Reading libraries and design files..."
set lib_file "$lib_dir/$tech_lib_names($tech)"
read_lib $lib_file
read_hdl -sv $source_dir/ula8.sv

# Elaborate the ULA8 module
puts "Elaborating the design..."
elaborate ula8

# Check for unresolved references
puts "Checking for unresolved references..."
check_design -unresolved

# Perform synthesis
puts "Performing synthesis..."
syn_gen
syn_map
syn_opt

# Generate Reports
puts "Generating reports..."
set tech_report_dir "$reports_dir/${tech}"
if {![file isdirectory $tech_report_dir]} {
    file mkdir $tech_report_dir
    puts "Directory created: $tech_report_dir"
} else {
    puts "Directory already exists: $tech_report_dir"
}

report area > "$tech_report_dir/ula8_${tech}_area.txt"
report power > "$tech_report_dir/ula8_${tech}_power.txt"
report gates > "$tech_report_dir/ula8_${tech}_gates.txt"

# Write the netlist
puts "Writing the netlist..."

set tech_netlist_dir "$netlist_dir/${tech}"
if {![file isdirectory $tech_netlist_dir]} {
    file mkdir $tech_netlist_dir
    puts "Directory created: $tech_netlist_dir"
} else {
    puts "Directory already exists: $tech_netlist_dir"
}

write_netlist > "$tech_netlist_dir/ula8_${tech}_netlist.v"

exit