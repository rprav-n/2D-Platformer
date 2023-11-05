class_name  OptionMenu

extends CanvasLayer

signal back_pressed

@onready var window_mode_button: Button = %WindowModeButton

var full_screen: bool = false


func _ready():
	full_screen = false if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED else true
	update_diplay()


func update_diplay():
	window_mode_button.text = "WINDOWED" if !full_screen else "FULLSCREEN"
	

func _on_window_mode_button_pressed():
	full_screen = !full_screen
	if full_screen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	update_diplay()


func _on_back_button_pressed():
	queue_free()
	back_pressed.emit()
