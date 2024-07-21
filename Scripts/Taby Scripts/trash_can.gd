extends AnimatedSprite2D

func _ready():
	if Global.day == 4:
		visible = true
	else:
		visible = false
func empty():
	animation = "empty"
