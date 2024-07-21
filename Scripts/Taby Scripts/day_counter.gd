extends Control
@onready var label = $DayCounter/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "Day: " + str(Global.day)
