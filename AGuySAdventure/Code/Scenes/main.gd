extends Node

@onready var player_vars = get_node("/root/PlayerVariables")

@onready var player_global_position = $Player.global_transform.origin

@onready var camera_global_position = $Cameraholder.global_transform.origin

@export var camera_move_input: int

func _physics_process(_delta):
	pass

func update_camera_intention(player_pos, camera_pos):
	
	var player_direction = player_vars.update_player_direction()
	
	if player_direction.x == 1:
		pass
	
	if player_direction.x == -1:
		pass
	
	pass
