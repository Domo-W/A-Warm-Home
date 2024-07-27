extends Timer
func _ready():
	Footsteps.stop()
	
func _on_timeout():
	if Global.day != 5:
		get_tree().change_scene_to_file("res://PrototypeLevels/bedroom.tscn")
	else:
		Global.is_day_five = true
		get_tree().change_scene_to_file("res://piss shit fuck/mom_boss_fight_day_5.tscn")
