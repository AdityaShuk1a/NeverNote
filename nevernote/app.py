import numpy as np
from access_control import  user_choice
import os
from accessFile import enterData, readData
from createFile import addFile, readFile





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

collection = readfile
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
print("THAnks")