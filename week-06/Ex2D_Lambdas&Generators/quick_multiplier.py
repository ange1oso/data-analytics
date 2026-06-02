# Exercise 2.C Quick Multiplier
# Double, triple, and more:
doubler = lambda n: n * 2
tripler = lambda n: n * 3
# Testing the functions:
print(doubler(8))
print(doubler(-4))
print(doubler('banana'))
# The tripler function should work similarly to the doubler, but it will multiply the input by 3 instead of 2:
print(tripler(8))
print(tripler(-4))
print(tripler('banana'))
# Now let's create a more general multiplier function that can create functions for any multiplier we want:
def multiplier(num):
    return lambda x: x * num
# Using the multiplier function to create specific multiplier functions:
quadrupler = multiplier(4)
quintupler = multiplier(5)
sextupler = multiplier(6)
septupler = multiplier(7)
octupler = multiplier(8)
nonupler = multiplier(9)
decupler = multiplier(10)
# Testing the new multiplier functions:
print(quadrupler(2))
print(quintupler(2))
print(sextupler(2))
print(septupler(2))
print(octupler(2))
print(nonupler(2))
print(decupler(2))
