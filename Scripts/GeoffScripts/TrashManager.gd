extends Node

var rec_scene = preload("res://Scripts/GeoffScripts/draggable_recycling.tscn")
var trash_scene = preload("res://Scripts/GeoffScripts/draggable_trash.tscn")
var remaining_trash = 8

func _ready():
	for i in range(remaining_trash):
		var trash
		if i % 2 == 0:
			trash = trash_scene.instantiate()
		else:
			trash = rec_scene.instantiate()
		trash.position = Vector2(randi_range(-210, 210), randi_range(0, 120))
		add_child(trash)

func throw_trash():
	remaining_trash -= 1
	print(str(remaining_trash))
	if remaining_trash <= 0:
		#return to the moving around the yard scene
		pass
