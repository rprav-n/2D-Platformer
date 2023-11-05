class_name Flag

extends Node2D

signal player_won

@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var random_audio_stream_player: RandomAudioStreamPlayer = $RandomAudioStreamPlayer

func _on_area_2d_area_entered(_area: Area2D):
	audio_stream_player.play()
	random_audio_stream_player.play()
	gpu_particles_2d.emitting = true
	player_won.emit()
