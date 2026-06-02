# Show Major Lookup exercise:
# Return major name and office location based on code function:
def get_major_info(major_code):
    if major_code == "BIOL":
        return "Biology", "Science Bldg, Room 310"
    elif major_code == "CSCI":
        return "Computer Science", "Sheppard Hall, Room 314"
    elif major_code == "ENG":
        return "English", "Kerr Hall, Room 201"
    elif major_code == "HIST":
        return "History", "Kerr Hall, Room 114"
    elif major_code == "MKT":
        return "Marketing", "Westly Hall, Room 310"
    else:
        return "<unknown>", ""

# Testing with valid and invalid codes

test_majors = [
    ("John Smith", "BIOL"),
    ("Jane Doe", "ENG"),
    ("Bob Johnson", "CSCI"),
    ("Alice Brown", "HIST"),
    ("Charlie Davis", "MKT"),
    ("Emma Wilson", "PHYS")  # Not in table
]

print("Student Major Information:")

for student_name, major_code in test_majors:
    major_name, office = get_major_info(major_code)
    if office:
        print(f"{student_name} ({major_code}): {major_name} - {office}")
    else:
        print(f"{student_name} ({major_code}): {major_name}")

# Commit point: Major lookup exercise complete