extends Node2D

@onready var interact_hint_label = $HallwayDoor/InteractHintLabel
@onready var hallway_door = $HallwayDoor
@onready var player = $stickplayer
@onready var trash_can = $TrashCan
@onready var bottles_floor = $TrashCan/BottlesFloor

var hallway_interact = true
var trash = false

func _ready():
	DoorClick.play()
	if Global.trash_collected[3]:
		trash_can.empty()
		bottles_floor.visible = false

func _process(_delta):
	if Input.is_action_just_pressed("interact") and hallway_interact:
		DoorClick.play()
		get_tree().change_scene_to_file("res://PrototypeLevels/hallway.tscn")
	if Input.is_action_just_pressed("interact") and trash and Global.day == 4:
		Global.trash_collected[3] = true
		print(Global.trash_collected)
		trash_can.empty()
		bottles_floor.visible = false

func _on_hallway_door_body_entered(body):
	if body == player:
		hallway_interact = true
		interact_hint_label.visible = true

func _on_hallway_door_body_exited(body):
	if body == player:
		hallway_interact = false
		interact_hint_label.visible = false

func _on_trash_area_body_entered(body):
	trash = true

func _on_trash_area_body_exited(body):
	trash = false
