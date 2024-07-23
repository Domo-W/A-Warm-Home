extends Node2D

@onready var player = %stickplayer
@onready var audio_stream_player_2d = $"../AudioStreamPlayer2D"
@onready var blocking_momster = $"../Collision Walls/StaticBody2D10/Blocking Momster"

func _on_bedroom_area_body_entered(body):
	if "player" in body.name:
		Global.is_in_room = Global.room_states["IS_IN_BEDROOM"]


func _on_bedroom_area_body_exited(body):
	if "player" in body.name:
		Global.is_in_room = null


func _on_hallway_area_body_entered(body):
	if "player" in body.name:
		Global.is_in_room = Global.room_states["IS_IN_HALLWAY"]

func _on_hallway_area_body_exited(body):
	if "player" in body.name:
		Global.is_in_room = null


func _on_bedroom_2_area_body_entered(body):
	if "player" in body.name:
		Global.is_in_room = Global.room_states["IS_IN_BEDROOM_2"]


func _on_bedroom_2_area_body_exited(body):
	if "player" in body.name:
		Global.is_in_room = null


func _on_living_room_area_body_entered(body):
	if "player" in body.name:
		Global.is_in_room = Global.room_states["IS_IN_LIVING_ROOM"]


func _on_living_room_area_body_exited(body):
	if "player" in body.name:
		Global.is_in_room = null


func _on_kitchen_area_body_entered(body):
	if "player" in body.name:
		Global.is_in_room = Global.room_states["IS_IN_KITCHEN"]
		Global.met_momster = true
		ActualCreepy.stop()
		audio_stream_player_2d.play()


func _on_kitchen_area_body_exited(body):
	if "player" in body.name:
		Global.is_in_room = null


func _on_nightmare_area_body_entered(body):
		if "player" in body.name:
			Global.is_in_room = Global.room_states["IS_IN_NIGHTMARE_ROOM"]


func _on_nightmare_area_body_exited(body):
	if "player" in body.name:
		Global.is_in_room = null



func _on_area_2d_body_entered(body):
	if "player" in body.name:
		blocking_momster.queue_free()
