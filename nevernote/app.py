import numpy as np
from access_control import saveInfo, loadInfo, user_choice
import os

def enterData(files):
    
    # Opening file
    print("Write in nevernote:\n")
    with open(files, "a") as file:
        while True:
            print("Enter X to exit: \n")
            a = input()
            if a == "X":
                break
            file.writelines(a + '\n')

def readData(files):
    # Reading data
    print("Data\n")
    with open(files, "r") as file:
        lines = file.readlines()
        for line in lines:
            print(line, end="")

def addFile(a):
    
    with open("pvt_file.txt", "a") as file:
        file.write(a + ",")

def readFile(s):
    with open(s, 'r') as file:
        lines = file.read().split(",")
        print(lines)
    return lines

myFiles = "pvt_file.txt"

# Check if the file is empty and add a new file if it is
if os.path.getsize(myFiles) == 0:
    a = input("Enter file name: ")
    addFile(a)

readfile = ""
while True:
    askuser = int(input("Enter 1 to choose from existing file: \nEnter 2 for adding a new file: \nEnter 0 for exit: "))
    if askuser == 1:
        readfile = readFile(myFiles)
    elif askuser == 2:
        a = input("Enter file name: ")
        addFile(a)
    elif askuser == 0:
        print("Exiting....")
        break
    else:
        print("Wrong input. Enter again!")
        continue

collection = np.array(readfile, dtype='S')
if collection.size != 0:
    for i in np.nditer(collection):
        print(i)

file_index = int(input("Enter the file number you want to open: "))
files = collection[file_index].decode('utf-8')
if(os.path.getsize(files)!=0):
    print("your previous saved notes")
    readData(files)

enterData(files)
readData(files)
print("THANK YOU")