extends Node2D

@onready var door = $HallwayDoor
@onready var interact_hint_label = $HallwayDoor/InteractHintLabel
@onready var player = $stickplayer

var exitable = false

func _ready():
	player.position.y = 114
	if not Global.fresh_start:
		player.position.x = -180
	Global.fresh_start = false

func _process(_delta):
	if Input.is_action_just_pressed("interact") and exitable:
		print("bye")
		get_tree().change_scene_to_file("res://PrototypeLevels/hallway.tscn")

func _on_hallway_door_body_entered(body):
	if body == player:
		exitable = true
		interact_hint_label.visible = true


func _on_hallway_door_body_exited(body):
	if body == player:
		exitable = false
		interact_hint_label.visible = false
