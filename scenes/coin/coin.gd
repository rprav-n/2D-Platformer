class_name Coin

extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D


func _on_area_2d_area_entered(_area: Area2D):
	animation_player.play("pickup")
	call_deferred("disable_pickup")
	
	
func disable_pickup():
	collision_shape_2d.disabled = true
