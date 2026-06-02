#Finding the total van rental costs for a tour with 38 tourists
import math
num_tourists = 38
van_capacity = 15
van_cost_per_day = 250
vans_needed = math.ceil(num_tourists / van_capacity)
total_van_cost = vans_needed * van_cost_per_day
cost_per_person = total_van_cost / num_tourists

print(f"The number of tourists we have is {num_tourists}")
print(f"The amount of vans we neeed is {vans_needed}")
print(f"The total cost to rent vans per day is ${total_van_cost}")
print(f"The total cost per person to rent the vans is ${cost_per_person:.2f} per day")
#a) How much money did your script say you had to charge per person? $19.74 per day
#b) If you multiply that out, how much did you collect? Total is $750.12
#c) How much were the vans? Total van cost is $750
#d)Why do you have leftover money? $0.12 is left over because of
# math.ceil, it rounds a number value up to the next integer

# Commit here: "9th math script, calculating van rental costs"