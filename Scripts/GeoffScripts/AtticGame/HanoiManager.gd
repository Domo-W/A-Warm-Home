extends Node

var num_disks = 5
var towers = [Array(range(num_disks, 0, -1)), [], []]
var is_solved = false

func _ready():
	print(str(towers))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if towers[2] == [5, 4, 3, 2, 1]:
		is_solved = true
	if not is_solved:
		pass
