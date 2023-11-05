class_name  OptionMenu

extends CanvasLayer

signal back_pressed

@onready var window_mode_button: AnimatedButton = %WindowModeButton
@onready var music_range_control: RangeControl = %MusicRangeControl
@onready var sfx_range_control: RangeControl = %SFXRangeControl

var full_screen: bool = false


func _ready():
	full_screen = false if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED else true
	music_range_control.percent_changed.connect(_on_music_volume_changed)
	sfx_range_control.percent_changed.connect(_on_sfx_volume_changed)
	update_diplay()
	update_initial_volume_settings()


func update_diplay():
	window_mode_button.text = "WINDOWED" if !full_screen else "FULLSCREEN"
	
	
func update_bus_volume(bus_name: String, vol_percent: float):
	var bus_idx: int = AudioServer.get_bus_index(bus_name)
	var volume_db: float = linear_to_db(vol_percent)
	AudioServer.set_bus_volume_db(bus_idx, volume_db)


func get_bus_volume_percent(bus_name: String) -> float:
	var bus_idx: int = AudioServer.get_bus_index(bus_name)
	var volume_percent: float = db_to_linear(AudioServer.get_bus_volume_db(bus_idx))
	return volume_percent


func update_initial_volume_settings():
	var music_percent: float = get_bus_volume_percent("Music")
	music_range_control.set_current_percentage(music_percent)
	
	var sfx_percent: float = get_bus_volume_percent("SFX")
	sfx_range_control.set_current_percentage(sfx_percent)


func _on_window_mode_button_pressed():
	full_screen = !full_screen
	if full_screen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	update_diplay()


func _on_back_button_pressed():
	await get_tree().create_timer(0.3).timeout
	back_pressed.emit()
	queue_free()


func _on_music_volume_changed(percent: float):
	update_bus_volume("Music", percent)


func _on_sfx_volume_changed(percent: float):
	update_bus_volume("SFX", percent)

