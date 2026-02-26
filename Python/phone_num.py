# This program is the final project for the Python 101 course offered 
# by Satr Educational Academy. It simulates a simple phone book system 
# that allows users to search for a phone number by name, search for a 
# name by phone number, add new contacts, and exit the program through 
# an interactive menu.

phone_nums = {
    "Amal":1111111111,
    "mohamed":2222222222,
    "khadija":3333333333,
    "Abdullah":4444444444,
    "Rawan":5555555555,
    "Faisal":6666666666,
    "Layla":7777777777,
}

while True:
    service = input("\n\nChoose a service:\n\n1. Look up a phone number by name\n2. Look up a name by phone number\n3. Add a new contact\n4. Exit\n\nEnter your choice (1, 2, 3, or 4): ")

    if service == '1':
        input_name = input("Enter a name: ").capitalize()
        if input_name in phone_nums:
         print(f"{input_name}'s phone number is: {phone_nums[input_name]}")
        else:
         print(f"{input_name} is not in the phone book.")
    elif service == '2':
        input_num = int(input("Enter a phone number: "))
        if input_num in phone_nums.values():
           for name, num in phone_nums.items():
              if num == input_num:
                print(f"The name associated with the phone number {input_num} is: {name}")
        else:
         print(f"The phone number {input_num} is not in the phone book.")
             
    elif service == '3':
       name = input("Enter the name of the new contact: ").capitalize()
       num = int(input("Enter the phone number of the new contact: "))
       if name in phone_nums:
          print(f"{name} is already in the phone book with the number {phone_nums[name]}.")
       else:
          phone_nums[name] = num
          print(f"{name} has been added to the phone book with the number {num}.")
    elif service == '4':
        print("Exiting the phone book. Goodbye!")
        break