import numpy as np

#opening file

with open(files, "+a") as file:
    while a!="1":
        a = input()
        file.writelines(a + '\n')
        
# reading data

with open(files, "r") as file:
    lines = file.readlines()
    for line in lines:
        print(line, end="")
        
