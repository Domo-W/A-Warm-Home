extends Area2D

@onready var mom = $".."

func _on_body_entered(body):
	if "player" in body.name:
		print("player is in")
		var tween = get_tree().create_tween()
		tween.tween_property(mom, "self_modulate:a", 0, 5)
		tween.tween_callback(mom.queue_free)
