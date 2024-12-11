# Running tests from ula8_tb.sv that instantiates the ula8.sv module
# set cmd "xrun -64bit $SOURCE_DIR/ula8_tb.sv $SOURCE_DIR/ula8.sv"
set cmd "sleep 2"
# set retval [eval $cmd]
set result 999
set retval [catch { exec ls} result]

puts $result

puts $retval