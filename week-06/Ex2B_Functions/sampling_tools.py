
# Exercise 2.B Sampling exercise:
import random
# Products list:
products = [
    'Laptop', 'Monitor', 'Keyboard', 'Mouse', 'Webcam',
    'Headset', 'Docking Station', 'USB Hub',
    'Desk Lamp', 'Surge Protector'
]
# Product of the day: 
print("Product of the Day:", random.choice(products))
# Usuability survey:
print("Survey Products:", random.sample(products, 3))

random.shuffle(products)
print("Shuffled Products:", products)

print("Daily Transaction Count:", random.randint(50, 300))