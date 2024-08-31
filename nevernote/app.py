import numpy as np
import os

def addFile( a):
    with open("pvt_file.txt", "a") as file:
        file.write(a + ",")

    with open("pvt_file.txt", '+a') as file:
        while(a!="\n"):
            file.write(a+",")

collection= np.array([],dtype='S')

if( os.path.getsize("pvt_file.txt")==0 ):
    a=input("Enter file name: ")
    addFile(a)
else:
    aa=(int)input("Enter 1 for creating new file\nEnter 2 to open existing file\nEnter 0 to exit")
    while(!aa)
    
            
    collection=np.append(collection,a)