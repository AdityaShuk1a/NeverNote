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