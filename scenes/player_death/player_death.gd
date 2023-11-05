class_name PlayerDeath

extends CharacterBody2D

const FRICTION: int = 100
const GRAVITY: int = 900

@onready var visuals: Node2D = $Visuals
@onready var death_sound_player_1: RandomAudioStreamPlayer = $DeathSoundPlayer1
@onready var death_sound_player_2: RandomAudioStreamPlayer = $DeathSoundPlayer2
@onready var death_sound_player_3: RandomAudioStreamPlayer = $DeathSoundPlayer3


func _ready():
	death_sound_player_1.play()
	death_sound_player_2.play()
	death_sound_player_3.play()

	if velocity.x < 0:
		visuals.scale.x = -1


func _process(delta: float):
	velocity.y += GRAVITY * delta
	move_and_slide()
	
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	GameEvent.player_position.emit(global_position)
