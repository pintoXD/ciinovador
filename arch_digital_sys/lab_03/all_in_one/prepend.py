import os

# Directory containing the files
directory = "/home/otto/Documentos/repos/ciinovador/arch_digital_sys/lab_03/all_in_one"

# Text to add at the first line of each file
text_to_prepend = "`timescale 1ns/1ps\n"

# Iterate over each file in the directory
for filename in os.listdir(directory):
    file_path = os.path.join(directory, filename)
    if os.path.isfile(file_path):
        with open(file_path, 'r+') as file:
            content = file.read()
            file.seek(0, 0)
            file.write(text_to_prepend + content)
