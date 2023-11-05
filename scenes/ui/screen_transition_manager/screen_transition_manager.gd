extends Node

var screen_transition_scene: PackedScene = preload("res://scenes/ui/screen_transition/screen_transition.tscn")


func transition_to_scene(scene_path: String):
	var screen_transition: ScreenTransition = screen_transition_scene.instantiate() as ScreenTransition
	add_child(screen_transition)
	await screen_transition.screen_covered
	get_tree().change_scene_to_file(scene_path)


func transition_to_menu():
	transition_to_scene("res://scenes/ui/main_menu/main_menu.tscn")
