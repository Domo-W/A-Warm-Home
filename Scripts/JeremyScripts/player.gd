extends CharacterBody2D
@onready var sprite = $Sprite2D
@onready var interact_label = $InteractLabel
@onready var collision = $CollisionShape2D

const VSPEED = 200.0
const HSPEED = 200.0

var can_hide := false
var is_hidden := false

func _physics_process(delta):
	var updown = Input.get_axis("move_up", "move_down")
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		sprite.flip_h = true
	elif direction < 0:
		sprite.flip_h = false
	
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
	
	if can_hide:
		interact_label.visible = true
		if not is_hidden:
			interact_label.text = "Press E to Hide"
		else:
			interact_label.text = "Press E to Leave"
		
		if Input.is_action_just_pressed("interact"):
			if is_hidden:
				sprite.self_modulate.a = 1
				is_hidden = false
			else:
				sprite.self_modulate.a = 0
				is_hidden = true
	else:
		interact_label.visible = false
	
	
	move_and_slide()
