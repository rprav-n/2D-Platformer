class_name Player

extends CharacterBody2D

signal died

enum State { NORMAL, DASHING }

@export_flags_2d_physics var dash_hazard_mask

const GRAVITY: int = 1100
const HORIZONTAL_SPEED: int = 120
const HORIZONTAL_ACCELERATION: int = 1400
const FRICTION: int = 1000
const JUMP_SPEED: int = 360
const JUMP_TERMINATION_MULTIPLIER: float = 2.5
const DASH_SPEED: int = 350
const MIN_DASH_SPEED: int = 200

var can_double_jump: bool = false
var current_state: State = State.NORMAL
var is_new_state: bool = true

var default_hazard_mask: int = 0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var coyote_timer: Timer = $CoyoteTimer
@onready var dash_area_collision_shape_2d: CollisionShape2D = $DashArea/CollisionShape2D
@onready var hazard_area: Area2D = $HazardArea


func _ready():
	default_hazard_mask = hazard_area.collision_mask


func _physics_process(delta: float):
	match current_state:
		State.NORMAL:
			process_normal(delta)
		State.DASHING:
			process_dash(delta)
	
	is_new_state = false	
	
	GameEvent.player_position.emit(global_position)


func change_state(new_state: State):
	current_state = new_state
	is_new_state = true


func process_normal(delta: float):
	if is_new_state:
		hazard_area.collision_mask = default_hazard_mask
	var input_axis: float = Input.get_axis("move_left", "move_right")
	
	apply_gravity(delta)
	handle_movement(input_axis, delta)
	handle_jump()
	
	var was_on_floor: bool = is_on_floor()
	move_and_slide()
	
	if was_on_floor && !is_on_floor():
		coyote_timer.start()
	
	if is_on_floor():
		can_double_jump = true
	
	if Input.is_action_just_pressed("dash"):
		call_deferred("change_state", State.DASHING)
	
	update_animation(input_axis)


func process_dash(delta: float):
	if is_new_state:
		hazard_area.collision_mask = dash_hazard_mask
		dash_area_collision_shape_2d.disabled = false
		animated_sprite_2d.play("jump")
		var direction: int = get_direction()
		velocity = Vector2(DASH_SPEED * direction, 0)
	move_and_slide()
	velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
	
	if abs(velocity.x) <= MIN_DASH_SPEED:
		call_deferred("change_state", State.NORMAL)
		dash_area_collision_shape_2d.disabled = true


func handle_movement(input_axis: float, delta: float):
	if input_axis != 0:
		velocity.x = move_toward(velocity.x, input_axis * HORIZONTAL_SPEED, 
			HORIZONTAL_ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)


func handle_jump():
	if Input.is_action_just_pressed("jump") && (is_on_floor() || !coyote_timer.is_stopped() || can_double_jump):
		velocity.y = JUMP_SPEED * -1
		if !is_on_floor() && coyote_timer.is_stopped():
			can_double_jump = false
		coyote_timer.stop()


func apply_gravity(delta: float):
	if velocity.y < 0 && !Input.is_action_pressed("jump"):
		velocity.y += GRAVITY * JUMP_TERMINATION_MULTIPLIER * delta
	else:
		velocity.y += GRAVITY * delta


func update_animation(input_axis: float):
	if input_axis != 0:
		animated_sprite_2d.play("run")
		animated_sprite_2d.flip_h = input_axis > 0
	else:
		animated_sprite_2d.play("idle")
	
	if !is_on_floor():
		animated_sprite_2d.play("jump")


func get_direction() -> int:
	return 1 if animated_sprite_2d.flip_h else -1


func _on_hazard_area_area_entered(_area: Area2D):
	emit_signal("died")


