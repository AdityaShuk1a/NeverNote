import numpy as np

import psycopg2




# hostname = 
# # database = 'NeverNote'
# users = 
# passwd = 
# hostt = 




def saveInfo():
    
    user =input("Enter the username: ")
    pswd=input("Enter the password: ")
    
    # with open("usernames.txt", 'a') as file1, open("password.txt",'a')as file2:
    #     file1.write(user+"\n")
        #     file2.write(pswd+"\n")
    conn = None
    cur = None


    try:

        conn = psycopg2.connect(
            host = 'localhost',
            dbname = 'NeverNote',
            user = 'postgres',
            password = 'kalisto',
            port = 5432

        )
        cur = conn.cursor()
        create_table = '''create table if not exists SignUp(
                            name varchar(100) not null,
                            password varchar(100) not null)'''
        cur.execute(create_table)
        conn.commit()

        first_query = '''INSERT INTO SignUp (Name, Password) values(%s,%s)'''
        insertValues = (user, pswd)
        cur.execute(first_query, insertValues)
        conn.commit()
        print("Data inserted successfully")

    except psycopg2.DatabaseError as error:
        print(error)
    finally:
        if cur is not None:
            cur.close()
        if conn is not None:
            conn.close()



def loadInfo(uname, passwd):
    
    conn = None
    cur = None


    try:

        conn = psycopg2.connect(
            host = 'localhost',
            dbname = 'NeverNote',
            user = 'postgres',
            password = 'kalisto',
            port = 5432

        )
        cur = conn.cursor()
        create_table = '''create table if not exists SignUp(
                            name varchar(100) not null,
                            password varchar(100) not null)'''
        cur.execute(create_table)
        conn.commit()

        first_query = '''INSERT INTO SignUp (Name, Password) values(%s,%s)'''
        insertValues = (user, pswd)
        cur.execute(first_query, insertValues)
        conn.commit()
        print("Data inserted successfully")

    except psycopg2.DatabaseError as error:
        print(error)
    finally:
        if cur is not None:
            cur.close()
        if conn is not None:
            conn.close()
            
            
    # with open("usernames.txt", 'r') as file1, open("password.txt",'r')as file2:
    #     user_arr=np.loadtxt("usernames.txt",dtype=str)
    #     pswd_arr=np.loadtxt("password.txt",dtype=str)

    # if uname in user_arr and passwd in pswd_arr :

    #     print("successfully loged in")
    # else:
    #     print("Sorry, Username does not exist -_-\n~signup~")
    #     saveInfo()