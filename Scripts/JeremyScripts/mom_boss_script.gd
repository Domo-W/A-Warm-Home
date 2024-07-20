extends CharacterBody2D

@export var player: CharacterBody2D

var speed = 300.0

func _physics_process(delta):
	

	velocity = position.direction_to(player.position) * speed
	move_and_slide()
