# Movie list exercise:

favorite_movies = ["The Dark Knight", "Grown Ups", "The Bad Guys", "Sicario"]

# Print using len() function

print(f"The list 'favorite_movies' includes my top {len(favorite_movies)} favorite movies")
print(f"Complete list: {favorite_movies}")

# Sorted using sorted() function (doesn't modify original)

print(f"\nUsing sorted():")
print(f"Sorted list: {sorted(favorite_movies)}")
print(f"Original list (unchanged): {favorite_movies}")

# Using .sort() method (modifies the list in place)

print(f"\nUsing .sort() method:")
favorite_movies_copy = favorite_movies.copy()  # Make a copy to demonstrate
favorite_movies_copy.sort()
print(f"After .sort(): {favorite_movies_copy}")

# Add a new movie

favorite_movies.append("World War Z")
print(f"\nAfter adding 'World War Z':")
print(f"The list 'favorite_movies' includes my top {len(favorite_movies)} favorite movies")
print(f"Complete list: {favorite_movies}")

# Commit point: Movie list complete