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
	await get_tree().create_timer(0.3).timeout
	unpause()


func _on_options_button_pressed():
	pass


func _on_quit_to_menu_button_pressed():
	ScreenTransitionManager.transition_to_menu()
	unpause()
