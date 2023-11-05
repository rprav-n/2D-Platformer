class_name PauseMenu

extends CanvasLayer


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
	unpause()


func _on_options_button_pressed():
	pass


func _on_quit_to_menu_button_pressed():
	unpause()
	ScreenTransitionManager.transition_to_scene("res://scenes/ui/main_menu/main_menu.tscn")
