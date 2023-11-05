class_name AnimatedButton

extends Button

@onready var hover_animation_player: AnimationPlayer = $HoverAnimationPlayer
@onready var click_animation_player: AnimationPlayer = $ClickAnimationPlayer


func _on_mouse_entered():
	hover_animation_player.play("hover")


func _on_mouse_exited():
	hover_animation_player.play_backwards("hover")


func _on_pressed():
	click_animation_player.play("click")
