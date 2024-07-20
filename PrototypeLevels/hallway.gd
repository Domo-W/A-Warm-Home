extends Node2D

@onready var homework_box = $HomeworkBox
@onready var homework_hint_label = $HomeworkHintLabel
@onready var player = $stickplayer
@onready var bedroom_label = $BedroomDoor/BedroomLabel

var homework_interact = false
var bedroom_interact = true

func _ready():
	homework_hint_label.visible = false
	bedroom_label.visible = true

func _process(delta):
	if Input.is_action_just_pressed("interact") and homework_interact:
		get_tree().change_scene_to_file("res://PrototypeLevels/homework_minigame.tscn")
	if Input.is_action_just_pressed("interact") and bedroom_interact:
		get_tree().change_scene_to_file("res://PrototypeLevels/bedroom.tscn")

func _on_homework_box_body_entered(body):
	if body == player:
		homework_hint_label.visible = true
		homework_interact = true

func _on_homework_box_body_exited(body):
	if body == player:
		homework_hint_label.visible = false
		homework_interact = false


func _on_bedroom_door_body_exited(body):
	if body == player:
		bedroom_interact = false
		bedroom_label.visible = false

func _on_bedroom_door_body_entered(body):
	if body == player:
		bedroom_interact = true
		bedroom_label.visible = true
