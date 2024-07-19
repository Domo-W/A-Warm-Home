extends Node2D

var score = 0
var grass_scene = preload("res://Scripts/GeoffScripts/mowing_grass.tscn")

func add_point():
	score += 1

func _on_Timer_Timeout():
	var grass = grass_scene.instantiate()
	grass.position = Vector2(rand_range(20, 1000), -20)
