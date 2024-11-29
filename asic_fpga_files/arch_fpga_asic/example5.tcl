
puts "Hello tclsh"

proc decr {x {y 1}} {
	puts [expr $x - $y]
}

decr 10 20

decr 20
