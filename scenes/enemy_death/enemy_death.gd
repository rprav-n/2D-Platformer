class_name EnemyDeath

extends Node2D

@onready var death_sound_player_1: RandomAudioStreamPlayer = $DeathSoundPlayer1
@onready var death_sound_player_2: RandomAudioStreamPlayer = $DeathSoundPlayer2

func _ready():
	death_sound_player_1.play()
	death_sound_player_2.play()
