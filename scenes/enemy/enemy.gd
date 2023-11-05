class_name Enemy

extends CharacterBody2D

@export var is_spawning: bool = true

@onready var animated_sprite_2d: AnimatedSprite2D = $Visuals/AnimatedSprite2D

const MAX_SPEED: int = 25
const GRAVITY: int = 600

var direction: Vector2 = Vector2.RIGHT

var enemy_death_scene: PackedScene = preload("res://scenes/enemy_death/enemy_death.tscn")

func _physics_process(delta: float):
	if is_spawning: return
	
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
	call_deferred("kill")


func kill():
	var enemy_death: Node2D = enemy_death_scene.instantiate() as Node2D
	get_parent().add_child(enemy_death)
	enemy_death.global_position = global_position
	if velocity.x > 0:
		enemy_death.scale.x = -1
	queue_free()
