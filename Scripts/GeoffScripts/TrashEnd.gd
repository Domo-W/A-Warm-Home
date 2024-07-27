extends Node

@onready var end_label = $VBoxContainer/EndLabel

func _process(delta):
	end_label.text = "Great job cleaning up\ntheir mess!"


func _on_button_pressed():
	Global.has_done_task = true
	get_tree().change_scene_to_file("res://PrototypeLevels/living_room.tscn")
