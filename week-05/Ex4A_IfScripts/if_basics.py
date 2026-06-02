# If Staments exerise:

x = 100
y = 20

print(f"Starting values: x = {x}, y = {y}")

# a) If x divided by y is 5
if x / y == 5:
    print("x divided by y is 5")
    x = 1
else:
    print("are the variables set up correctly?")

# b) If x times y is y
if x * y == y:
    print("now x times y is y")
    x = 10
else:
    print("Whoops, x equals " + str(x))

# c) If x is less than y
if x < y:
    print("x is less than y")
    x = x * 2
else:
    print("uh oh, x is not less than y")

# d) If x is greater than y
if x > y:
    print("how is x greater than y??")
else:
    print("x is NOT greater than y")

# e) Final values
print(f"The final value of x is {x} and the final value of y is {y}")

# Commit point: If exercises complete