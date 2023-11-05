class_name TutorialSign

extends Node2D

@export_multiline var text: String

@onready var tutorial_text: Label = %TutorialText
@onready var panel_container: PanelContainer = $PanelContainer
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready():
	tutorial_text.text = text
	panel_container.visible = false


func _on_area_2d_area_entered(_area: Area2D):
	panel_container.visible = true
	sprite_2d.frame = 1


func _on_area_2d_area_exited(_area: Area2D):
	panel_container.visible = false
	sprite_2d.frame = 0
