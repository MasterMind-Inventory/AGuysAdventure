extends Node

var player_direction: Vector3 = Vector3.ZERO

func update_player_direction():
	
	if not Input.is_action_pressed("Left") and not Input.is_action_pressed("Right"):
		player_direction.x = 0
	if Input.is_action_pressed("Left") and Input.is_action_pressed("Right"):
		player_direction.x = 0
	
	if Input.is_action_pressed("Left"):
		player_direction.x = -1
	if Input.is_action_pressed("Right"):
		player_direction.x = 1
	
	return player_direction
