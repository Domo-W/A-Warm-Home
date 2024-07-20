extends ColorRect

@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "Day: " + str(Global.day)
