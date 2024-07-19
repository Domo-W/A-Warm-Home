extends Area2D
@onready var game_manager = $GameManager


func _on_body_entered(body):
	queue_free()
