extends Area2D
@onready var sprite_2d = $Sprite2D
@onready var grass_spawner = $".."



func _on_body_entered(body):
	grass_spawner.add_point()
	queue_free()
