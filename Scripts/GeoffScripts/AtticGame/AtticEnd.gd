extends MarginContainer
@onready var end_label = $VBoxContainer/EndLabel
@onready var attic_manager = %AtticManager


# Called when the node enters the scene tree for the first time.
func _process(delta):
	end_label.text = "You Cut " + str(attic_manager.move_count) + "\nBlades of Grass"


func _on_button_pressed():
	Global.has_done_task = true
	get_tree().change_scene_to_file("res://PrototypeLevels/hallway.tscn")
