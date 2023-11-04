class_name LevelCompleteUI

extends CanvasLayer


func _on_button_pressed():
	LevelManager.increment_level()
