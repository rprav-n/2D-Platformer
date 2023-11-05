class_name AnimatedButton

extends Button

@export var disable_hover_animation: bool = false

@onready var hover_animation_player: AnimationPlayer = $HoverAnimationPlayer
@onready var click_animation_player: AnimationPlayer = $ClickAnimationPlayer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _ready():
	if !disable_hover_animation:
		mouse_entered.connect(_on_mouse_entered)
		mouse_exited.connect(_on_mouse_exited)
	
	pressed.connect(_on_pressed)
	

func _on_mouse_entered():
	hover_animation_player.play("hover")


func _on_mouse_exited():
	hover_animation_player.play_backwards("hover")


func _on_pressed():
	click_animation_player.play("click")
	audio_stream_player.play()
