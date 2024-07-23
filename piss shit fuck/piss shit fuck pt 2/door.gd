extends Node2D

@onready var marker_2d = $Marker2D



func _on_area_2d_body_entered(body):
	if "player" in body.name:
		body.position = marker_2d.position


func _on_area_2d_body_exited(body):
	pass # Replace with function body.
