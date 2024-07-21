extends Node2D

@onready var player = $stickplayer
@onready var bedroom_label = $BedroomDoor/BedroomLabel
@onready var bedroom2_label = $Bedroom2Door/Bedroom2Label
@onready var attic_label = $AtticEntrance/AtticLabel
@onready var stairs_label = $Stairs/StairsLabel
@onready var trash_can = $TrashCan
@onready var trash_can_2 = $TrashCan2

var bedroom_interact = (Global.prev_room_x == 80)
var bedroom2_interact = (Global.prev_room_x == -60)
var attic_interact = (Global.prev_room_x == -250)
var stairs_interact = (Global.prev_room_x == -400)
var trash1 = false
var trash2 = false

func _ready():
	DoorClick.play()
	if (Global.day < 3 or (Global.day == 3 and not Global.has_done_task)) and not HappyEnvironment.playing:
		HappyEnvironment.playing = true
	elif Global.day >= 3 and not ActualCreepy.playing:
		ActualCreepy.playing = true
	player.position.x = Global.prev_room_x
	bedroom_label.visible = bedroom_interact
	bedroom2_label.visible = bedroom2_interact
	attic_label.visible = attic_interact
	stairs_label.visible = stairs_interact
	if Global.trash_collected[1]:
		trash_can.empty()
	if Global.trash_collected[2]:
		trash_can_2.empty()
	if Global.day == 4 and Global.has_done_task:
		attic_label.text = "Good work!"

func _process(delta):
	if Input.is_action_just_pressed("interact") and bedroom_interact:
		Global.prev_room_x = 80
		get_tree().change_scene_to_file("res://PrototypeLevels/bedroom.tscn")
	if Input.is_action_just_pressed("interact") and bedroom2_interact:
		Global.prev_room_x = -60
		get_tree().change_scene_to_file("res://PrototypeLevels/bedroom_2.tscn")
	if Input.is_action_just_pressed("interact") and attic_interact:
		Global.prev_room_x = -250
		print("dusty")
		if Global.day != 3:
			attic_label.text = "I don't think\n I need to do \nthat today..."
		else:
			get_tree().change_scene_to_file("res://PrototypeLevels/attic_redo.tscn")
	if Input.is_action_just_pressed("interact") and stairs_interact:
		Global.prev_room_x = 0
		print("fell off")
		get_tree().change_scene_to_file("res://PrototypeLevels/living_room.tscn")
	if Input.is_action_just_pressed("interact") and trash1:
		Global.trash_collected[1] = true
		print(Global.trash_collected)
		trash_can.empty()
	if Input.is_action_just_pressed("interact") and trash2:
		Global.trash_collected[2] = true
		print(Global.trash_collected)
		trash_can_2.empty()

func _on_bedroom_door_body_exited(body):
	if body == player:
		bedroom_interact = false
		bedroom_label.visible = false

func _on_bedroom_door_body_entered(body):
	if body == player:
		bedroom_interact = true
		bedroom_label.visible = true

func _on_bedroom_2_door_body_entered(body):
	if body == player:
		bedroom2_interact = true
		bedroom2_label.visible = true

func _on_bedroom_2_door_body_exited(body):
	if body == player:
		bedroom2_interact = false
		bedroom2_label.visible = false

func _on_attic_entrance_body_entered(body):
	if body == player:
		attic_interact = true
		attic_label.visible = true

func _on_attic_entrance_body_exited(body):
	if body == player:
		attic_interact = false
		attic_label.visible = false

func _on_stairs_body_entered(body):
	if body == player:
		stairs_interact = true
		stairs_label.visible = true

func _on_stairs_body_exited(body):
	if body == player:
		stairs_interact = false
		stairs_label.visible = false


func _on_trash_area_body_entered(body):
	trash1 = true

func _on_trash_area_body_exited(body):
	trash1 = false

func _on_trash_area_2_body_entered(body):
	trash2 = true

func _on_trash_area_2_body_exited(body):
	trash2 = false
