extends Area2D
@onready var lawn_game_manager = %LawnGameManager

@onready var grass_spawner = $".."




func _on_body_entered(body):
	grass_spawner.add_point()
	queue_free()
