# This program is a final project for the Python 103 course offered
# by Satr Educational Academy. It simulates a banking system which offers:
# 1. Create a new account
# 2. View account statement
# 3. Check all account transactions
# 4. Deposit
# 5. Withdrawal
# 6. Upgrade to VIP



import os
import time
import datetime 

class Account:
    the_id = 0
    def __init__(self, name, Account_id=None, type="Standard", balance = 0):
        
        self.__name = name
        self.__type = type
        self._balance = balance
        if Account_id is not None:
            self.__Account_id = Account_id
        else:
            Account.the_id += 1
            self.__Account_id = Account.the_id

# getters for all attributes
    def get_ID(self):
        return self.__Account_id
    
    def get_name(self):
        return self.__name
    
    def get_type(self):
        return self.__type
    
    def get_balance(self):
        return self._balance

# deposit func  
    def deposit(self, amount):
        self._balance += amount

# withdrawal func
    def withdraw(self, amount):
        if self._balance >= amount:
            self._balance -= amount
            return True
        else:
            return False

class VIP(Account):
    def __init__(self, name, Account_id, type="VIP", balance=0):
        super().__init__(name,Account_id, type, balance)

    def withdraw(self, amount):
        if self._balance - amount >= -1000:
            self._balance -= amount
            return True
        else:
            return False
    
all_accounts = {}
upgrade_price = 50
transactions = {}


# create an account func
def create(name):
    obj = Account(name)
    all_accounts[obj.get_ID()] = obj
    return obj

# upgrade func
def upgrade(obj_id, amount):
        if  all_accounts[obj_id].withdraw(amount):
            Account_idv = VIP(name=all_accounts[obj_id].get_name(), Account_id=all_accounts[obj_id].get_ID(), balance=all_accounts[obj_id].get_balance())
            all_accounts[obj_id] = Account_idv
            return True
        else:
            return False

# check if input is number or not
def try_int(var):
    try:
      return int(var)
    except:
        return None
    
# clear func depend on os
def cls():
    if os.name == "nt":
        os.system("cls")
    else:
        os.system("clear")

# display transactions info
def deposite_info(amount):
    now = datetime.datetime.now()
    day = now.strftime("%A")
    date = now.strftime("%B %d, %Y")
    hour = now.strftime("%I:%M:%S")
    p = now.strftime("%p")
    return f"\n-- An amount of {amount} SAR has been deposited into your bank account on {day}, {date} at {hour} {p}."

def withdrawal_info(amount):
    now = datetime.datetime.now()
    day = now.strftime("%A")
    date = now.strftime("%B %d, %Y")
    hour = now.strftime("%I:%M:%S")
    p = now.strftime("%p")
    return f"\n-- An amount of {amount} SAR was withdrawn from your bank account on {day}, {date} at {hour} {p}."

def record(Account_id, func):
    if Account_id not in transactions:
        transactions[Account_id] = []
    transactions[Account_id].append(func)
    


print("\n*** Welcome to Python Bank ***")
while True:
# intro
    cls()
    print("\n1. create a new Account\n2. Account Statement\n3. Check all Account transactions\n4. Deposit\n5. Withdrawal\n6. Upgrade to VIP\n7. Exit")
    service = try_int(input("\nHow can I serve You? (Choose a number): "))
    if service is None:
        cls()
        print("*** Please Enter a valid number ***")
        time.sleep(1.3)
        continue
  
# add an account
    if service == 1:
        cls()
        name = input("Enter Your Name: ").capitalize()
        obj = create(name)
        cls()
        print(f"\n*** Your Account {obj.get_ID()} has successfully created ***")
        time.sleep(2.5)
        cls()

# check balance
    elif service == 2:
        cls()
        Account_id = try_int(input("\nEnter the ID: "))
        cls()
        if Account_id is None:
            print("\n********* ERROR *********\nPlease Enter a valid number next time")
            time.sleep(3)
            continue
        if Account_id in all_accounts:
            print(f"\n---- Your Account Info ----\n\nAccount ID: {all_accounts[Account_id].get_ID()}\nAccount Name: {all_accounts[Account_id].get_name()}\nAccount Type: {all_accounts[Account_id].get_type()}\nCurrent Balance: {all_accounts[Account_id].get_balance()}")
            input("\nEnter to return to the home page")
        else:
            print(f"\n*** There are not any account with id: {Account_id} ***")
            time.sleep(2.5)
            continue

