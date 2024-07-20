extends Node2D

@onready var interact_hint_label = $HallwayDoor/InteractHintLabel
@onready var hallway_door = $HallwayDoor
@onready var player = $stickplayer

var hallway_interact = true

func _process(_delta):
	if Input.is_action_just_pressed("interact") and hallway_interact:
		get_tree().change_scene_to_file("res://PrototypeLevels/hallway.tscn")

func _on_hallway_door_body_entered(body):
	if body == player:
		hallway_interact = true
		interact_hint_label.visible = true


func _on_hallway_door_body_exited(body):
	if body == player:
		hallway_interact = false
		interact_hint_label.visible = false
