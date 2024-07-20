extends CharacterBody2D

@export var player: CharacterBody2D

@onready var nav := $NavigationAgent2D
@onready var hiding_places_list = get_tree().get_nodes_in_group("HidingLocation")


var speed := 175.0
var accel := 7
var target_object
var current_state

enum states {CHASING, ROAMING}

func _ready():
	current_state = states["ROAMING"]

func _physics_process(delta):
	if current_state == 0: # CHASE
		var direction = Vector3.ZERO
		nav.target_position = player.global_position
		
		direction = nav.get_next_path_position() - global_position
		direction = direction.normalized()

		velocity = velocity.lerp(direction * speed, accel * delta)
	
	if current_state == 1: # ROAM
		if target_object:
			velocity = position.direction_to(target_object.global_position) * speed * delta
		
		
	move_and_slide()


func _on_detection_area_body_entered(body):
	# check if it's the player
	if body == player:
		current_state = states["CHASING"]
	
	if body in hiding_places_list:
		target_object = body
		print(target_object)
