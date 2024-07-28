extends Node2D

@onready var player = %stickplayer

func _physics_process(delta):
	if Input.is_action_just_pressed("interact") and Global.can_win:
		get_tree().change_scene_to_file("res://piss shit fuck/piss shit fuck pt 2/win_screen.tscn")

func _on_door_1_body_entered(body):
	if "player" in body.name:
		player.can_hide = true


func _on_door_1_body_exited(body):
	if "player" in body.name:
		player.can_hide = false



func _on_door_2_body_entered(body):
	if "player" in body.name:
		player.can_hide = true


func _on_door_2_body_exited(body):
	if "player" in body.name:
		player.can_hide = false


func _on_door_3_body_entered(body):
	if "player" in body.name:
		player.can_hide = true


func _on_door_3_body_exited(body):
	if "player" in body.name:
		player.can_hide = false


func _on_door_4_body_entered(body):
	if "player" in body.name:
		player.can_hide = true


func _on_door_4_body_exited(body):
	if "player" in body.name:
		player.can_hide = false

func _on_door_5_body_entered(body):
	if "player" in body.name:
		player.can_hide = true


func _on_door_5_body_exited(body):
	if "player" in body.name:
		Global.can_win = false


func _on_door_6_body_entered(body):
	if "player" in body.name:
		player.can_hide = true


func _on_door_6_body_exited(body):
	if "player" in body.name:
		Global.can_win = false







func _on_area_2d_body_entered(body):
	if "player" in body.name:
		Global.can_win = true


func _on_area_2d_body_exited(body):
	if "player" in body.name:
		Global.can_win = false
