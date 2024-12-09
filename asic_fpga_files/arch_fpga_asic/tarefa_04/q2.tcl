proc listLength {aList} {
    set count 0

    foreach element $aList {

        incr count 

    }
    return $count
}

# Instance of a list that will hold the random integers
set randomIntegersList [list]
set randomListLength [expr {int(rand()*10)}]

for {set i 0} {$i < $randomListLength} {incr i} {
    # Appending a random integer between 0 and 1000 to randomIntegersList
    # This process is repeated 10 times
    lappend randomIntegersList [expr {int(rand()*1000)}]
}

puts "Random integers list: $randomIntegersList"


set theLenght [listLength $randomIntegersList]

puts "Lenght of the list: $theLenght"
