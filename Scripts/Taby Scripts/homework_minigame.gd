extends Control

var letters = ['A', 'B', 'C', 'D']
var sequence = []
var pressed = []
var rng = RandomNumberGenerator.new()
var current_length = 1
var started = false
var over = false
@onready var correct = $Correct
@onready var incorrect = $Incorrect
@onready var task_music = $TaskMusic

@onready var sequence_label = $SequenceLabel
@onready var button_a = $ButtonContainer/ButtonA
@onready var button_b = $ButtonContainer/ButtonB
@onready var button_c = $ButtonContainer/ButtonC
@onready var button_d = $ButtonContainer/ButtonD
@onready var exit_button = $ExitButton

# Called when the node enters the scene tree for the first time.
func _ready():
	HappyEnvironment.playing = false
	exit_button.visible = false
	create_new_sequence(current_length)
	update_sequence_label()

func create_new_sequence(length):
	pressed = []
	sequence = []
	for i in range(length):
		sequence.append(letters[rng.randi_range(0, 3)])

func update_sequence_label():
	var label_text = ""
	for letter in sequence:
		label_text += letter + " → "
	sequence_label.text = label_text.rstrip(" → ")
	sequence_label.visible = true

func check_fail():
	for i in range(len(pressed)):
		if pressed[i] != sequence[i]:
			return true
	return false

func next_level():
	print("yippee")
	current_length += 1
	create_new_sequence(current_length)
	update_sequence_label()

func game_over():
	print("dead")
	sequence_label.text = "You failed.\nFinal Grade: F"
	sequence_label.visible = true
	exit_button.visible = true
	Global.has_done_task = true
	over = true

func sequence_input(l):
	sequence_label.visible = false
	pressed.append(l)
	if sequence == pressed:
		next_level()
	elif check_fail():
		game_over()
	if over == true:
		incorrect.play()
	else:
		correct.play()

func _on_button_a_pressed():
	sequence_input("A")

func _on_button_b_pressed():
	sequence_input("B")

func _on_button_c_pressed():
	sequence_input("C")

func _on_button_d_pressed():
	sequence_input("D")

func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://PrototypeLevels/kitchen.tscn")
