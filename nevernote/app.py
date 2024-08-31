import numpy as np
import os

def enterData(files):
    
    #opening file
    print("write in nevernote:\n")
    
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

def addFile( a):
    with open("pvt_file.txt", "a") as file:
        file.write(a + ",")

    with open("pvt_file.txt", '+a') as file:
        while(a!="\n"):
            file.write(a+",")

def readFile(s):
    with open(s, "r") as file:
        lines = file.readlines()
        lines = lines.split(",")
    return np.array(lines)
    

collection= np.array([],dtype='S')

if( os.path.getsize("pvt_file.txt")==0 ):
    a=input("Enter file name: ")
    addFile(a)

else:
    
    while (askuser!=0 or collection.size !=0):
        askuser = int(input("Enter 1 to choose from existing file: \nEnter 2 for adding a new file: \nEnter 0 for exit"))
        if(askuser == 1):
            collection = readFile("pvt_file.txt")
                        
        elif(askuser == 2):
            a=input("Enter file name: ")
            addFile(a)
            
        else:
            print("wrong input Enter again!")
            continue
    if (collection.size!=0){
        for i in np.nditer(collection):
            print(i)
    }
    file_index = int(input("Enter the file number you want to open: "))
    files = collection[file_index]
    enterData(files)
    readData(files)    
            
    
    
    


        
        
