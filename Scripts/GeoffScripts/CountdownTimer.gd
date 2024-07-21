extends Node2D
@onready var label = $CountDownLabel
@onready var timer = $Timer
@onready var end_screen = %EndScreen
@onready var lawn_player = %LawnPlayer

func _ready():
	end_screen.visible  = false
	timer.start(30)
	
func time_left():
	var time_left = timer.time_left
	var second = int(time_left)
	return str(second)

func _process(delta):
	label.text = "TIME:" + time_left()

func _on_timer_timeout():
	lawn_player.end_lawn_boy()
	end_screen.visible  = true
