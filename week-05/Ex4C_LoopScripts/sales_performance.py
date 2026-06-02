# Sales performance analysis exercise

sales_data = [
    ('Marcus Webb', 'East', 4250.00),
    ('Priya Sharma', 'West', 5875.50),
    ('DeShawn Carter', 'East', 3100.75),
    ('LaTonya Rivers', 'South', 6420.00),
    ('Bob Nguyen', 'West', 4980.25),]

print("Sales Performance Report:")
print("-" * 50)

total_sales = 0

for name, region, sales in sales_data:
    print(f"{name} ({region}): ${sales:,.2f}")
    if sales > 5000:
        print(" ^ Top performer!")
    total_sales += sales

print("-" * 50)
print(f"Total sales across all employees: ${total_sales:,.2f}")

# Commit point: Sales performance script complete