extends CharacterBody3D

@onready var player_vars = get_node("/root/PlayerVariables")

@onready var floor_checker = get_node("FloorChecker")

@export var player_speed: int

@export var player_jump_speed: int

@export var player_gravity: int

var player_direction: Vector3 = Vector3.ZERO

func _physics_process(_delta):
	
	var player_is_jumping: bool = update_jump()
	
	player_direction = player_vars.update_player_direction()
	
	if player_is_jumping == true:
		velocity.y += player_jump_speed
	
	if player_is_jumping == false and not is_on_floor():
		velocity.y -= player_gravity
	
	velocity.x = player_direction.x * player_speed
	
	move_and_slide()

func update_jump():
	
	var jumping: bool = false
	
	if is_on_floor() and Input.is_action_pressed("Jump") and floor_check() == false:
		jumping = true
	
	if floor_check() == true and not is_on_floor():
		jumping = false
	
	return jumping

func floor_check():
	
	var floor_in_the_way: bool = false
	
	if floor_checker.is_colliding():
		var collider = floor_checker.get_collider()

		while collider.is_in_group("Floors"):
			floor_in_the_way = true
			
			if floor_in_the_way == false:
				break
	
	if floor_checker.is_colliding():
		floor_in_the_way = false
	
	return floor_in_the_way
