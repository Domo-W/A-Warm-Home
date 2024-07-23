extends CharacterBody2D
@onready var sprite_2d = $AnimatedSprite2D
@onready var interact_label = $InteractLabel

var is_hidden = false
var can_hide = false

const VSPEED = 100.0
const HSPEED = 150.0

func _ready():
	sprite_2d.animation = "front"

func _physics_process(_delta):
	var updown = Input.get_axis("move_up", "move_down")
	var direction = Input.get_axis("move_left", "move_right")
	
	#animations
	if direction:
		if not Footsteps.playing:
			Footsteps.playing = true
		sprite_2d.animation = "side_walk"
		if direction > 0:
			sprite_2d.flip_h = false
		elif direction < 0:
			sprite_2d.flip_h = true
	elif updown:
		if not Footsteps.playing:
			Footsteps.playing = true
		if updown > 0:
			sprite_2d.animation = "front_walk"
		elif updown < 0:
			sprite_2d.animation = "back_walk"
	else:
		Footsteps.playing = false
		if sprite_2d.animation.ends_with("walk"):
			sprite_2d.animation = sprite_2d.animation.replace("_walk", "")
	
	if can_hide:
		interact_label.visible = true
		if not is_hidden:
			interact_label.text = "Press E to Hide"
		else:
			interact_label.text = "Press E to Leave"
		
		if Input.is_action_just_pressed("interact"):
			if is_hidden:
				set_collision_layer_value(2, true)
				set_collision_mask_value(2, true)
				sprite_2d.self_modulate.a = 1
				is_hidden = false
			else:
				sprite_2d.self_modulate.a = 0
				set_collision_layer_value(2, false)
				set_collision_mask_value(2, false)
				is_hidden = true
	else:
		interact_label.visible = false
	
	# movement
	if direction and not is_hidden:
		velocity.x = direction * HSPEED
	else:
		velocity.x = move_toward(velocity.x, 0, HSPEED)
	if updown and not is_hidden:
		velocity.y = updown * VSPEED
	else:
		velocity.y = move_toward(velocity.y, 0, VSPEED)
	
	move_and_slide()
