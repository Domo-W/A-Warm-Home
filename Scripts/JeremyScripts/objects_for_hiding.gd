extends StaticBody2D

@export var player: CharacterBody2D


func _on_area_2d_body_entered(body):
	if body == player:
		player.can_hide = true


func _on_area_2d_body_exited(body):
	if body == player:
		player.can_hide = false
