# Min and Max exercise:
# Find smallest and largest of three numbers function:
def find_min_max(a, b, c):
    if a <= b and a <= c:
        smallest = a
    elif b <= a and b <= c:
        smallest = b
    else:
        smallest = c
    
    if a >= b and a >= c:
        largest = a
    elif b >= a and b >= c:
        largest = b
    else:
        largest = c
    
    return smallest, largest

# Testing with various values

test_sets = [
    (10, 5, 20),
    (100, 50, 75),
    (1, 1, 1),
    (-5, 10, 3)
]

print("Min and Max of three numbers:")

for a, b, c in test_sets:
    min_val, max_val = find_min_max(a, b, c)
    print(f"Numbers: {a}, {b}, {c} | Smallest: {min_val}, Largest: {max_val}")

# Commit point: Min/max exercise complete