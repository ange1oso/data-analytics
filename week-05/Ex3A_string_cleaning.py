# String cleaning exercise:

name_1 = "PRIYA SHARMA" 
name_2 = "bob NGUYEN" 
name_3 = "LaTonya Williams" 
salary_1 = "$82,500" 
salary_2 = "$74,000"

# Converting names into lowercase

print(f"Converted to lowercase:")
print(f"{name_1.lower()}")
print(f"{name_2.lower()}")
print(f"{name_3.lower()}")

# Converting to title case

print(f"\nConverted to title case:")
print(f"{name_1.title()}")
print(f"{name_2.title()}")
print(f"{name_3.title()}")

# Removing $ from salaries

print(f"\nRemoving $ from salaries using .replace():")
salary_1_clean = salary_1.replace("$", "")
salary_2_clean = salary_2.replace("$", "")
print(f"salary_1: {salary_1_clean}, type: {type(salary_1_clean)}")
print(f"salary_2: {salary_2_clean}, type: {type(salary_2_clean)}")

# These are still strings. To do math, convert to int or float.
# Chain .replace() and int() together

print(f"\nChaining .replace() and int() together:")
salary_1_int = int(salary_1.replace("$", "").replace(",", ""))
print(f"salary_1 as int: {salary_1_int}, type: {type(salary_1_int)}")
salary_2_int = int(salary_2.replace("$", "").replace(",", ""))
print(f"salary_2 as int: {salary_2_int}, type: {type(salary_2_int)}")

# Commit point: String cleaning complete