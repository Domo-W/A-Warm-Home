extends Node2D
var draggable = false
var is_in_bin = false
var bin_ref
var offset: Vector2
var initialPos: Vector2
@onready var trash_manager = $".."
@onready var t_correct = $"../../TCorrect"
@onready var t_incorrect = $"../../TIncorrect"
@onready var pp = $"../../PP"

func _ready():
	rotation_degrees = randi_range(0,360)

func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			pp.play()
			offset = get_global_mouse_position() - global_position
			Global.is_dragging_trash=true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			Global.is_dragging_trash=false
			var tween = get_tree().create_tween()
			if is_in_bin and str(bin_ref)[0] == "T":
				tween.tween_property(self, "position", bin_ref.position, 0.2).set_ease(Tween.EASE_OUT)
				t_correct.play()
				trash_manager.throw_trash()
				queue_free()
			elif is_in_bin and str(bin_ref)[0] != "T":
				tween.tween_property(self, "global_position", Vector2(randi_range(-150,150),randi_range(0,280)),0.2).set_ease(Tween.EASE_OUT)
				t_incorrect.play()

func _on_area_2d_mouse_entered():
	if not Global.is_dragging_trash:
		draggable = true
		scale = Vector2(0.9, 0.9)

func _on_area_2d_mouse_exited():
	if not Global.is_dragging_trash:
		draggable = false
		scale = Vector2(0.75, 0.75)

func _on_area_2d_body_entered(body:StaticBody2D):
	if body.is_in_group("droppable"):
		is_in_bin = true
		body.modulate = Color(Color.YELLOW, 0.4)
		bin_ref = body

func _on_area_2d_body_exited(body):
	if body.is_in_group("droppable"):
		is_in_bin = false
		body.modulate = Color(Color.YELLOW, 0.2)
