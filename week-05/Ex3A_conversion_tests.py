# Description: This script tests various numeric 
#              conversion techniques
# Author: Sam Q. Newprogrammer
print(f'Creating variables:')
a = "101.1"
b = "55"
c = "402 Stevens"
d = 'Number 5'

# Testing conversions
print(f"a = '{a}', type: {type(a)}")
print(f"b = '{b}', type: {type(b)}")
print(f"c = '{c}', type: {type(c)}")
print(f"d = '{d}', type: {type(d)}")

# Casting as integers
print(f"Casting to int():")
a_int = int(float(a))  # Strip whitespace first by converting to float
b_int = int(b)
# c cannot be converted - would raise ValueError
# d cannot be converted - contains non-numeric characters
print(f"a as int: {a_int}")
print(f"b as int: {b_int}")
# Casting as floats
print(f"Casting to float():")
a_float = float(a)
b_float = float(b)
# c cannot be converted
# d cannot be converted
print(f"a as float: {a_float}")
print(f"b as float: {b_float}")
# Using slicing to extract numeric portions
print(f"Slicing to extract numeric portions:")
c_numeric = c[:3]  # Gets first 3 characters "402"
d_numeric = d[7:8]  # Gets character at index 7, which is '5'
print(f"c numeric portion: {c_numeric}")
print(f"d numeric portion: {d_numeric}")
# Using .strip() method
print(f"Using .strip() to remove trailing spaces:")
a_stripped = a.strip()
d_stripped = d.strip()
print(f"a stripped: '{a_stripped}'")
print(f"d stripped: '{d_stripped}'")

# Commit point: Conversion tests complete