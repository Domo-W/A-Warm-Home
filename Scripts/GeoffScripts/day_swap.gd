extends Timer

func _on_timeout():
	get_tree().change_scene_to_file("res://PrototypeLevels/bedroom.tscn")
