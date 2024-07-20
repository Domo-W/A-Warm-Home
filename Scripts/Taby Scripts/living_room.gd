extends Node2D

@onready var player = $stickplayer

@onready var stairs_label = $Stairs/StairsLabel
@onready var kitchen_label = $KitchenDoor/KitchenLabel

var stairs_interact = (Global.prev_room_x == 0)
var kitchen_interact = (Global.prev_room_x == -130)

# Called when the node enters the scene tree for the first time.
func _ready():
	player.position.x = Global.prev_room_x
	stairs_label.visible = stairs_interact
	kitchen_label.visible = kitchen_interact

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact") and stairs_interact:
		Global.prev_room_x = -400
		get_tree().change_scene_to_file("res://PrototypeLevels/hallway.tscn")
	if Input.is_action_just_pressed("interact") and kitchen_interact:
		Global.prev_room_x = 0
		print("cooking")
		get_tree().change_scene_to_file("res://PrototypeLevels/kitchen.tscn")

func _on_stairs_body_entered(body):
	if body == player:
		stairs_interact = true
		stairs_label.visible = true

func _on_stairs_body_exited(body):
	if body == player:
		stairs_interact = false
		stairs_label.visible = false


func _on_kitchen_door_body_entered(body):
	if body == player:
		kitchen_interact = true
		kitchen_label.visible = true


func _on_kitchen_door_body_exited(body):
	if body == player:
		kitchen_interact = false
		kitchen_label.visible = false
