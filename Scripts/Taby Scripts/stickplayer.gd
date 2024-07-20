extends CharacterBody2D
@onready var sprite_2d = $AnimatedSprite2D


const VSPEED = 100.0
const HSPEED = 150.0

func _ready():
	sprite_2d.animation = "front"

func _physics_process(_delta):
	var updown = Input.get_axis("move_up", "move_down")
	var direction = Input.get_axis("move_left", "move_right")
	
	#animations
	if direction:
		sprite_2d.animation = "side_walk"
		if direction > 0:
			sprite_2d.flip_h = false
		elif direction < 0:
			sprite_2d.flip_h = true
	elif updown:
		if updown > 0:
			sprite_2d.animation = "front_walk"
		elif updown < 0:
			sprite_2d.animation = "back_walk"
	else:
		if sprite_2d.animation.ends_with("walk"):
			sprite_2d.animation = sprite_2d.animation.replace("_walk", "")
	
	if direction:
		velocity.x = direction * HSPEED
	else:
		velocity.x = move_toward(velocity.x, 0, HSPEED)
	if updown:
		velocity.y = updown * VSPEED
	else:
		velocity.y = move_toward(velocity.y, 0, VSPEED)

	move_and_slide()
