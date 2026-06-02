# Enumerate with numbered list exercise:

favorite_foods = ["tacos", "ramen", "jerk chicken", "injera", "pierogi"]

print("My favorite foods:")
for index, food in enumerate(favorite_foods, 1):
    if index == 1:
        print(f"{index}. {food} <- top pick!")
    else:
        print(f"{index}. {food}")

print("\nIn reverse order:")
for index, food in enumerate(reversed(favorite_foods), 1):
    if index == 1:
        print(f"{index}. {food} <- top pick!")
    else:
        print(f"{index}. {food}")

# Commit point: Ranked list exercise complete