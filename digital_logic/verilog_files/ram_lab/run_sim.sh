#SPRAM256X8.v file must be in the same folder as the others system verilog files.
write_tcl_file()
{
    echo "

# XM-Sim Command File
# TOOL:	xmsim(64)	22.09-s013
#
#
# You can restore this configuration with:
#
#      xrun -64bit ram_writer_tb.sv ram_writer.sv SPRAM256X8.v +gui +access+rw -input otto.tcl
#

set tcl_prompt1 {puts -nonewline \"xcelium> \"}
set tcl_prompt2 {puts -nonewline \"> \"}
set vlog_format %h
set vhdl_format %v
set real_precision 6
set display_unit auto
set time_unit module
set heap_garbage_size -200
set heap_garbage_time 0
set assert_report_level note
set assert_stop_level error
set autoscope yes
set assert_1164_warnings yes
set pack_assert_off {}
set severity_pack_assert_off {note warning}
set assert_output_stop_level failed
set tcl_debug_level 0
set relax_path_name 1
set vhdl_vcdmap XX01ZX01X
set intovf_severity_level ERROR
set probe_screen_format 0
set rangecnst_severity_level ERROR
set textio_severity_level ERROR
set vital_timing_checks_on 1
set vlog_code_show_force 0
set assert_count_attempts 1
set tcl_all64 false
set tcl_runerror_exit false
set assert_report_incompletes 0
set show_force 1
set force_reset_by_reinvoke 0
set tcl_relaxed_literal 0
set probe_exclude_patterns {}
set probe_packed_limit 4k
set probe_unpacked_limit 16k
set assert_internal_msg no
set svseed 1
set assert_reporting_mode 0
set vcd_compact_mode 0
alias . run
alias quit exit
database -open -vcd -into ram_writer_tb.vcd _ram_writer_tb.vcd1 -timescale fs
database -open -evcd -into ram_writer_tb.vcd _ram_writer_tb.vcd -timescale fs
database -open -shm -into waves.shm waves -default
probe -create -database waves ram_writer_tb.clk ram_writer_tb.fim ram_writer_tb.reset ram_writer_tb.x ram_writer_tb.DUT.U1.sub1.RAM_matrix

simvision -input otto.tcl.svcf
" > otto.tcl


}

write_tcl_svcf()
{
    echo "
# SimVision Command Script (Mon Dec 09 09:30:30 AM -03 2024)
#
# Version 22.09.s013
#
# You can restore this configuration with:
#
#      xrun -64bit ram_writer_tb.sv ram_writer.sv SPRAM256X8.v +gui +access+rw -input otto.tcl
#


#
# Preferences
#
preferences set toolbar-Standard-WatchWindow {
  usual
  shown 0
}
preferences set waveform-print-variables selected
preferences set waveform-print-time range
preferences set plugin-enable-svdatabrowser-new 1
preferences set toolbar-Windows-WatchWindow {
  usual
  shown 0
}
preferences set toolbar-sendToIndago-WaveWindow {
  usual
  position -pos 1
}
preferences set waveform-print-paper {A4 (210mm x 297mm)}
preferences set toolbar-Standard-Console {
  usual
  position -pos 1
}
preferences set toolbar-Search-Console {
  usual
  position -pos 2
}
preferences set plugin-enable-groupscope 0
preferences set sb-display-values 1
preferences set plugin-enable-interleaveandcompare 0
preferences set plugin-enable-waveformfrequencyplot 0
preferences set toolbar-SimControl-WatchWindow {
  usual
  shown 0
}
preferences set toolbar-TimeSearch-WatchWindow {
  usual
  shown 0
}

#
# Simulator
#
database require simulator -hints {
	simulator \"xrun -64bit ram_writer_tb.sv ram_writer.sv SPRAM256X8.v +gui +access+rw -input otto.tcl\"
}

#
# Mnemonic Maps
#
mmap new  -reuse -name {Boolean as Logic} -radix %b -contents {{%c=FALSE -edgepriority 1 -shape low}
{%c=TRUE -edgepriority 1 -shape high}}
mmap new  -reuse -name {Example Map} -radix %x -contents {{%b=11???? -bgcolor orange -label REG:%x -linecolor yellow -shape bus}
{%x=1F -bgcolor red -label ERROR -linecolor white -shape EVENT}
{%x=2C -bgcolor red -label ERROR -linecolor white -shape EVENT}
{%x=* -label %x -linecolor gray -shape bus}}

#
# Design Browser windows
#
if {[catch {window new WatchList -name \"Design Browser 1\" -geometry 730x500+2241+211}] != \"\"} {
    window geometry \"Design Browser 1\" 730x500+2241+211
}
window target \"Design Browser 1\" on
browser using {Design Browser 1}
browser set -scope [subst  {[format {ram_writer_tb.DUT.U1.sub1}]} ]
browser set \
    -signalsort name
browser yview see [subst  {[format {ram_writer_tb.DUT.U1.sub1}]} ]
browser timecontrol set -lock 0

#
# Waveform windows
#
if {[catch {window new WaveWindow -name \"Waveform 1\" -geometry 1010x600+2014+182}] != \"\"} {
    window geometry "Waveform 1" 1010x600+2014+182
}
window target \"Waveform 1\" on
waveform using {Waveform 1}
waveform sidebar visibility partial
waveform set \
    -primarycursor TimeA \
    -signalnames name \
    -signalwidth 175 \
    -units ps \
    -valuewidth 75
waveform baseline set -time 0

set id [waveform add -signals [subst  {
	{[format {ram_writer_tb.clk}]}
	} ]]
set id [waveform add -signals [subst  {
	{[format {ram_writer_tb.fim}]}
	} ]]
set id [waveform add -signals [subst  {
	{[format {ram_writer_tb.reset}]}
	} ]]
set id [waveform add -signals [subst  {
	{[format {ram_writer_tb.x[7:0]}]}
	} ]]
set id [waveform add -signals [subst  {
	{[format {ram_writer_tb.DUT.U1.sub1.RAM_matrix[0:255]}]}
	} ]]

waveform xview limits 0 2140000ps

#
# Waveform Window Links
#

#
# Memory Viewer windows
#
if {[catch {window new MemViewer -name \"Memory Viewer 1\" -geometry 700x500+3005+226}] != \"\"} {
    window geometry \"Memory Viewer 1\" 700x500+3005+226
}
window target \"Memory Viewer 1\" on
memviewer using {Memory Viewer 1}
memviewer set \
-primarycursor TimeA \
-units ps \
-radix default \
-addressradix default \
-addressorder MSBtoLSB

memviewer add [subst  {[format {ram_writer_tb.DUT.U1.sub1.RAM_matrix[0:255]}]} ]

memviewer sidebar visibility partial

#
# Console windows
#
console set -windowname Console
window geometry Console 730x250+2166+726

#
# Layout selection
#

" > otto.tcl.svcf




}




#xrun -64bit ram_writer_tb.sv ram_writer.sv SPRAM256X8.v +gui +access+rw -input restore.tcl
if [ -e SPRAM256X8.v ]
then
    echo "SPRAM file found. Proceeding..."
    sleep 1
    write_tcl_file
    sleep 1
    write_tcl_svcf
    sleep 1
   #xrun -64bit ram_writer_tb.sv ram_writer.sv SPRAM256X8.v +gui +access+rw
   xrun -64bit ram_writer_tb.sv ram_writer.sv SPRAM256X8.v +gui +access+rw -input otto.tcl
else
    echo "SPRAM256X8.v file not found. Please, copy this file to the root of the current directory and try again."
    
fi