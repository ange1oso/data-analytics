# Exercise 2.C: Functions and Classes
# Restaurant class and creating instances of it to demonstrate its functionality:
class Restaurant:
    '''Represents a restaurant and its food type.'''
# The __init__ method initializes the restaurant's name and food type.
    def __init__(self, rest_name, food_type):
        self.rest_name = rest_name
        self.food_type = food_type
# The describe_rest method prints a description of the restaurant.
    def describe_rest(self):
        print(f"{self.rest_name} serves {self.food_type}.")
# The rest_open method prints a message indicating that the restaurant is open.
    def rest_open(self):
        print(f"{self.rest_name} is open.")
# Creating instances of the Restaurant class and demonstrating their functionality:
rest1 = Restaurant("Pizzeria", "Pizza")
rest2 = Restaurant("Taco Bell", "Mexican")
rest3 = Restaurant("Panda Express", "Chinese")
# Calling methods on each restaurant instance to show their descriptions and open status:
for rest in [rest1, rest2, rest3]:
    rest.describe_rest()
    rest.rest_open()
