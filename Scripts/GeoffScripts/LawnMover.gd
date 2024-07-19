extends CharacterBody2D
@onready var sprite_2d = $Sprite2D

const VSPEED = 50.0
const HSPEED = 100.0

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var updown = Input.get_axis("move_up", "move_down")
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		sprite_2d.flip_h = true
	elif direction < 0:
		sprite_2d.flip_h = false
	
	if direction:
		velocity.x = direction * HSPEED
	else:
		velocity.x = move_toward(velocity.x, 0, HSPEED)
	if updown:
		velocity.y = updown * VSPEED
	else:
		velocity.y = move_toward(velocity.y, 0, VSPEED)
		

	move_and_slide()
