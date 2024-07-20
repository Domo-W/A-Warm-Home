extends Node

@onready var label = $Label
@onready var box_1 = $Box_1
@onready var box_2 = $Box_2
@onready var box_3 = $Box_3
@onready var box_4 = $Box_4
@onready var box_5 = $Box_5

const x_coords = [-390, 0, 390]
const y_coords = [165, 69, -27, -123, -219]

var num_disks = 5
var towers = [Array(range(num_disks, 0, -1)), [], []]
var move_count = 0
var which = []

func _ready():
	label.text = "Moves: 0"
	box_1.position = Vector2(x_coords[0], y_coords[4])
	box_2.position = Vector2(x_coords[0], y_coords[3])
	box_3.position = Vector2(x_coords[0], y_coords[2])
	box_4.position = Vector2(x_coords[0], y_coords[1])
	box_5.position = Vector2(x_coords[0], y_coords[0])

func _process(delta):
	if towers[2] == [5, 4, 3, 2, 1]:
		pass
	if len(which) == 2:
		move_disk(which[0], which[1])
		which = []
		label.text = "Moves: " + str(move_count)
		print(str(towers))

func move_disk(from_tower, to_tower):
	if not towers[from_tower]:
		print("Invalid move: Source tower is empty.")
	elif towers[to_tower] and towers[from_tower][-1] > towers[to_tower][-1]:
		print("Invalid move: Cannot place a larger disk on a smaller disk.")
	else:
		var disk = towers[from_tower].pop_back()
		towers[to_tower].append(disk)
		move_count += 1


func _on_button_1_pressed():
	which.append(0)


func _on_button_2_pressed():
	which.append(1)


func _on_button_3_pressed():
	which.append(2)
