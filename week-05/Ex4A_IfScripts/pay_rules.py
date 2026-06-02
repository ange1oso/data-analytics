# Gross pay exercise:
# Calculate gross pay with overtime at 1.5x for hours over 40
def calculate_gross_pay(pay_rate, hours_worked):
    if hours_worked > 40:
        regular_pay = pay_rate * 40
        overtime_hours = hours_worked - 40
        overtime_pay = pay_rate * 1.5 * overtime_hours
        gross_pay = regular_pay + overtime_pay
    else:
        gross_pay = pay_rate * hours_worked
    return gross_pay

# Test cases
test_cases = [
    (15, 25, 250.00, "Under 40 hours"),
    (25, 40, 1020.00, "Exactly 40 hours"),
    (19, 50, 821.75, "Over 40 hours")
]

print("Pay rate | Hours | Gross pay | Reason")
print("-" * 40)

for pay_rate, hours, expected, reason in test_cases:
    actual = calculate_gross_pay(pay_rate, hours)
    print(f"${pay_rate:6.2f}   | {hours:5d} | ${actual:8.2f}  | {reason}")

# Commit point: Pay rules exercise complete