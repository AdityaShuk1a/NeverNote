from access_control import saveInfo, loadInfo

def user_choice():
   
    option=1
   
    while(option!=0):
   
        option=int(input("~~ENTER YOUR CHOICE~~\n1 for Signup\n\n2 for Login\n\n3 for Forgot Password\n\n0 to EXIT\n"))
        match option:
            case 1:
                saveInfo()
            case 2:
                uname=input("~Enter the username~")
                passwd=input("~Enter the password~")
                loadInfo(uname, passwd)
            case 3:
                uname=input("~Enter the username~")
                loadInfo(uname)
            case _:
                print("Invalid choice. \nEnter 1 or 2\n")
