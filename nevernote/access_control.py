import numpy as np
from db_connection import db_connect
import psycopg2




# hostname = 
# # database = 'NeverNote'
# users = 
# passwd = 
# hostt = 




def saveInfo():
    
    user =input("Enter the username: ")
    pswd=input("Enter the password: ")
    
   
    query = 'insert into signup(name, password) values(%s,%s)'
    values = (user, pswd)
    db_connect(query, values)



def loadInfo(uname, passwd):
    
            
            
    with open("usernames.txt", 'r') as file1, open("password.txt",'r')as file2:
        user_arr=np.loadtxt("usernames.txt",dtype=str)
        pswd_arr=np.loadtxt("password.txt",dtype=str)

    if uname in user_arr and passwd in pswd_arr :

        print("successfully loged in")
    else:
        print("Sorry, Username does not exist -_-\n~signup~")
        saveInfo()