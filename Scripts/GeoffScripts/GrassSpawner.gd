extends Node
var grass_scene = preload("res://Scripts/GeoffScripts/mowing_grass.tscn")
var score = 0


func add_point():
	score += 1
	
	
func _on_timeout():
	var grass = grass_scene.instantiate()
	grass.position = Vector2(randi_range(-200, 200), randi_range(-200, 200))
	add_child(grass)

