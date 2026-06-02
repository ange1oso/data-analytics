# Candy Store Exercise:

candies = ("Gummy Bears", "Sour Patch Kids", "Starburts")
flavors = ("Strawberry", "Mango", "Cherry")

candy_menu = {
    f"{candies[0]} - {flavors[0]}",
    f"{candies[1]} - {flavors[1]}",
    f"{candies[2]} - {flavors[2]}",
    f"{candies[0]} - {flavors[1]}",
    f"{candies[1]} - {flavors[0]}"
}
print(f"Today's candy options include:")
print(candy_menu)
# Sets are unordered collections, so the order may change between printouts.
# Commit point: Candy store exercise complete