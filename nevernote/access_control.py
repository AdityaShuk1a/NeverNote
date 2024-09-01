import os
import numpy as np
def saveInfo():
    while 1:
        user =input("Enter the username: ")
        pswd=input("Enter the password: ")
        
        with open(user_data, "a") as file1, open(pswd_data,"a")as file2:
            file1.write(user+"\n")
            file2.write(pswd+"\n")
            flag=int(input("~Enter 1 to continue or  0 to exit~\n"))
            if(flag==0):
                break  
        
def loadInfo(uname):
     # with open(user_data, "r") as file1, open(pswd_data,"r")as file2:
    user_arr=np.loadtxt(user_data,dtype=str)
    pswd_arr=np.loadtxt(pswd_data,dtype=str)
    
    if uname in user_arr:
        pos= list(user_arr).index(uname)
        print("~The password is: ~\n")
        print(pswd_arr[pos])
    else:
        print("Sorry, Username does not exist -_-\n~Try again~")
       
def user_choice(choice):
    match choice:
        case 1:
            saveInfo()
        case 2:
            uname=input("~Enter the username to retrieve password~")
            loadInfo(uname)
        case _:
            print("Invalid choice. \nEnter 1 or 2\n")
user_data="usernames.txt";
pswd_data="password.txt";
# with open(user_data, "w") as file:
#     pass
# with open(pswd_data, "w") as file:
#     pass
option=int(input("~~ENTER YOUR CHOICE~~\n1 for saving username and password\n\n2 for finding the password for the username\n\n0 to EXIT\n"))
while(option!=0):
    user_choice(option)
    option=int(input("~~ENTER YOUR CHOICE~~\n1 for saving username and password\n\n2 for finding the password for the username\n\n0 to EXIT\n"))
