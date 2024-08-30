import numpy as np

mines = np.random.choice([0,1], size = (5,5), p = [0.2,0.8])
star = np.random.choice(['*'], size = (5,5))

def checker(star, mines, your_Choice, your_Choice2):
    
    if star[your_Choice, your_Choice2] == '1':
        print("You have already choosen that number!!")
    
    else:   
        print("+1")

cashout = 1
print(mines)
print(star)

while (cashout == 1):
    
    your_Choice = int(input("Enter row"))
    your_Choice2 = int(input("Enter element"))
    
    if your_Choice >= 5 or your_Choice2 >=5:
        print("Invalid input try again")
        cashout = int(input("Do you want to play more?: "))
    
    else:
        match (mines[your_Choice, your_Choice2]):
            case 0:
                print("Ola HU Uber!!")
                break
            case 1:
                flag = 1
                checker(star, mines, your_Choice, your_Choice2)

        cashout = int(input("Do you want to play more?: "))

        if flag == 1:
            star[your_Choice, your_Choice2] = mines[your_Choice, your_Choice2]

        print(star)
    
    


    
    
    
    
            
        
        

