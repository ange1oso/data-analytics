# This function demonstrates basic exception handling in Python.
# It attempts to divide two numbers provided by the user and handles potential exceptions that may arise during the process.
# The function includes:
# - A try block to attempt the division operation.
# - Except blocks to catch specific exceptions (ZeroDivisionError and ValueError).
# - An else block to execute if no exceptions occur, printing the result.
# - A finally block to indicate that the program has completed, regardless of whether an exception was raised or not.
def safe_divide():
    try:
        num1 = float(input("Enter first number: "))
        num2 = float(input("Enter second number: "))
        result = num1 / num2
    except ZeroDivisionError:
        print("You cannot divide by zero.")
    except ValueError:
        print("Please enter valid numeric values.")
    else:
        print(f"Result: {result}")
    finally:
        print("Program complete.")
print(safe_divide())
# Example call:
# safe_divide()
# Brightspace example:
try: 
    m = banana 
except NameError: print("NameError: Oops, looks like you tried to assign an undefined object to a variable") 
else:
    print(m)
finally:
    print("Let's try another one...")