#Tiling a room with calculations using python
import math
room_length = 20  # feet
room_width = 15   # feet
tiles_per_box = 12 # tiles
room_area = room_length * room_width
boxes_needed = math.ceil(room_area / tiles_per_box)  # Round up to whole boxes
extra_percentage = 0.10  # 10% extra for breakage
total_boxes = math.ceil(boxes_needed * (1 + extra_percentage))

print(f"The room dimensions are {room_length}ft x {room_width}ft")
print(f"The room area is {room_area} sq ft")
print(f"The boxes of tiles I need (exact) are {boxes_needed}")
print(f"The boxes I need with insurance (10% wiggle room) are {total_boxes}")

# Commit here: "9th math script, tile calculations"