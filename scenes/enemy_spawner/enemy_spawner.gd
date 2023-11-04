class_name EnemySpawner

extends Marker2D

enum Direction {RIGHT, LEFT}

@export var enemy_scene: PackedScene
@export var start_direction: Direction

var current_enemy: Enemy = null
var spawn_on_next_tick: bool = false


func _ready():
	call_deferred("spawn_enemy")


func spawn_enemy():
	current_enemy = enemy_scene.instantiate() as Enemy
	current_enemy.direction = Vector2.RIGHT if start_direction == Direction.RIGHT else Vector2.LEFT
	get_parent().add_child(current_enemy)
	current_enemy.global_position = global_position


func check_enemy_spawn():
	if !is_instance_valid(current_enemy):
		if spawn_on_next_tick:
			spawn_enemy()
			spawn_on_next_tick = false
		else:
			spawn_on_next_tick = true


func _on_spawn_timer_timeout():
	check_enemy_spawn()
