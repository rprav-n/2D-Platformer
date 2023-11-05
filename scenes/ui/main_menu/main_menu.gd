class_name MainMenu

extends CanvasLayer

@onready var play_button: Button = %PlayButton
@onready var option_button: Button = %OptionButton
@onready var quit_button: Button = %QuitButton

@export var background_color: Color

func _ready():
	RenderingServer.set_default_clear_color(background_color)
	play_button.pressed.connect(_on_play_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)
	option_button.pressed.connect(_on_option_button_pressed)


func _on_play_button_pressed():
	LevelManager.change_level(0)
	

func _on_option_button_pressed():
	ScreenTransitionManager.transition_to_scene("res://scenes/ui/option_menu_standalone/option_menu_standalone.tscn")

	
func _on_quit_button_pressed():
	await get_tree().create_timer(0.3).timeout
	get_tree().quit()
