#Rule of 72: Years to double = 72 / interest_rate
#The Rule of 72: finding long-term impact of compound interest
current_savings = 5000
interest_rate = 6  # 6%
years_to_double = 72 / interest_rate
doubled_balance = current_savings * 2

print(f"Your current savings is {current_savings}.")
print(f"At a {interest_rate}% interest rate, your savings account will be worth ${doubled_balance:.2f} in {years_to_double:.1f} years")

#Commit here: "5th math script in .py, Rule of 72 on savings"