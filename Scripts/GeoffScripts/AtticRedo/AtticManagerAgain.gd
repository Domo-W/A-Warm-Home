extends Node

@onready var label = $Label
@onready var box_1 = $Box_1
@onready var box_2 = $Box_2
@onready var box_3 = $Box_3
@onready var box_4 = $Box_4
@onready var box_5 = $Box_5
@onready var attic_end_screen = %AtticEndScreen

const x_coords = [-390, -25, 370]
const y_coords = [165, 85, 5, -75, -155]

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
	attic_end_screen.visible  = false

func _process(delta):
	if towers[2] == [5, 4, 3, 2, 1]:
		attic_end_screen.visible  = true
#finish the game!!!!!!!!!!!
	if len(which) == 2:
		move_disk(which[0], which[1])
		reset_color()
		which = []
		label.text = "Moves: " + str(move_count)
		print(str(towers))
	elif len(which) == 1:
		print (str(which[0]))
		if towers[which[0]][-1] == 1:
			box_1.modulate = Color(Color.WHITE,0.5)
		elif towers[which[0]][-1] == 2:
			box_2.modulate = Color(Color.WHITE,0.5)
		elif towers[which[0]][-1] == 3:
			box_3.modulate = Color(Color.WHITE,0.5)
		elif towers[which[0]][-1] == 4:
			box_4.modulate = Color(Color.WHITE,0.5)
		elif towers[which[0]][-1] == 5:
			box_5.modulate = Color(Color.WHITE,0.5)

func move_disk(from_tower, to_tower):
	if not towers[from_tower]:
		print("Invalid move: Source tower is empty.")
	elif towers[to_tower] and towers[from_tower][-1] > towers[to_tower][-1]:
		print("Invalid move: Cannot place a larger disk on a smaller disk.")
	else:
		var disk = towers[from_tower].pop_back()
		towers[to_tower].append(disk)
		move_count += 1
		var tween = get_tree().create_tween()
		if disk == 1:
			tween.tween_property(box_1, "position", Vector2(x_coords[to_tower], y_coords[len(towers[to_tower])-1]), 0.4).set_ease(Tween.EASE_OUT)
			#box_1.position = Vector2(x_coords[to_tower], y_coords[len(towers[to_tower])-1])
		elif disk == 2:
			tween.tween_property(box_2, "position", Vector2(x_coords[to_tower], y_coords[len(towers[to_tower])-1]), 0.4).set_ease(Tween.EASE_OUT)
		elif disk == 3:
			tween.tween_property(box_3, "position", Vector2(x_coords[to_tower], y_coords[len(towers[to_tower])-1]), 0.4).set_ease(Tween.EASE_OUT)
		elif disk == 4:
			tween.tween_property(box_4, "position", Vector2(x_coords[to_tower], y_coords[len(towers[to_tower])-1]), 0.4).set_ease(Tween.EASE_OUT)
		else:
			tween.tween_property(box_5, "position", Vector2(x_coords[to_tower], y_coords[len(towers[to_tower])-1]), 0.4).set_ease(Tween.EASE_OUT)
	
func reset_color():
	box_1.modulate = "ffffffff"
	box_2.modulate = "ffffffff"
	box_3.modulate = "ffffffff"
	box_4.modulate = "ffffffff"
	box_5.modulate = "ffffffff"

func _on_button_1_pressed():
	if towers[0] == [] and len(which) == 0:
		pass
	else:
		which.append(0)


func _on_button_2_pressed():
	if towers[1] == [] and len(which) == 0:
		pass
	else:
		which.append(1)


func _on_button_3_pressed():
	if towers[2] == [] and len(which) == 0:
		pass
	else:
		which.append(2)
