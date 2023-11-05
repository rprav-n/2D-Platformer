class_name OptionMenuStandalone

extends CanvasLayer

@onready var option_menu: OptionMenu = $OptionMenu

func _ready():
	option_menu.connect("back_pressed", _on_back_pressed)


func _on_back_pressed():
	ScreenTransitionManager.transition_to_menu()
