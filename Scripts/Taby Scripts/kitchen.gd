extends Node2D

@onready var player = $stickplayer

@onready var living_room_label = $LivingRoomDoor/LivingRoomLabel
@onready var homework_label = $Homework/HomeworkLabel
@onready var mom = $Decor/Mom
@onready var trash_can = $TrashCan

var living_interact = (Global.prev_room_x == -130)
var homework_interact = (Global.prev_room_x == -120)
var trash = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if not homework_interact:
		DoorClick.play()
	if (Global.day < 3 or (Global.day == 3 and not Global.has_done_task)) and not HappyEnvironment.playing:
		HappyEnvironment.playing = true
	elif Global.day >= 3 and not ActualCreepy.playing:
		ActualCreepy.playing = true
	if Global.trash_collected[5]:
		trash_can.empty()
	player.position.x = Global.prev_room_x
	living_room_label.visible = living_interact
	homework_label.visible = homework_interact
	if Global.day == 1:
		if Global.has_done_task == true:
			homework_label.text = "I'm a\nfailure..."
		else:
			mom.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("interact") and living_interact:
		Global.prev_room_x = -130
		DoorClick.play()
		get_tree().change_scene_to_file("res://PrototypeLevels/living_room.tscn")
	if Input.is_action_just_pressed("interact") and homework_interact:
		Global.prev_room_x = -226
		if Global.day != 1:
			homework_label.text = "I'll do it\nanother day..."
		else:
			get_tree().change_scene_to_file("res://PrototypeLevels/homework_minigame.tscn")
	if Input.is_action_just_pressed("interact") and trash and Global.day == 4:
		Global.trash_collected[5] = true
		print(Global.trash_collected)
		trash_can.empty()

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

func _on_trash_area_body_entered(body):
	trash = true

func _on_trash_area_body_exited(body):
	trash = false
