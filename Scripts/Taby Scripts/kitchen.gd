extends Node2D

@onready var player = $stickplayer

@onready var living_room_label = $LivingRoomDoor/LivingRoomLabel
@onready var homework_label = $Homework/HomeworkLabel

var living_interact = (Global.prev_room_x == -130)
var homework_interact = (Global.prev_room_x == -120)

# Called when the node enters the scene tree for the first time.
func _ready():
	player.position.x = Global.prev_room_x
	living_room_label.visible = living_interact
	homework_label.visible = homework_interact

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact") and living_interact:
		Global.prev_room_x = -130
		get_tree().change_scene_to_file("res://PrototypeLevels/living_room.tscn")
	if Input.is_action_just_pressed("interact") and homework_interact:
		Global.prev_room_x = -120
		get_tree().change_scene_to_file("res://PrototypeLevels/homework_minigame.tscn")



func _on_homework_body_entered(body):
	if body == player:
		homework_interact = true
		homework_label.visible = true


func _on_homework_body_exited(body):
	if body == player:
		homework_interact = false
		homework_label.visible = false


func _on_living_room_door_body_entered(body):
	if body == player:
		living_interact = true
		living_room_label.visible = true


func _on_living_room_door_body_exited(body):
	if body == player:
		living_interact = false
		living_room_label.visible = false