# display all transactions
    elif  service == 3:
        cls()
        Account_id = try_int(input("\nEnter the ID: "))
        cls()
        if Account_id is None:
            print("\n********* ERROR *********\nPlease Enter a valid number next time")
            time.sleep(3)
            continue

        if Account_id in all_accounts:
            if Account_id in transactions:
                print(f"*** All the transactions***")
                for n in transactions[Account_id]:
                    print(n)
                input("\nEnter to return to the home page")
            else:
                print("You haven't make any transactions yet!")
                time.sleep(2)
                cls()
                continue


        else:
            print(f"\n*** There are not any account with id: {Account_id} ***")
            time.sleep(2.5)
            continue
   
        
# deposit
    elif service == 4:
        cls()
        Account_id = try_int(input("\nEnter the ID: "))
        if Account_id is None:
            cls()
            print("\n********* ERROR *********\nPlease Enter a valid number")
            time.sleep(2.5)
            continue
        if Account_id in all_accounts:
            amount = try_int(input("How much would you like to deposit? "))
            if amount is None:
                cls()
                print("\n********* ERROR *********\nPlease Enter a valid number next time")
                time.sleep(2.5)
                continue
            elif amount <= 0:
                cls()
                print("*** Amount must be greater than zero ***")
                time.sleep(1.3)
                continue

            all_accounts[Account_id].deposit(amount)
            massege = deposite_info(amount)
            record(Account_id, massege )
            print(massege)
            time.sleep(2.5)
            cls()
        else:
            cls()
            print(f"\n*** There are not any account with id: {Account_id} ***")
            time.sleep(2.5)

   
# withdrawsl
    elif service == 5:
        cls()
        Account_id = try_int(input("\nEnter the ID: "))
        if Account_id is None:
            cls()
            print("\n********* ERROR *********\nPlease Enter a valid number")
            time.sleep(2.5)
            continue
        if Account_id in all_accounts:
            amount = try_int(input("How much would you like to withdraw? "))
            if amount is None:
                cls()
                print("\n********* ERROR *********\nPlease Enter a valid number")
                time.sleep(2.5)
                continue
            elif amount <= 0:
                cls()
                print("*** Amount must be greater than zero ***")
                time.sleep(1.3)
                continue
            if all_accounts[Account_id].withdraw(amount):
                messege = withdrawal_info(amount)
                record(Account_id, massege)
                print(massege)
                time.sleep(2.5)
            else:
                print(f"Your current balance is not enough to complete the transaction!")
                time.sleep(2.5)
        else:
            print(f"\n*** There are not any account with id: {Account_id} ***")
            time.sleep(2.5)


# upgrade to vip
    elif service == 6:
        cls()
        Account_id = try_int(input("\nEnter the ID: "))
        if Account_id is None:
            cls()
            print("\n********* ERROR *********\nPlease Enter a valid number")
            time.sleep(2.5)
            continue
        if Account_id in all_accounts:
            if all_accounts[Account_id].get_type() == "VIP":
                cls()
                print("Your account is already VIP")
                time.sleep(2.5)
            else:
                assent = input("\nthis will cost you ⃁50, it will withdraw from your account\nWould you like to upgrade? ").lower()
                if assent == 'yes':
                    if upgrade(Account_id, upgrade_price) == True:
                        massege = withdrawal_info(upgrade_price)
                        record(Account_id, massege)
                        print(massege)
                        time.sleep(2.5)
                    else:
                        print(f"Your current balance is not enough to complete the transaction!")
                        time.sleep(2.5)
                elif assent == "no":
                    print("Returning to the Home Page")
                    time.sleep(2)
                    continue
                else:
                    print("\nthe program didn't understand your answer, upgrade falied")
                    time.sleep(2.5)

# Exit
    elif service == 7:
        cls()
        print("Thank you for using our service...")
        time.sleep(0.5)
        break

    else:
        cls()
        print("\nPlese choose one of these number: (1, 2, 3, 4, 5, 6, 7)")
        time.sleep(1.5)
        continue