# Department Converter with Match/Case exercise:

def get_dept_name_v2(code):
    match code:
        case 1:
            return "Marketing"
        case 5:
            return "Human Resources"
        case 10:
            return "Accounting"
        case 12:
            return "Legal"
        case 18:
            return "IT"
        case 20:
            return "Customer Relations"
        case _:
            return "Unknown Department"

# Test match/case 
test_codes = [1, 5, 10, 12, 18, 20, 99]
print("Department Lookup (Match/Case):")
for code in test_codes:
    dept_name = get_dept_name_v2(code)
    print(f"Code {code}: {dept_name}")

# Commit point: Department converter exercise complete