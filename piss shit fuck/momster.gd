extends CharacterBody2D

@export var player: CharacterBody2D
@onready var animation_player = $AnimationPlayer

@onready var nav := $NavigationAgent2D
@onready var wait_around_timer = $WaitAroundTimer
@onready var lose_screen = $"../../stickplayer/Camera2D/Lose Screen"


var leave_room := false
var chasing_speed := 190.0
var wandering_speed := 70.0
var accel := 7
var move_direction = Vector2.ZERO
var wander_time = 0
var door
var current_state

enum states {CHASING, ROAMING}

func _ready():
	current_state = states["ROAMING"]

func _process(delta):
	animation_player.play("momster")
	if player.is_hidden == false:
		current_state = states["CHASING"]
	else:
		current_state = states["ROAMING"]

func _physics_process(delta):
	var direction = Vector3.ZERO
	if current_state == 0: # CHASING
		nav.target_position = player.global_position
		
		direction = nav.get_next_path_position() - global_position
		direction = direction.normalized()

		velocity = velocity.lerp(direction * chasing_speed, accel * delta)
	
	if current_state == 1: # ROAMING
		velocity = move_direction * wandering_speed
		
		if wander_time > 0:
			wander_time -= delta
		else:
			randomize_wander()
		
	move_and_slide()

func randomize_wander():
	move_direction = Vector2(randf_range(1, 5), randf_range(-1, 1)).normalized()
	wander_time = randf_range(1, 3)


func _on_area_2d_body_entered(body):
	if "player" in body.name and !player.is_hidden:
		get_tree().change_scene_to_file("res://piss shit fuck/piss shit fuck pt 2/lose_screen.tscn")
		Global.reset_game()
