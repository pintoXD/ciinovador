onerror {resume}
noview .main_pane.structure .main_pane.library .main_pane.objects .main_pane.process
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -subitemconfig {/uvm_root/uvm_test_top/env_h/source_h/tr.t0 {-expand} /uvm_root/uvm_test_top/env_h/source_h/tr.t0.a {-radix decimal} /uvm_root/uvm_test_top/env_h/source_h/tr.t1 {-expand} /uvm_root/uvm_test_top/env_h/source_h/tr.t1.a {-radix decimal} /uvm_root/uvm_test_top/env_h/source_h/tr.t2 {-expand} /uvm_root/uvm_test_top/env_h/source_h/tr.t2.a {-radix decimal}} /uvm_root/uvm_test_top/env_h/source_h/tr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 186
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {250 ns}
