# This program is a part of Python 103 course offered 
# by Satr Educational Academy. the task was to convert
# the given code (the comment) into Object-Oriented Programming (OOP).
# ______________________________________________________________________


# def update_sale_price(bike, sale_price):
#         if bike['sold'] == True:
#             print('Action not allowed, Bike has already been sold')
#         else:
#             bike['sale_price'] = sale_price
    
    
#     def sell(bike):
#         bike['sold'] = True
    
    
#     def create_bike(description, cost, sale_price, condition):
#         return {
#             'description': description,
#             'cost': cost,
#             'sale_price': sale_price,
#             'condition': condition,
#             'sold': False
#         }
    
    
#     bike1 = create_bike('Univega Alpina, orange', cost=100, sale_price=500, condition=0.5)
#     update_sale_price(bike1, 350)
#     sell(bike1)


class Bike:
    def __init__(self, description, cost, sale_price, condition, sold = False):
        self.description = description
        self.cost = cost
        self.sale_price = sale_price
        self.condition = condition
        self.sold = sold

    def sell(bike):
        bike.sold = True

    def update_sale_price(bike, sale_price):
        if bike.sold == True:
            print('Action not allowed, Bike has already been sold')
        else:
            bike.sale_price = sale_price

b001 = Bike("A durable mountain bike built for off-road \ntrails and rough terrain. Designed for stability, \ncontrol, and adventure.", 400, 550, "New")
b002 = Bike("A lightweight road bike engineered for speed and smooth rides on paved roads. Perfect for long-distance cycling.", 500, 690, "Used")
b003 = Bike("A comfortable city bike ideal for daily commuting and urban travel. Stylish, practical, and easy to ride.", 300, 420, "Damaged")
print(f"b001: {b001.description}, {b001.cost}, {b001.sale_price}, {b001.condition}, {b001.sold}")
b001.update_sale_price(200)
print(f"b001: {b001.description}, {b001.cost}, {b001.sale_price}, {b001.condition}, {b001.sold}")
b001.sell()
b001.update_sale_price(100)
