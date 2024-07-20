extends MarginContainer


func _on_day_1_pressed():
	Global.day = 1
	Global.has_done_task = false
	get_tree().change_scene_to_file("res://PrototypeLevels/bedroom.tscn")


func _on_day_2_pressed():
	Global.day = 2
	Global.has_done_task = false
	get_tree().change_scene_to_file("res://PrototypeLevels/bedroom.tscn")


func _on_day_3_pressed():
	Global.day = 3
	Global.has_done_task = false
	get_tree().change_scene_to_file("res://PrototypeLevels/bedroom.tscn")


func _on_day_4_pressed():
	Global.day = 4
	Global.has_done_task = false
	get_tree().change_scene_to_file("res://PrototypeLevels/bedroom.tscn")


func _on_day_5_pressed():
	pass #add jeremy scene here


func _on_return_pressed():
	get_tree().change_scene_to_file("res://PrototypeLevels/main_menu.tscn")
