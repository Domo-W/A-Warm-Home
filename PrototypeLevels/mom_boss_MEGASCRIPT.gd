extends Node2D

@onready var player = %stickplayer
@onready var camera_2d = %Camera2D
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

@onready var hallway_right_door = %hallway_right_door
@onready var bedroom = %bedroom
@onready var bedroom_2 = %bedroom_2
@onready var hallway_left_door = %hallway_left_door
@onready var livingroom_stairs = %livingroom_stairs
@onready var hallway_stairs = %hallway_stairs
@onready var kitchen = %kitchen
@onready var livingroom = %livingroom

@onready var stairs_to_nightmare_room_collision = $"Door Transportation Management/Stairs To Nightmare Room/Stairs To Nightmare Room Collision"
@onready var stairs_to_hallway_collision = $"Door Transportation Management/Downstairs To Upstairs/Stairs To Hallway Collision"

func _ready():
	HappyEnvironment.stop()
	MenuMusic.stop()
	ActualCreepy.stop()


func _physics_process(delta):
	if Global.is_in_room == Global.room_states["IS_IN_BEDROOM"]:
		camera_2d.zoom.x = 6
		camera_2d.zoom.y = 6
		
		camera_2d.limit_left = 280
		camera_2d.limit_top = 58
		camera_2d.limit_right = 581
		camera_2d.limit_bottom = 176
	elif Global.is_in_room == Global.room_states["IS_IN_BEDROOM_2"]:
		camera_2d.zoom.x = 5
		camera_2d.zoom.y = 5
		
		camera_2d.limit_left = -825
		camera_2d.limit_top = 28
		camera_2d.limit_right = -603
		camera_2d.limit_bottom = 176
	elif Global.is_in_room == Global.room_states["IS_IN_HALLWAY"]:
		camera_2d.zoom.x = 6
		camera_2d.zoom.y = 6
		
		camera_2d.limit_left = -373
		camera_2d.limit_top = 68
		camera_2d.limit_right = 131
		camera_2d.limit_bottom = 176
	elif Global.is_in_room == Global.room_states["IS_IN_KITCHEN"]:
		camera_2d.zoom.x = 6
		camera_2d.zoom.y = 6
		
		camera_2d.limit_left = -734
		camera_2d.limit_top = 592
		camera_2d.limit_right = -452
		camera_2d.limit_bottom = 704
	elif Global.is_in_room == Global.room_states["IS_IN_LIVING_ROOM"]:
		camera_2d.zoom.x = 5
		camera_2d.zoom.y = 5
		
		camera_2d.limit_left = 106
		camera_2d.limit_top = 550
		camera_2d.limit_right = 486
		camera_2d.limit_bottom = 784
	elif Global.is_in_room == Global.room_states["IS_IN_NIGHTMARE_ROOM"]:
		camera_2d.zoom.x = 6
		camera_2d.zoom.y = 6
		
		camera_2d.limit_left = -885
		camera_2d.limit_top = 1105
		camera_2d.limit_right = 980
		camera_2d.limit_bottom = 1312
	
	if Global.met_momster == false:
		stairs_to_hallway_collision.disabled = false
		stairs_to_nightmare_room_collision.disabled = true
	elif Global.met_momster == true:
		stairs_to_hallway_collision.disabled = true
		stairs_to_nightmare_room_collision.disabled = false
