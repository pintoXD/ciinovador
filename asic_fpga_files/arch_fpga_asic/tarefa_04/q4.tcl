
set netlistFile [open "counter_netlist.v" r]
set moduleInputs ""
set moduleOutputs ""

while { [gets $netlistFile line] >= 0} {
    if {[string first "input" $line] != -1} {
        set moduleInputs $line
    }

    if {[string first "output" $line] != -1} {
        set moduleOutputs $line
        break
    }
    
}

puts "Finished reading the netlist file\n\n"
close $netlistFile

#Counts the number of inputs.
#This statement ignores "input" word and any array "[N:0]" format.
#It only counts words with letters from a to z (case insensitive).
set countInputs 0
foreach word $moduleInputs {
    if {[string first "input" $word] != -1} {
        continue
    }

    if {[regexp {(?i)[a-z]} $word]} {
        incr countInputs
    }
}


#Counts the number of outputs.
#This statement ignores "output" word and any array "[N:0]" format.
#It only counts words with letters from a to z (case insensitive).
set countOutputs 0
foreach word $moduleOutputs {
    if {[string first "output" $word] != -1} {
        continue
    }

    if {[regexp {(?i)[a-z]} $word]} {
        incr countOutputs
    }
    
}

puts "Inputs List: [string trim [string map {"input" ""} $moduleInputs] " ;"]"
puts "Number of inputs: $countInputs\n"

puts "Outputs List: [string trim [string map {"output" ""} $moduleOutputs] " ;"]"
puts "Number of outputs: $countOutputs"
