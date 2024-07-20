extends CharacterBody2D

@export var player: CharacterBody2D

@onready var nav := $NavigationAgent2D
@onready var leave_room_timer := $LeaveRoomTimer
@onready var doors_list = get_tree().get_nodes_in_group("Doors")

var leave_room := false
var speed := 175.0
var accel := 7
var move_direction = Vector2.ZERO
var wander_time = 0
var current_state

enum states {CHASING, ROAMING, LEAVING}

func _ready():
	current_state = states["ROAMING"]

func _process(delta):
	if player.is_hidden and not leave_room:
		current_state = states["ROAMING"]
	elif player.is_hidden == false:
		current_state = states["CHASING"]

func _physics_process(delta):
	var direction = Vector3.ZERO
	if current_state == 0: # CHASING
		nav.target_position = player.global_position
		
		direction = nav.get_next_path_position() - global_position
		direction = direction.normalized()

		velocity = velocity.lerp(direction * speed, accel * delta)
	
	if current_state == 1: # ROAMING
		leave_room_timer.start(randf_range(3, 10))
		velocity = move_direction * speed
		
		
		if wander_time > 0:
			wander_time -= delta
		else:
			randomize_wander()

	if current_state == 2: # LEAVING
		print("leaving now")
		var door = doors_list.pick_random()
		nav.target_position = door.global_position
		direction = nav.get_next_path_position() - global_position
		direction = direction.normalized()
		velocity = velocity.lerp(direction * speed, accel * delta)
		
	move_and_slide()

func _on_timer_timeout():
	print("TIMEOUT")
	leave_room = true
	current_state = states["LEAVING"]
	

func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_time = randf_range(1, 3)
