puts "Hello world!"
set a {blue red green violet orange}
puts $a

#exit

set b {}

# get list length
set i [expr [llength $a] - 1]

puts "value of i = $i"

set id [lindex $a 2]
puts "value of lindex a\[2\] is $id"

while {$i >= 0} {
lappend b [lindex $a $i]
incr i -1
}
puts $b
