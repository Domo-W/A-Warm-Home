extends MarginContainer

@onready var grass_spawner = %GrassSpawner
@onready var end_label = $VBoxContainer/EndLabel

func _process(delta):
	end_label.text = "You Cut " + str(grass_spawner.score) + "\nBlades of Grass"


func _on_button_pressed():
	Global.has_done_task = true
	get_tree().change_scene_to_file("res://PrototypeLevels/living_room.tscn")
