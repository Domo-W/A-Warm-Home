extends Node2D
var draggable = false
var is_in_bin = false
var bin_ref
var offset: Vector2
var initialPos: Vector2

func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			offset = get_global_mouse_position() - global_position
			Global.is_dragging_trash=true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			Global.is_dragging_trash=false
			var tween = get_tree().create_tween()
			if is_in_bin:
				tween.tween_property(self, "position", bin_ref.position, 0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "global_position", initialPos,0.2).set_ease(Tween.EASE_OUT)

func _on_area_2d_mouse_entered():
	if not Global.is_dragging_trash:
		draggable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited():
	if not Global.is_dragging_trash:
		draggable = false
		scale = Vector2(1, 1)

func _on_area_2d_body_entered(body:StaticBody2D):
	if body.is_in_group("droppable"):
		is_in_bin = true
		body.modulate = Color(Color.REBECCA_PURPLE, 1)
		bin_ref = body

func _on_area_2d_body_exited(body):
	if body.is_in_group("droppable"):
		is_in_bin = false
		body.modulate = Color(Color.MEDIUM_PURPLE, 1)
