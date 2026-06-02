# Department Converter using if/elif/else statements exercise:

def get_dept_name(code):
    if code == 1:
        return "Marketing"
    elif code == 5:
        return "Human Resources"
    elif code == 10:
        return "Accounting"
    elif code == 12:
        return "Legal"
    elif code == 18:
        return "IT"
    elif code == 20:
        return "Customer Relations"
    else:
        return "Unknown Department"

# Test with multiple codes
test_codes = [1, 5, 10, 12, 18, 20, 99]
print("Department Lookup:")
for code in test_codes:
    dept_name = get_dept_name(code)
    print(f"Code {code}: {dept_name}")

# Commit point: Department converter exercise complete