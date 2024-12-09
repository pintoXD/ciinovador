# Instance of a list that will hold the random integers
set randomIntegersList [list] 

for {set i 0} {$i < 10} {incr i} {
    # Appending a random integer between 0 and 1000 to randomIntegersList
    # This process is repeated 10 times
    lappend randomIntegersList [expr {int(rand()*1000)}]
}

puts "Random integers list: $randomIntegersList" 

set sortedIntegersList [lsort -integer $randomIntegersList]

puts "Sorted integers list: $sortedIntegersList"