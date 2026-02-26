# This program is a final project for the Python 102 course offered 
# by Satr Educational Academy. It allows users to enter multiple names 
# and birthdates, calculates each person’s age and day of birth, 
# identifies the oldest and youngest individuals, and displays the 
# total number of members entered.

from datetime import datetime


dic = {}

def add_birthday(name, birthday):
   try:
      datetime.strptime(birthday, "%Y-%m-%d").year
      dic[name] = birthday
      print("\ninformations add Successfully\n")
   except:
     print(f"\nInvalid Date for {name}\n")
     return
   


def maxmin(dic):
   members = len(dic)
   oldest_age = None
   smallest_age = None
   oldest_name = None
   smallest_name = None
   if members > 1:
      for name, birthday in dic.items():
        age = datetime.today().year - datetime.strptime(birthday, "%Y-%m-%d").year
        if oldest_age is None:
            oldest_age = age
            smallest_age = age
            oldest_name = name
            smallest_name = name
        elif age > oldest_age:
            oldest_name = name
            oldest_age = age
        elif age < smallest_age:
            smallest_name = name
            smallest_age = age
   return oldest_name, smallest_name, members


def display_members(dic):
   for name, birthday in dic.items():
      date = datetime.strptime(birthday, "%Y-%m-%d")
      age = datetime.today().year - date.year
      day= date.strftime("%A")
      print(f"\n{name} is {age} years old and she/he was born on {day}\n")

def display_maxmin(aldest, smallest, members):
   if aldest is not None and smallest is not None:
     print(f"the oldest one is {aldest}")
     print(f"the youngest one is {smallest}")
   else:
      print("there is no oldest or youngest person")
   print(f"Total People: {members}")


while True:
 data = input("\nEnter name and birthday (Name, YYYY-MM-DD)\nor Done to display info: ")
 data = data.strip()
 if data.lower() == "done":
    display_members(dic)
    display_maxmin(*maxmin(dic)) 
    print()
    break
 else:
    try:
      name, birthday = data.split(",")
    except:
      print("\nPlease enter the data at the exact format to: Name, YYYY-MM-DD\n")
      continue
    name = name.strip()
    birthday = birthday.strip()
    add_birthday(name, birthday)


