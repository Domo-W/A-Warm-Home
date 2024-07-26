extends CanvasLayer
@onready var label = $Background/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "Day: " + str(Global.day)
