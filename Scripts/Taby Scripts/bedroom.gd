extends Node2D

@onready var door = $Door
@onready var interact_hint_label = $InteractHintLabel

var exitable = false

func _process(delta):
	if Input.is_action_just_pressed("interact") and exitable:
		print("bye")
		get_tree().change_scene_to_file("res://PrototypeLevels/hallway.tscn")

func _on_door_body_entered(body):
	exitable = true
	interact_hint_label.visible = true

func _on_door_body_exited(body):
	exitable = false
	interact_hint_label.visible = false

