# While Loop with savings goal exercise:

starting_balance = 1000
savings_goal = 10000
weekly_savings = 1500

current_balance = starting_balance

while current_balance < savings_goal:
    current_balance += weekly_savings
    
    if current_balance >= savings_goal * 0.75:
        # 75% or more of goal
        treat_cost = 50
        current_balance -= treat_cost
        print(f"So close! After treating myself, my balance is up to ${current_balance:.2f}")
    elif current_balance >= savings_goal * 0.5:
        # More than halfway
        print(f"Almost there! This week my balance is up to ${current_balance:.2f}")
    else:
        # Less than halfway
        print(f"This week my balance increased to ${current_balance:.2f}")

print(f"Goal met! My current balance is ${current_balance:.2f}")

# Commit point: Savings goal exercise complete