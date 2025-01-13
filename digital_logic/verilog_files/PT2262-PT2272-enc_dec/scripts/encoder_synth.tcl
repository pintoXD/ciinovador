set working_dir $env(WORKING_DIR)
set address_interpreter_dir $env(ADDRESS_INTERPRETER_PATH)
set bit_signal_generator_dir $env(BIT_SIGNAL_GENERATOR_PATH)
set oscillator_dir $env(OSCILLATOR_PATH)
set encoder_dir $env(ENCODER_PATH)
set libs_dir $env(LIBS_PATH)
set scripts_dir $env(SCRIPTS_PATH)
set logs_dir $env(LOGS_PATH)
set reports_dir $env(REPORTS_PATH)

puts "Reading libraries and design files..."
set lib_file "$libs_dir/fast_vdd1v2_basicCells.lib"
read_lib $lib_file

read_hdl -sv \
     $encoder_dir/codificador_pt2262.sv \
     $bit_signal_generator_dir/bit_generator.sv \
     $oscillator_dir/clock_divider.sv \
     $address_interpreter_dir/addr_interpreter.sv

# Elaborate the codificador_pt2262 module
puts "Elaborating the design..."
elaborate codificador_pt2262

# Check for unresolved references
puts "Checking for unresolved references..."
check_design -unresolved

# Perform synthesis
puts "Performing synthesis..."
syn_gen
syn_map
syn_opt

# Reports generation
puts "Generating reports..."
report sequential > "$reports_dir/encoder_sequential.txt"
report area > "$reports_dir/encoder_area.txt"
report power > "$reports_dir/encoder_power.txt"
report gates > "$reports_dir/encoder_gates.txt"

# Write the netlist
puts "Writing the netlist..."
write_netlist > "$encoder_dir/codificador_pt2262_mapped.sv"

# Write the SDF file
puts "Writing the sdf..."
write_sdf > "$encoder_dir/codificador_pt2262.sdf"

# Quit the tool
exit