extends MarginContainer

func _on_new_game_pressed():
	Global.day = 1
	Global.has_done_task = false
	get_tree().change_scene_to_file("res://PrototypeLevels/bedroom.tscn")


func _on_day_pick_pressed():
	get_tree().change_scene_to_file("res://PrototypeLevels/new_day_select_menu.tscn")


func _on_options_pressed():
	pass
