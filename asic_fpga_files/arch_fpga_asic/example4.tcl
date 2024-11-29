
set ListName [list orange red blue violet green]

foreach a $ListName {

	puts "value of a: $a"
	if {$a == "blue"} {
		puts "Blue found. Exiting"
		break
	}
}

puts "end"
