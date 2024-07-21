extends Node


var rec_scene = preload("res://Scripts/GeoffScripts/draggable_recycling.tscn")
var trash_scene = preload("res://Scripts/GeoffScripts/draggable_trash.tscn")
var remaining_trash = 10

func _ready():
	for i in range(remaining_trash):
		var trash
		if i % 2 == 0:
			trash = trash_scene.instantiate()
		else:
			trash = rec_scene.instantiate()
		trash.position = Vector2(randi_range(-150,150),randi_range(0,280))
		add_child(trash)

func throw_trash():
	remaining_trash -= 1
	print(str(remaining_trash))
	if remaining_trash <= 0:
		Global.has_done_task = true
		get_tree().change_scene_to_file("res://PrototypeLevels/living_room.tscn")
