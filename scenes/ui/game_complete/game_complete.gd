class_name GameComplete

extends CanvasLayer


func _on_continue_to_menu_button_pressed():
	ScreenTransitionManager.transition_to_menu()
