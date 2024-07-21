extends Node2D

@onready var door = $HallwayDoor
@onready var interact_hint_label = $HallwayDoor/InteractHintLabel
@onready var bed_label = $Decor/BedBottom/SleepCheck/BedLabel
@onready var controls_hint = $ControlsHint
@onready var player = $stickplayer
@onready var trash_can = $TrashCan

var exitable = false
var sleepable = true
var trashable = false

func _ready():
	MenuMusic.playing = false
	if (Global.day < 3 or (Global.day == 3 and not Global.has_done_task)) and not HappyEnvironment.playing:
		HappyEnvironment.playing = true
	elif Global.day >= 3 and not ActualCreepy.playing:
		ActualCreepy.playing = true
	player.position.y = 114
	if Global.trash_collected[0]:
		trash_can.empty()
	if not Global.fresh_start:
		DoorClick.play()
		player.position.x = -180
	else:
		Global.has_done_task = false
		if Global.day != 1:
			controls_hint.text = "A new day!"
		controls_hint.visible = true
	Global.fresh_start = false

func _process(_delta):
	if Input.is_action_just_pressed("interact") and exitable:
		print("bye")
		get_tree().change_scene_to_file("res://PrototypeLevels/hallway.tscn")
	if Input.is_action_just_pressed("interact") and sleepable:
		if not Global.has_done_task:
			bed_label.visible = true
			controls_hint.visible = false
		else:
			print("good day")
			Global.fresh_start = true
			Global.day += 1
			get_tree().change_scene_to_file("res://PrototypeLevels/day_switch.tscn")
	if Input.is_action_just_pressed("interact") and trashable:
		Global.trash_collected[0] = true
		print(Global.trash_collected)
		trash_can.empty()

func _on_hallway_door_body_entered(body):
	if body == player:
		exitable = true
		interact_hint_label.visible = true

func _on_hallway_door_body_exited(body):
	if body == player:
		exitable = false
		interact_hint_label.visible = false

func _on_sleep_check_body_entered(body):
	if body == player:
		sleepable = true

func _on_sleep_check_body_exited(body):
	if body == player:
		sleepable = false
		bed_label.visible = false

func _on_trash_area_body_entered(body):
	trashable = true

func _on_trash_area_body_exited(body):
	trashable = false
