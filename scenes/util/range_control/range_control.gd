class_name RangeControl

extends HBoxContainer

signal percent_changed

@onready var subtract_button: Button = $SubtractButton
@onready var plus_button: Button = $PlusButton
@onready var volume_label: Label = $VolumeLabel

var current_percentage: float = 1.0
var change_value: float = 0.1


func _ready():
	subtract_button.pivot_offset = Vector2(12, 10)
	plus_button.pivot_offset = Vector2(12, 10)


func set_current_percentage(percent: float):
	current_percentage = clamp(percent, 0, 1)
	var label_number: int = round(current_percentage * 10)
	volume_label.text = str(label_number)
	percent_changed.emit(current_percentage)

func _on_subtract_button_pressed():
	update_percentage(-change_value)


func _on_plus_button_pressed():
	update_percentage(change_value)


func update_percentage(change: float):
	set_current_percentage(current_percentage + change)
	
