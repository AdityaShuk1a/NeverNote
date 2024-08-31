import numpy as np
def enterData(files):
    
    print("write in nevernote:\n")
    #opening file
    
    with open(files, "+a") as file:
        while a!="X":
            print("Enter X to exit: \n")
            a = input()
            file.writelines(a + '\n')

def readData(files):
    # reading data
    print("data\n")

    with open(files, "r") as file:
        lines = file.readlines()
        for line in lines:
            print(line, end="")
    
    

else:
    while askuser!=0:
        askuser = int(input("Enter 1 to choose from existing file: \nEnter 2 for adding a new file: \nEnter 0 for exit"))
        if(askuser == 1):
            readFile("pvt_file.txt")
                        
        elif(askuser == 2):
            addfile(a)
            
        else:
            print("wrong input Enter again!")
            continue
        
        
