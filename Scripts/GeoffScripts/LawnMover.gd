extends CharacterBody2D
@onready var sprite_2d = $AnimatedSprite2D

const VSPEED = 30.0
const HSPEED = 60.0

func end_lawn_boy():
	queue_free()

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var updown = Input.get_axis("move_up", "move_down")
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		sprite_2d.offset.x = -12
		sprite_2d.flip_h = false
	elif direction < 0:
		sprite_2d.offset.x = 12
		sprite_2d.flip_h = true
	
	if direction:
		velocity.x = direction * HSPEED
		sprite_2d.animation = "walk"
	else:
		velocity.x = move_toward(velocity.x, 0, HSPEED)
	if updown:
		velocity.y = updown * VSPEED
		sprite_2d.animation = "walk"
	else:
		velocity.y = move_toward(velocity.y, 0, VSPEED)
	
	if not direction and not updown:
		sprite_2d.animation = "idle"

	move_and_slide()
