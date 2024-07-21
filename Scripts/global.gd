extends Node2D

#Geoff
var is_dragging_trash = false

var is_dragging_box = false

#taby
var fresh_start = true
var prev_room_x = 80
var day = 1
var has_done_task = false

#JEREMY
var is_in_bedroom = false
var is_in_bedroom2 = false
var is_in_hallway = false
var is_in_kitchen = false
var is_in_living_room = false

var can_move_to_hallway_from_bedroom = false
var can_move_to_hallway_from_bedroom_2 = false
var can_move_to_hallway_from_living = false

var can_move_to_bedroom_from_hallway = false
var can_move_to_bedroom_2_from_hallway = false
var can_move_to_kitchen_from_living = false

var can_move_to_living_from_kitchen = false
var can_move_to_living_from_hallway = false

var can_win = false
