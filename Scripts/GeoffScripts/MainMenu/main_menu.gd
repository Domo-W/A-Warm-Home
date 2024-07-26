extends MarginContainer
@onready var incorrect = $"../Incorrect"

func _ready():
	ActualCreepy.playing = false
	HappyEnvironment.playing = false
	if not MenuMusic.playing:
		MenuMusic.playing = true
	Global.reset_game()


func _on_new_game_pressed():
	MenuButtonSound.play()
	get_tree().change_scene_to_file("res://PrototypeLevels/bedroom.tscn")


func _on_day_pick_pressed():
	MenuButtonSound.play()
	get_tree().change_scene_to_file("res://PrototypeLevels/new_day_select_menu.tscn")


func _on_options_pressed():
	incorrect.play()
