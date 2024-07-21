extends Node2D


func _on_bedroom_to_hallway_body_entered(body):
	Global.can_move_to_hallway_from_bedroom = true
	Global.can_move_to_bedroom_from_hallway = false
	Global.can_move_to_bedroom_2_from_hallway = false
	Global.can_move_to_hallway_from_bedroom_2 = false
	Global.can_move_to_living_from_hallway = false
	Global.can_move_to_hallway_from_living = false
	Global.can_move_to_kitchen_from_living = false
	Global.can_move_to_living_from_kitchen = false
	Global.can_win = false

func _on_bedroom_to_hallway_body_exited(body):
	Global.can_move_to_hallway_from_bedroom = false
	Global.can_move_to_bedroom_from_hallway = false
	Global.can_move_to_bedroom_2_from_hallway = false
	Global.can_move_to_hallway_from_bedroom_2 = false
	Global.can_move_to_living_from_hallway = false
	Global.can_move_to_hallway_from_living = false
	Global.can_move_to_kitchen_from_living = false
	Global.can_move_to_living_from_kitchen = false
	Global.can_win = false

func _on_hallway_to_bedroom_body_entered(body):
	Global.can_move_to_hallway_from_bedroom = false
	Global.can_move_to_bedroom_from_hallway = true
	Global.can_move_to_bedroom_2_from_hallway = false
	Global.can_move_to_hallway_from_bedroom_2 = false
	Global.can_move_to_living_from_hallway = false
	Global.can_move_to_hallway_from_living = false
	Global.can_move_to_kitchen_from_living = false
	Global.can_move_to_living_from_kitchen = false
	Global.can_win = false

func _on_hallway_to_bedroom_body_exited(body):
	Global.can_move_to_hallway_from_bedroom = false
	Global.can_move_to_bedroom_from_hallway = false
	Global.can_move_to_bedroom_2_from_hallway = false
	Global.can_move_to_hallway_from_bedroom_2 = false
	Global.can_move_to_living_from_hallway = false
	Global.can_move_to_hallway_from_living = false
	Global.can_move_to_kitchen_from_living = false
	Global.can_move_to_living_from_kitchen = false
	Global.can_win = false

func _on_hallway_to_bedroom_2_body_entered(body):
	Global.can_move_to_hallway_from_bedroom = false
	Global.can_move_to_bedroom_from_hallway = false
	Global.can_move_to_bedroom_2_from_hallway = true
	Global.can_move_to_hallway_from_bedroom_2 = false
	Global.can_move_to_living_from_hallway = false
	Global.can_move_to_hallway_from_living = false
	Global.can_move_to_kitchen_from_living = false
	Global.can_move_to_living_from_kitchen = false
	Global.can_win = false

func _on_hallway_to_bedroom_2_body_exited(body):
	Global.can_move_to_hallway_from_bedroom = false
	Global.can_move_to_bedroom_from_hallway = false
	Global.can_move_to_bedroom_2_from_hallway = false
	Global.can_move_to_hallway_from_bedroom_2 = false
	Global.can_move_to_living_from_hallway = false
	Global.can_move_to_hallway_from_living = false
	Global.can_move_to_kitchen_from_living = false
	Global.can_move_to_living_from_kitchen = false
	Global.can_win = false

func _on_bedroom_2_to_hallway_body_entered(body):
	Global.can_move_to_hallway_from_bedroom = false
	Global.can_move_to_bedroom_from_hallway = false
	Global.can_move_to_bedroom_2_from_hallway = false
	Global.can_move_to_hallway_from_bedroom_2 = true
	Global.can_move_to_living_from_hallway = false
	Global.can_move_to_hallway_from_living = false
	Global.can_move_to_kitchen_from_living = false
	Global.can_move_to_living_from_kitchen = false
	Global.can_win = false

func _on_bedroom_2_to_hallway_body_exited(body):
	Global.can_move_to_hallway_from_bedroom = false
	Global.can_move_to_bedroom_from_hallway = false
	Global.can_move_to_bedroom_2_from_hallway = false
	Global.can_move_to_hallway_from_bedroom_2 = false
	Global.can_move_to_living_from_hallway = false
	Global.can_move_to_hallway_from_living = false
	Global.can_move_to_kitchen_from_living = false
	Global.can_move_to_living_from_kitchen = false
	Global.can_win = false

