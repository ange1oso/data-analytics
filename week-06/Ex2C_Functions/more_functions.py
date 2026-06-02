# Exercise 2.C More Functions
# Functions for Mailing label:
def display_mailing_label(name, address, city, state, zip_code):
    print(name)
    print(address)
    print(f"{city}, {state} {zip_code}")
    print()
# Adding numbers function:
def add_numbers(*args):
    total = sum(args)
    expression = " + ".join(str(x) for x in args)
    print(f"{expression} = {total}")
# Receipt function: 
def display_receipt(total_due, amount_paid):
    print(f"Total Due: ${total_due:.2f}")
    print(f"Amount Paid: ${amount_paid:.2f}")

    if amount_paid >= total_due:
        print(f"Change Due: ${amount_paid - total_due:.2f}")
    else:
        print(f"Remaining Balance: ${total_due - amount_paid:.2f}")
    print()
# Mailing label test:
display_mailing_label("John Doe", "123 Main St", "Naperville", "IL", "60540") 
display_mailing_label("Jane Smith", "456 Oak Ave", "Chicago", "IL", "60601")
# Adding numbers test: 
add_numbers(5) # Single number
add_numbers(5, 10) # Two numbers
add_numbers(1, 2, 3, 4, 5) # Multiple numbers
# Receipt test:
display_receipt(25, 30) # Overpayment
display_receipt(25, 25) # Exact payment
display_receipt(25, 20) # Underpayment
