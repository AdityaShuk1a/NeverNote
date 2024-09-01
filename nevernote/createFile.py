import numpy as np
def addFile(a):
    
    with open("pvt_file.txt", "a") as file:
        file.write(a + ",")
    with open(a, 'a') as file:
        file.write("created successfully" + "\n" )

def readFile(s):
    # with open(s, 'r') as file:
    #     lines = file.read().split(",")
    #     print(lines)
        
    lines = np.loadtxt(s,dtype = 'S', delimiter= ",")
    return lines