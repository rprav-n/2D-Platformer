extends Node

var screen_transition_scene: PackedScene = preload("res://scenes/ui/screen_transition/screen_transition.tscn")


func transition_to_scene(scene_path: String):
	disable_buttons()
	await get_tree().create_timer(0.3).timeout
	var screen_transition: ScreenTransition = screen_transition_scene.instantiate() as ScreenTransition
	add_child(screen_transition)
	await screen_transition.screen_covered
	get_tree().change_scene_to_file(scene_path)


func disable_buttons():
	for button in get_tree().get_nodes_in_group("animated_button") as Array[AnimatedButton]:
		button.disabled = true
	

func transition_to_menu():
	transition_to_scene("res://scenes/ui/main_menu/main_menu.tscn")
