extends Node2D

#Geoff
var is_dragging_trash = false

var is_dragging_box = false

#taby
var fresh_start = true
var prev_room_x = 80
var day = 1
var has_done_task = false
var trash_collected = [false, false, false, false, false, false]

#JEREMY
enum room_states {
	IS_IN_BEDROOM,
	IS_IN_HALLWAY,
	IS_IN_BEDROOM_2,
	IS_IN_LIVING_ROOM,
	IS_IN_KITCHEN,
	IS_IN_NIGHTMARE_ROOM
}
var is_in_room
var is_day_five = false

var met_momster = false
var can_hide = false
var can_win = false
