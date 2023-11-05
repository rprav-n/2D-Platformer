class_name PauseMenu

extends CanvasLayer

var option_menu_scene: PackedScene = preload("res://scenes/ui/option_menu/option_menu.tscn")
@onready var pause_menu_container: MarginContainer = $MarginContainer

func _ready():
	get_tree().paused = true


func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("pause"):
		unpause()
		get_viewport().set_input_as_handled()

func unpause():
	queue_free()
	get_tree().paused = false

func _on_resume_button_pressed():
	await get_tree().create_timer(0.3).timeout
	unpause()


func _on_options_button_pressed():
	pause_menu_container.visible = false
	var option_menu: OptionMenu = option_menu_scene.instantiate() as OptionMenu
	add_child(option_menu)
	option_menu.back_pressed.connect(_on_back_pressed)


func _on_quit_to_menu_button_pressed():
	ScreenTransitionManager.transition_to_menu()
	unpause()

func _on_back_pressed():
	pause_menu_container.visible = true
