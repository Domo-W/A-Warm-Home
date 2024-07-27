extends MarginContainer


func _on_day_1_pressed():
	MenuButtonSound.play()
	Global.day = 1
	get_tree().change_scene_to_file("res://PrototypeLevels/bedroom.tscn")


func _on_day_2_pressed():
	MenuButtonSound.play()
	Global.day = 2
	get_tree().change_scene_to_file("res://PrototypeLevels/bedroom.tscn")


func _on_day_3_pressed():
	MenuButtonSound.play()
	Global.day = 3
	get_tree().change_scene_to_file("res://PrototypeLevels/bedroom.tscn")


func _on_day_4_pressed():
	MenuButtonSound.play()
	Global.day = 4
	Global.trash_collected = [false, false, false, false, false, false]
	get_tree().change_scene_to_file("res://PrototypeLevels/bedroom.tscn")


func _on_day_5_pressed():
	MenuButtonSound.play()
	Global.is_day_five = true
	get_tree().change_scene_to_file("res://piss shit fuck/mom_boss_fight_day_5.tscn")


func _on_return_pressed():
	MenuButtonSound.play()
	get_tree().change_scene_to_file("res://PrototypeLevels/real_main_menu.tscn")
