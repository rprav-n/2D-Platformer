class_name Enemy

extends CharacterBody2D


const MAX_SPEED: int = 25
const GRAVITY: int = 600

var direction: Vector2 = Vector2.RIGHT
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float):
	apply_gravity(delta)
	handle_movement()
	change_flip()
	move_and_slide()


func apply_gravity(delta: float):
	velocity.y += GRAVITY * delta


func handle_movement():
	velocity.x = MAX_SPEED * direction.x


func change_flip():
	animated_sprite_2d.flip_h = true if direction.x > 0 else false


func _on_goal_detector_area_entered(_area: Area2D):
	direction.x *= -1


func _on_hurtbox_area_area_entered(_area: Area2D):
	queue_free()
