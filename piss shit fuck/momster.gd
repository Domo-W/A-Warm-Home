extends CharacterBody2D

@export var player: CharacterBody2D
@onready var animation_player = $AnimationPlayer

@onready var nav := $NavigationAgent2D
@onready var leave_room_timer := $LeaveRoomTimer
@onready var doors_list = get_tree().get_nodes_in_group("Doors")

var leave_room := false
var speed := 75.0
var accel := 7
var move_direction = Vector2.ZERO
var wander_time = 0
var door
var current_state

enum states {CHASING, ROAMING, LEAVING}

func _ready():
	current_state = states["ROAMING"]

func _process(delta):
	animation_player.play("momster")
	if not leave_room:
		current_state = states["ROAMING"]
		if leave_room_timer.is_stopped():
			leave_room_timer.wait_time = randf_range(5, 15)
			leave_room_timer.start()
			print("timer start")
	elif player.is_hidden == false:
		current_state = states["CHASING"]
		door = null

func _physics_process(delta):
	var direction = Vector3.ZERO
	if current_state == 0: # CHASING
		nav.target_position = player.global_position
		
		direction = nav.get_next_path_position() - global_position
		direction = direction.normalized()

		velocity = velocity.lerp(direction * speed, accel * delta)
	
	if current_state == 1: # ROAMING
		velocity = move_direction * speed
		
		
		if wander_time > 0:
			wander_time -= delta
		else:
			randomize_wander()

	if current_state == 2:
		if door:
			nav.target_position = door.global_position
			direction = nav.get_next_path_position() - global_position
			direction = direction.normalized()
			velocity = velocity.lerp(direction * speed, accel * delta)
		else:
			door = doors_list.pick_random()

		
	move_and_slide()

func _on_timer_timeout():
	leave_room = true
	current_state = states["LEAVING"]

func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_time = randf_range(1, 3)


func _on_area_2d_body_entered(body):
	if "player" in body.name:
		get_tree().change_scene_to_file("res://PrototypeLevels/real_main_menu.tscn")
