extends Node
var grass_scene = preload("res://Scripts/GeoffScripts/mowing_grass.tscn")
var score = 0
@onready var label = $Label
@onready var cpu_particles_2d = $"../Player/CPUParticles2D"


func add_point():
	score += 1
	label.text = str(score)
	cpu_particles_2d.emitting = true
	
func _on_timeout():
	var grass = grass_scene.instantiate()
	grass.position = Vector2(randi_range(-120, 120), randi_range(20, 50))
	add_child(grass)

