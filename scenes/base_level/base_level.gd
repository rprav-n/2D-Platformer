class_name BaseLevel

extends Node


@export var level_comlpete_scene: PackedScene

var player_scene: PackedScene = preload("res://scenes/player/player.tscn")
var spawn_position: Vector2 = Vector2.ZERO

@onready var player: Player = $Player

var current_player: Player = null

var total_coins: int = 0
var collected_coins: int = 0

func _ready():
	RenderingServer.set_default_clear_color(Color.LIGHT_BLUE)
	spawn_position = player.global_position
	register_player(player)
	
	total_coins = get_tree().get_nodes_in_group("coin").size()
	
	GameEvent.update_coin_count_ui.emit(total_coins, collected_coins)
	GameEvent.player_coin_collect.connect(_on_player_coin_collect)


func register_player(player_node: Player):
	current_player = player_node
	current_player.died.connect(_on_player_died, CONNECT_DEFERRED)


func create_player():
	var player_instance: Player = player_scene.instantiate() as Player
	add_child(player_instance)
	player_instance.global_position = spawn_position
	register_player(player_instance)


func _on_player_coin_collect():
	collected_coins += 1
	GameEvent.update_coin_count_ui.emit(total_coins, collected_coins)


func _on_player_died():
	current_player.queue_free()
	create_player()


func _on_flag_player_won():
	current_player.queue_free()
	var level_complete: LevelCompleteUI = level_comlpete_scene.instantiate() as LevelCompleteUI
	add_child(level_complete)