func _on_upstairs_to_downstairs_body_entered(body):
	Global.can_move_to_hallway_from_bedroom = false
	Global.can_move_to_bedroom_from_hallway = false
	Global.can_move_to_bedroom_2_from_hallway = false
	Global.can_move_to_hallway_from_bedroom_2 = false
	Global.can_move_to_living_from_hallway = true
	Global.can_move_to_hallway_from_living = false
	Global.can_move_to_kitchen_from_living = false
	Global.can_move_to_living_from_kitchen = false
	Global.can_win = false

func _on_upstairs_to_downstairs_body_exited(body):
	Global.can_move_to_hallway_from_bedroom = false
	Global.can_move_to_bedroom_from_hallway = false
	Global.can_move_to_bedroom_2_from_hallway = false
	Global.can_move_to_hallway_from_bedroom_2 = false
	Global.can_move_to_living_from_hallway = false
	Global.can_move_to_hallway_from_living = false
	Global.can_move_to_kitchen_from_living = false
	Global.can_move_to_living_from_kitchen = false
	Global.can_win = false

func _on_downstairs_to_upstairs_body_entered(body):
	Global.can_move_to_hallway_from_bedroom = false
	Global.can_move_to_bedroom_from_hallway = false
	Global.can_move_to_bedroom_2_from_hallway = false
	Global.can_move_to_hallway_from_bedroom_2 = false
	Global.can_move_to_living_from_hallway = false
	Global.can_move_to_hallway_from_living = true
	Global.can_move_to_kitchen_from_living = false
	Global.can_move_to_living_from_kitchen = false
	Global.can_win = false

func _on_downstairs_to_upstairs_body_exited(body):
	Global.can_move_to_hallway_from_bedroom = false
	Global.can_move_to_bedroom_from_hallway = false
	Global.can_move_to_bedroom_2_from_hallway = false
	Global.can_move_to_hallway_from_bedroom_2 = false
	Global.can_move_to_living_from_hallway = false
	Global.can_move_to_hallway_from_living = false
	Global.can_move_to_kitchen_from_living = false
	Global.can_move_to_living_from_kitchen = false
	Global.can_win = false

func _on_living_to_kitchen_body_entered(body):
	Global.can_move_to_hallway_from_bedroom = false
	Global.can_move_to_bedroom_from_hallway = false
	Global.can_move_to_bedroom_2_from_hallway = false
	Global.can_move_to_hallway_from_bedroom_2 = false
	Global.can_move_to_living_from_hallway = false
	Global.can_move_to_hallway_from_living = false
	Global.can_move_to_kitchen_from_living = true
	Global.can_move_to_living_from_kitchen = false
	Global.can_win = false

func _on_living_to_kitchen_body_exited(body):
	Global.can_move_to_hallway_from_bedroom = false
	Global.can_move_to_bedroom_from_hallway = false
	Global.can_move_to_bedroom_2_from_hallway = false
	Global.can_move_to_hallway_from_bedroom_2 = false
	Global.can_move_to_living_from_hallway = false
	Global.can_move_to_hallway_from_living = false
	Global.can_move_to_kitchen_from_living = false
	Global.can_move_to_living_from_kitchen = false
	Global.can_win = false

func _on_kitchen_to_living_body_entered(body):
	Global.can_move_to_hallway_from_bedroom = false
	Global.can_move_to_bedroom_from_hallway = false
	Global.can_move_to_bedroom_2_from_hallway = false
	Global.can_move_to_hallway_from_bedroom_2 = false
	Global.can_move_to_living_from_hallway = false
	Global.can_move_to_hallway_from_living = false
	Global.can_move_to_kitchen_from_living = false
	Global.can_move_to_living_from_kitchen = true
	Global.can_win = false

func _on_kitchen_to_living_body_exited(body):
	Global.can_move_to_hallway_from_bedroom = false
	Global.can_move_to_bedroom_from_hallway = false
	Global.can_move_to_bedroom_2_from_hallway = false
	Global.can_move_to_hallway_from_bedroom_2 = false
	Global.can_move_to_living_from_hallway = false
	Global.can_move_to_hallway_from_living = false
	Global.can_move_to_kitchen_from_living = false
	Global.can_move_to_living_from_kitchen = false
	Global.can_win = false


func _on_attic_body_entered(body):
	Global.can_win = true


func _on_attic_body_exited(body):
	Global.can_win = false
