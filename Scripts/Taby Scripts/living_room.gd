extends Node2D

@onready var player = $stickplayer

@onready var stairs_label = $Stairs/StairsLabel
@onready var kitchen_label = $KitchenDoor/KitchenLabel
@onready var outside_label = $Outside/OutsideLabel
@onready var dad_speech = $Decor/Dad/DadSense/DadSpeech

var stairs_interact = (Global.prev_room_x == 0)
var kitchen_interact = (Global.prev_room_x == -130)
var outside_interact = (Global.prev_room_x == 150)
var dad_interact = false

# Called when the node enters the scene tree for the first time.
func _ready():
	player.position.x = Global.prev_room_x
	stairs_label.visible = stairs_interact
	kitchen_label.visible = kitchen_interact
	outside_label.visible = outside_interact
	if Global.day == 2 and Global.has_done_task:
		outside_label.text = "Good work!"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("interact") and stairs_interact:
		Global.prev_room_x = -400
		get_tree().change_scene_to_file("res://PrototypeLevels/hallway.tscn")
	if Input.is_action_just_pressed("interact") and kitchen_interact:
		Global.prev_room_x = 0
		print("cooking")
		get_tree().change_scene_to_file("res://PrototypeLevels/kitchen.tscn")
	if Input.is_action_just_pressed("interact") and outside_interact:
		Global.prev_room_x = 150
		print("touching grass")
		if Global.day != 2:
			outside_label.text = "I don't feel\nlike it..."
		else:
			get_tree().change_scene_to_file("res://PrototypeLevels/lawn_mowing_minigame.tscn")
	if Input.is_action_just_pressed("interact") and dad_interact:
		dad_speech.text = "\"Not now,\nI'm busy.\""

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

func _on_outside_body_entered(body):
	if body == player:
		outside_interact = true
		outside_label.visible = true

func _on_outside_body_exited(body):
	if body == player:
		outside_interact = false
		outside_label.visible = false


func _on_dad_sense_body_entered(body):
	if body == player:
		dad_speech.visible = true
		dad_interact = true


func _on_dad_sense_body_exited(body):
	if body == player:
		dad_speech.visible = false
		dad_interact = false
