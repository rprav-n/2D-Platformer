class_name Coin

extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
@onready var random_audio_stream_player: RandomAudioStreamPlayer = $RandomAudioStreamPlayer
@onready var random_audio_stream_player_2: RandomAudioStreamPlayer = $RandomAudioStreamPlayer2


func _on_area_2d_area_entered(_area: Area2D):
	animation_player.play("pickup")
	call_deferred("disable_pickup")
	
	GameEvent.player_coin_collect.emit()
	random_audio_stream_player.play()
	random_audio_stream_player_2.play()
	
	
func disable_pickup():
	collision_shape_2d.disabled = true
