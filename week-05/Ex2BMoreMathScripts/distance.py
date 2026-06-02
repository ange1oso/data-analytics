#Calculating distance
#Distance formula: d = sqrt((x2-x1)^2 + (y2-y1)^2)
import math
x1, y1 = 0, 0
x2, y2 = 3, 4
distance = math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)
print(f"Distance between ({x1}, {y1}) and ({x2}, {y2}): {distance:.2f} units")
#Or using built in python distance method
p1 = 0, 0
p2 = 3, 4
distance = math.dist(p1, p2)
print(f"The distance between {p1} and {p2} is {distance} units")

# Commit here: "8th math script, distance calculation"