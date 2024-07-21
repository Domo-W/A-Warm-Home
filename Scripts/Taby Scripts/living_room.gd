extends Node2D

@onready var player = $stickplayer

@onready var stairs_label = $Stairs/StairsLabel
@onready var kitchen_label = $KitchenDoor/KitchenLabel
@onready var outside_label = $Outside/OutsideLabel
@onready var dad_speech = $Decor/Dad/DadSense/DadSpeech
@onready var trash_can = $TrashCan

var stairs_interact = (Global.prev_room_x == 0)
var kitchen_interact = (Global.prev_room_x == -130)
var outside_interact = (Global.prev_room_x == 150)
var dad_interact = false
var trash = false

# Called when the node enters the scene tree for the first time.
func _ready():
	player.position.x = Global.prev_room_x
	stairs_label.visible = stairs_interact
	kitchen_label.visible = kitchen_interact
	outside_label.visible = outside_interact
	if Global.day == 2 and Global.has_done_task:
		outside_label.text = "Good work!"
	if Global.trash_collected[4]:
		trash_can.empty()
	if Global.day == 4:
		outside_label.text = "Take out\ntrash?"

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
		if Global.day == 4 and Global.trash_collected == [true, true, true, true, true, true]:
			get_tree().change_scene_to_file("res://PrototypeLevels/trash_pickup_minigame.tscn")
		elif Global.day == 4:
			outside_label.text = "I need all\nthe trash.."
		elif Global.day != 2:
			outside_label.text = "I don't feel\nlike it..."
		elif not Global.has_done_task:
			get_tree().change_scene_to_file("res://PrototypeLevels/lawn_mowing_minigame.tscn")
	if Input.is_action_just_pressed("interact") and dad_interact:
		dad_speech.text = "\"Not now,\nI'm busy.\""
	if Input.is_action_just_pressed("interact") and trash:
		Global.trash_collected[4] = true
		print(Global.trash_collected)
		trash_can.empty()

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

func _on_trash_area_body_entered(body):
	trash = true

func _on_trash_area_body_exited(body):
	trash = false
