extends Node2D

@onready var player = %stickplayer
@onready var camera_2d = %Camera2D

@onready var hallway_right_door = %hallway_right_door
@onready var bedroom = %bedroom
@onready var bedroom_2 = %bedroom_2
@onready var hallway_left_door = %hallway_left_door
@onready var livingroom_stairs = %livingroom_stairs
@onready var hallway_stairs = %hallway_stairs
@onready var kitchen = %kitchen
@onready var livingroom = %livingroom




func _physics_process(delta):
	#if Global.is_in_bedroom:
		#camera_2d.limit_left = 280
		#camera_2d.limit_top = 68
		#camera_2d.limit_right = 581
		#camera_2d.limit_bottom = 176
	#elif Global.is_in_bedroom2:
		#camera_2d.limit_left = -825
		#camera_2d.limit_top = 68
		#camera_2d.limit_right = -603
		#camera_2d.limit_bottom = 176
	#elif Global.is_in_hallway:
		#camera_2d.limit_left = -382
		#camera_2d.limit_top = 68
		#camera_2d.limit_right = 162
		#camera_2d.limit_bottom = 176
	#elif Global.is_in_kitchen:
		#camera_2d.limit_left = -734
		#camera_2d.limit_top = 592
		#camera_2d.limit_right = -452
		#camera_2d.limit_bottom = 704
	#elif Global.is_in_living_room:
		#camera_2d.limit_left = 100
		#camera_2d.limit_top = 550
		#camera_2d.limit_right = 500
		#camera_2d.limit_bottom = 785

	if Input.is_action_just_pressed("interact"):
		if Global.can_move_to_hallway_from_bedroom:
			print("WTF")
			player.position = hallway_right_door.global_position
		if Global.can_move_to_hallway_from_bedroom_2:
			print("AHHHHHHHH")
			player.position = hallway_left_door.global_position
		if Global.can_move_to_hallway_from_living:
			player.position = hallway_stairs.global_position
		if Global.can_move_to_bedroom_from_hallway:
			player.position = bedroom.global_position
		if Global.can_move_to_bedroom_2_from_hallway:
			player.position = bedroom_2.global_position
		if Global.can_move_to_kitchen_from_living:
			player.position = kitchen.global_position
		if Global.can_move_to_living_from_kitchen:
			player.position = livingroom.global_position
		if Global.can_move_to_living_from_hallway:
			player.position = livingroom_stairs.global_position
		if Global.can_win:
			get_tree().change_scene_to_file("res://PrototypeLevels/main_menu.tscn")
