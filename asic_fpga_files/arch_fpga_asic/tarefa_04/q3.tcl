set inputString "Arquitetura FPGA ASIC Inovador Circuito Integrado VLSI Microelectronics CMOS System-Verilog"


# Opening the file
set theFile [open "q3_dummy.txt" w]

# Writing the inputString to the file
puts $theFile $inputString

# Closing the file
close $theFile

# Opening the file again
set fileForReading [open "q3_dummy.txt" r]

# Reading file content
gets $fileForReading readFileContent

# Closing the file again
close $fileForReading

puts "Read file content: $readFileContent"

#Splitting the file content into a new list
set splittedFileContentList [split $readFileContent " "]
#Sorting the splitted file content into a new list
set sortedFileContent [lsort $splittedFileContentList]

puts "Sorted file content: $sortedFileContent"