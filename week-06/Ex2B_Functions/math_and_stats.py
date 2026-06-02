# Exercise 2.B Math exercise:
import random
import math
import statistics
# Variables 
values_1_100 = range(1, 100)
values_sample = random.sample(values_1_100, 75)
values_choices = random.choices(list(values_1_100), k=200)
radius = random.randint(3, 10)
# Sum, Avg, Median experiment of numbers 1-100:
print("Experimenting with a subset of integers 1-100:")
print("Sum:", sum(values_sample))
print("Average:", statistics.mean(values_sample))
print("Median:", statistics.median(values_sample))

print('\n')
# Adding STDEV and Variance experiment of numbers 1-100: 
print("Experimenting with a superset of 200 values, integers 1-100:")
print("Average:", statistics.mean(values_choices))
print("Median:", statistics.median(values_choices))
print("Mode:", statistics.mode(values_choices))
print("Standard deviation:", statistics.stdev(values_choices))
print("Variance:", statistics.variance(values_choices))

print('\n')
# Area of circle experiment: 
area = math.pi * radius**2
print("Modeling a random circle:")
print(f"Radius = {radius}, area rounded up = {math.ceil(area)}")
print(f"Radius = {radius}, area rounded down = {math.floor(area)}")