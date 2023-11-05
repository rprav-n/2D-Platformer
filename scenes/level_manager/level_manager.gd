extends Node

@export var level_scenes: Array[PackedScene]

var current_level_index: int = 0


func change_level(level_index: int):
	current_level_index = level_index
	if current_level_index >= level_scenes.size():
		current_level_index = 0
	ScreenTransitionManager.transition_to_scene(level_scenes[current_level_index].resource_path)


func increment_level():
	change_level(current_level_index + 1)
