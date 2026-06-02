# Greeting by hour of day exercise:
# Return greeting based on hour of day function:
def get_greeting(hour):
    if hour < 10:
        greeting = "Good morning!"
    elif hour < 17:
        greeting = "Good day!"
    elif hour >= 17:
        greeting = "Good evening!"
    
    # Additional condition: hours between 11pm and 4am
    
    if hour >= 23 or hour < 4:
        greeting += " What are you doing up so late??"
    
    return greeting

# Test with different hours
test_hours = [9, 10, 14, 17, 22, 23, 2]
print("Greeting by hour:")
for hour in test_hours:
    greeting = get_greeting(hour)
    print(f"Hour {hour:2d}: {greeting}")

# Commit point: Greeting script complete