extends StaticBody2D
@onready var hanoi_manager = $"../.."
var stack = []
# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(Color.YELLOW,0.2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.is_dragging_box:
		visible = true
	else:
		visible = false
	stack = hanoi_manager.towers[1]
