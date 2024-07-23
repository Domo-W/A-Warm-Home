extends MarginContainer


func _on_day_1_pressed():
	Global.day = 1
	get_tree().change_scene_to_file("res://PrototypeLevels/bedroom.tscn")


func _on_day_2_pressed():
	Global.day = 2
	get_tree().change_scene_to_file("res://PrototypeLevels/bedroom.tscn")


func _on_day_3_pressed():
	Global.day = 3
	get_tree().change_scene_to_file("res://PrototypeLevels/bedroom.tscn")


func _on_day_4_pressed():
	Global.day = 4
	get_tree().change_scene_to_file("res://PrototypeLevels/bedroom.tscn")


func _on_day_5_pressed():
	Global.is_day_five = true
	get_tree().change_scene_to_file("res://piss shit fuck/mom_boss_fight_day_5.tscn")


func _on_return_pressed():
	get_tree().change_scene_to_file("res://PrototypeLevels/real_main_menu.tscn")
