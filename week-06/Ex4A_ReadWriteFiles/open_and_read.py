# This code creates a sample text file named 'sample_data.txt' and writes multiple lines of text to it.
# Then, it reads the contents of the file and prints the first 50 characters, the lines as a list, and the next 100 characters.
sample_text = '''Python is a powerful language.
It is widely used in data analytics.
Jupyter notebooks are useful for analysis.
'''
# Write the sample text to a file
with open('sample_data.txt', 'w') as file:
    file.write(sample_text)
# Read the contents of the file
with open('sample_data.txt', 'r') as file:
    contents = file.read()
# Print the first 50 characters of the file
print("First 50 characters:")
print(contents[:50])
# Read the lines of the file into a list
with open('sample_data.txt', 'r') as file:
    lines = file.readlines()
# Print the lines as a list
print("\nLines as list:")
print(lines)
# Print the next 100 characters of the file
print("\nNext 100 characters:")
print(contents[:100])
