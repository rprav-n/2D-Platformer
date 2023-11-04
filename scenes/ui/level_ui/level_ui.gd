class_name LevelUI

extends CanvasLayer

@onready var coin_label: Label = %CoinLabel

func _ready():
	GameEvent.update_coin_count_ui.connect(_on_update_coin_count_ui)
	

func _on_update_coin_count_ui(total_coins: int, collected_coins: int):
	coin_label.text = str(collected_coins, "/", total_coins)
