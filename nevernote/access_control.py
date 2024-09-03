import numpy as np

def saveInfo():
    
    user =input("Enter the username: ")
    pswd=input("Enter the password: ")
    
    with open("usernames.txt", 'a') as file1, open("password.txt",'a')as file2:
        file1.write(user+"\n")
        file2.write(pswd+"\n")
        
        
def loadInfo(uname, passwd):
    with open("usernames.txt", 'r') as file1, open("password.txt",'r')as file2:
        user_arr=np.loadtxt("usernames.txt",dtype=str)
        pswd_arr=np.loadtxt("password.txt",dtype=str)
    
    if uname in user_arr and passwd in pswd_arr :
        
        print("successfully loged in")
    else:
        print("Sorry, Username does not exist -_-\n~signup~")
        saveInfo()