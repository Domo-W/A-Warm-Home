extends CharacterBody2D
@onready var sprite_2d = $Sprite2D

const VSPEED = 200.0
const HSPEED = 200.0

var can_hide := false
var is_hidden := false

func _physics_process(delta):
	var updown = Input.get_axis("move_up", "move_down")
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		sprite_2d.flip_h = true
	elif direction < 0:
		sprite_2d.flip_h = false
	
	if direction and not is_hidden:
		velocity.x = direction * HSPEED
	else:
		velocity.x = move_toward(velocity.x, 0, HSPEED)
	if updown and not is_hidden:
		velocity.y = updown * VSPEED
	else:
		velocity.y = move_toward(velocity.y, 0, VSPEED)
	
	
	
	if global_position.y <= 457:
		global_position.y = 457.9
	
	if can_hide and Input.is_action_just_pressed("interact"):
		if is_hidden:
			visible = true
			is_hidden = false
		else:
			visible = false
			is_hidden = true
	print(visible)

	move_and_slide()
