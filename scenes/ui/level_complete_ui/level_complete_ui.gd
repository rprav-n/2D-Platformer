class_name LevelCompleteUI

extends CanvasLayer

@onready var coin_counter: CoinCounter = %CoinCounter

func _on_restart_button_pressed():
	get_parent().get_tree().reload_current_scene()


func _on_next_level_button_pressed():
	LevelManager.increment_level()
