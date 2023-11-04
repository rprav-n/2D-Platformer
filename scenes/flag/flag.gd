class_name Flag

extends Node2D

signal player_won

func _on_area_2d_area_entered(_area: Area2D):
	player_won.emit()
