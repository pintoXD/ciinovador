gedit *.sv & 
echo  "================================================="
#xrun -gui -timescale 1ns/10ps -linedebug -access +rw SPRAM256X8.v tb_sram*.sv
xrun -gui -timescale 1ns/10ps -linedebug -access +rw SPRAM256X8.v *design*.sv
