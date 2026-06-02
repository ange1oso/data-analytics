# Complex taxes exercise:
# Calculate weekly gross pay, annual income, and tax withholding function: 
def calculate_complex_taxes(pay_rate, hours_worked, filing_status):
# Calculate weekly gross pay (with overtime at 1.5x for hours over 40)
    if hours_worked > 40:
        regular_pay = pay_rate * 40
        overtime_hours = hours_worked - 40
        overtime_pay = pay_rate * 1.5 * overtime_hours
        weekly_gross = regular_pay + overtime_pay
    else:
        weekly_gross = pay_rate * hours_worked   
# Calculate annual gross (52 weeks per year)
    annual_gross = weekly_gross * 52
# Determine tax rate based on filing status and income
    if filing_status.lower() == 'single':
        if annual_gross < 12000:
            tax_rate = 0.05
        elif annual_gross < 25000:
            tax_rate = 0.10
        elif annual_gross < 75000:
            tax_rate = 0.15
        else:
            tax_rate = 0.20
    elif filing_status.lower() == 'joint':
        if annual_gross < 12000:
            tax_rate = 0.00
        elif annual_gross < 25000:
            tax_rate = 0.06
        elif annual_gross < 75000:
            tax_rate = 0.11
        else:
            tax_rate = 0.20
# Calculate weekly tax withholding
    weekly_tax = weekly_gross * tax_rate
# Calculate net pay
    net_pay = weekly_gross - weekly_tax
    return {
        'hours': hours_worked,
        'pay_rate': pay_rate,
        'weekly_gross': weekly_gross,
        'annual_gross': annual_gross,
        'filing_status': filing_status,
        'tax_rate': tax_rate,
        'weekly_tax': weekly_tax,
        'net_pay': net_pay
    }
# Test cases
print("\nComplex Tax Calculation:")
test_num = [
    (25.00, 40, 'single'),
    (30.00, 45, 'single'),
    (50.00, 50, 'joint')
]
for pay_rate, hours, status in test_num:
    result = calculate_complex_taxes(pay_rate, hours, status)
    print(f"\nYou worked {result['hours']} hours this period.")
    print(f"Because you earn ${result['pay_rate']:.2f} per hour, your gross weekly pay is ${result['weekly_gross']:.2f}")
    print(f"Your filing status is {result['filing_status']}")
    print(f"Your tax withholding for the week is ${result['weekly_tax']:.2f}")
    print(f"Your net pay is ${result['net_pay']:.2f}")

# Commit point: Complex tax calculation exercise complete