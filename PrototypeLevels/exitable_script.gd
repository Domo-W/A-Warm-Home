extends Area2D

@export var boss : CharacterBody2D


func _on_area_2d_body_entered(body):
	if body == boss:
		body.queue_free()
		print("Mom left")
