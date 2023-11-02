class_name Player

extends CharacterBody2D

const GRAVITY: int = 1100
const HORIZONTAL_SPEED: int = 120
const HORIZONTAL_ACCELERATION: int = 1400
const FRICTION: int = 1000
const JUMP_SPEED: int = 360
const JUMP_TERMINATION_MULTIPLIER: float = 2.5

func _ready():
	pass


func _physics_process(delta: float):
	
	var input_axis: float = Input.get_axis("move_left", "move_right")
	
	apply_gravity(delta)
	handle_movement(input_axis, delta)
	handle_jump()
	
	move_and_slide()


func handle_movement(input_axis: float, delta: float):
	if input_axis != 0:
		velocity.x = move_toward(velocity.x, input_axis * HORIZONTAL_SPEED, 
			HORIZONTAL_ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)


func handle_jump():
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = JUMP_SPEED * -1


func apply_gravity(delta: float):
	if velocity.y < 0 && !Input.is_action_pressed("jump"):
		velocity.y += GRAVITY * JUMP_TERMINATION_MULTIPLIER * delta
	else:
		velocity.y += GRAVITY * delta
