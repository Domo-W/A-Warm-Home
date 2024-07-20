extends CharacterBody2D
@onready var sprite_2d = $Sprite2D

const VSPEED = 200.0
const HSPEED = 200.0
#458

func _physics_process(delta):
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
	
	
	if global_position.y <= 457:
		global_position.y = 457.9
	

	move_and_slide()
