proc sum args {
	set s 0

	foreach i $args {
		incr s $i
	}
	return $s
}

set a [sum 1 2 3 4 5]
puts $a

set b {4 5 6}
set a [sum 1 2 3 $b]
puts $a
