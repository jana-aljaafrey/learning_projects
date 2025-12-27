num_list = []


def mymin(A_list):
    smallest = None
    for i in A_list:
        if smallest is None:
            smallest = i
        elif smallest > i:
            smallest = i
    return smallest

def mymax(A_list):
    largest = None
    for i in A_list:
        if largest is None:
            largest = i
        elif largest < i:
            largest = i
    return largest

while True:
    num = input("Enter numbers: ")
    if num != "done":
        try:
           int(num)
           num_list.append(int(num))
        except:
          print("Invalid input")
    else:
        break 
  
print("\nMaximum is", max(num_list))
print("Minimum is", min(num_list))

