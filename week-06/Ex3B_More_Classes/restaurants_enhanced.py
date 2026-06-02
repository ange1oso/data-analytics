# Exercise 3.B: Restaurant Class with Enhanced Functionality
# Restaurant class with attributes for the restaurant's name, type of food, number of customers served, and customer ratings.
# It includes methods to add to the number of customers served, print the total number served, add customer ratings, and calculate the average rating. 
# An instance of the Restaurant class is created, and some operations are performed to demonstrate its functionality.
# Exercise 2.C: Functions and Classes
# Restaurant class and creating instances of it to demonstrate its functionality:
class Restaurant:
    '''Represents a restaurant and its food type.'''
# The __init__ method initializes the restaurant's name and food type.
# Updated: It also initializes the number of customers served and a list to hold customer ratings.
    def __init__(self, rest_name, food_type):
        self.rest_name = rest_name
        self.food_type = food_type
        self.number_served = 0
        self.customer_ratings = []
# Method to add to the number of customers served.
    def add_num_served(self, num):
        self.number_served += num
# Method to print the total number of customers served.
    def print_num_served(self):
        print(f"{self.rest_name} has served {self.number_served} customers")
# Method to add a customer rating.    
    def add_rating(self, rating):
        self.customer_ratings.append(rating)
# Method to calculate and return the average customer rating.
    def average_rating(self):
        if self.customer_ratings:
            return sum(self.customer_ratings) / len(self.customer_ratings)
        return 0
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
    rest.add_num_served(50)  # Adding customers served
    rest.print_num_served()   # Printing total customers served
    rest.add_rating(4)       # Adding customer ratings
    rest.add_rating(5)
    print(f"Average Rating: {rest.average_rating():.2f}\n")  # Printing average rating
