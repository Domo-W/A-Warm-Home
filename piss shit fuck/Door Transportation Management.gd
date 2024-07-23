extends Node2D

@onready var hallway_right_door = %hallway_right_door
@onready var bedroom = %bedroom
@onready var bedroom_2 = %bedroom_2
@onready var hallway_left_door = %hallway_left_door
@onready var livingroom_stairs = %livingroom_stairs
@onready var hallway_stairs = %hallway_stairs
@onready var kitchen = %kitchen
@onready var livingroom = %livingroom
@onready var nightmareroom = %nightmareroom

@onready var player = %stickplayer
@onready var door_label = $"../ROOMS/Bedroom/Decor/BedBottom/DoorLabel"

enum can_tp_states {
	CAN_GO_TO_BEDROOM,
	CAN_GO_FROM_BEDROOM_TO_HALLWAY,
	CAN_GO_TO_BEDROOM_2,
	CAN_GO_FROM_BEDROOM_2_TO_HALLWAY,
	CAN_GO__FROM_HALLWAY_TO_LIVING_ROOM,
	CAN_GO_FROM_LIVING_ROOM_TO_HALLWAY,
	CAN_GO_TO_KITCHEN,
	CAN_GO_FROM_KITCHEN_TO_LIVING_ROOM,
	CAN_GO_TO_NIGHTMARE_ROOM
}
var tp_to



func _physics_process(delta):
	if Input.is_action_just_pressed("interact"):
		if tp_to == can_tp_states["CAN_GO_FROM_BEDROOM_TO_HALLWAY"]:
			player.position = hallway_right_door.global_position
			Global.is_in_room = Global.room_states["IS_IN_HALLWAY"]
		elif tp_to == can_tp_states["CAN_GO_TO_BEDROOM"]:
			player.position = bedroom.global_position
			Global.is_in_room = Global.room_states["IS_IN_BEDROOM"]
		elif tp_to == can_tp_states["CAN_GO_TO_BEDROOM_2"]:
			player.position = bedroom_2.global_position
			Global.is_in_room = Global.room_states["IS_IN_BEDROOM_2"]
		elif tp_to == can_tp_states["CAN_GO_FROM_BEDROOM_2_TO_HALLWAY"]:
			player.position = hallway_left_door.global_position
			Global.is_in_room = Global.room_states["IS_IN_HALLWAY"]
		elif tp_to == can_tp_states["CAN_GO__FROM_HALLWAY_TO_LIVING_ROOM"]:
			player.position = livingroom_stairs.global_position
			Global.is_in_room = Global.room_states["IS_IN_LIVING_ROOM"]
		elif tp_to == can_tp_states["CAN_GO_FROM_LIVING_ROOM_TO_HALLWAY"]:
			player.position = hallway_stairs.global_position
			Global.is_in_room = Global.room_states["IS_IN_HALLWAY"]
		elif tp_to == can_tp_states["CAN_GO_TO_KITCHEN"]:
			player.position = kitchen.global_position
			Global.is_in_room = Global.room_states["IS_IN_KITCHEN"]
		elif tp_to == can_tp_states["CAN_GO_FROM_KITCHEN_TO_LIVING_ROOM"]:
			player.position = livingroom.global_position
			Global.is_in_room = Global.room_states["IS_IN_LIVING_ROOM"]
		elif tp_to == can_tp_states["CAN_GO_TO_NIGHTMARE_ROOM"]:
			player.position = nightmareroom.global_position
			Global.is_in_room = Global.room_states["IS_IN_NIGHTMARE_ROOM"]


func _on_bedroom_to_hallway_body_entered(body):
	if "player" in body.name:
		tp_to = can_tp_states["CAN_GO_FROM_BEDROOM_TO_HALLWAY"]
func _on_bedroom_to_hallway_body_exited(body):
	if "player" in body.name:
		tp_to = null

func _on_hallway_to_bedroom_body_entered(body):
	if "player" in body.name:
		tp_to = can_tp_states["CAN_GO_TO_BEDROOM"]


func _on_hallway_to_bedroom_body_exited(body):
	if "player" in body.name:
		tp_to = null


func _on_hallway_to_bedroom_2_body_entered(body):
	if "player" in body.name:
		tp_to = can_tp_states["CAN_GO_TO_BEDROOM_2"]


func _on_hallway_to_bedroom_2_body_exited(body):
	if "player" in body.name:
		tp_to = null


func _on_bedroom_2_to_hallway_body_entered(body):
	if "player" in body.name:
		tp_to = can_tp_states["CAN_GO_FROM_BEDROOM_2_TO_HALLWAY"]


func _on_bedroom_2_to_hallway_body_exited(body):
	if "player" in body.name:
		tp_to = null


func _on_upstairs_to_downstairs_body_entered(body):
	if "player" in body.name:
		tp_to = can_tp_states["CAN_GO__FROM_HALLWAY_TO_LIVING_ROOM"]


func _on_upstairs_to_downstairs_body_exited(body):
	if "player" in body.name:
		tp_to = null


func _on_downstairs_to_upstairs_body_entered(body):
	if "player" in body.name:
		tp_to = can_tp_states["CAN_GO_FROM_LIVING_ROOM_TO_HALLWAY"]


func _on_downstairs_to_upstairs_body_exited(body):
	if "player" in body.name:
		tp_to = null


func _on_living_to_kitchen_body_entered(body):
	if "player" in body.name:
		tp_to = can_tp_states["CAN_GO_TO_KITCHEN"]


func _on_living_to_kitchen_body_exited(body):
	if "player" in body.name:
		tp_to = null


func _on_kitchen_to_living_body_entered(body):
	if "player" in body.name:
		tp_to = can_tp_states["CAN_GO_FROM_KITCHEN_TO_LIVING_ROOM"]


func _on_kitchen_to_living_body_exited(body):
	if "player" in body.name:
		tp_to = null


func _on_stairs_to_nightmare_room_body_entered(body):
	if ("player" in body.name) and (Global.met_momster == true):
		tp_to = can_tp_states["CAN_GO_TO_NIGHTMARE_ROOM"]


func _on_stairs_to_nightmare_room_body_exited(body):
	if "player" in body.name:
		tp_to = null


func _on_area_2d_body_entered(body):
	if "player" in body.name:
		door_label.visible = true

func _on_area_2d_body_exited(body):
	if "player" in body.name:
		door_label.visible = false
