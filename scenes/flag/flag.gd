class_name Flag

extends Node2D

signal player_won

@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D

func _on_area_2d_area_entered(_area: Area2D):
	gpu_particles_2d.emitting = true
	player_won.emit()
