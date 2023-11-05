class_name CoinCounter

extends HBoxContainer

@onready var coin_label: Label = %CoinLabel


func _ready():
	GameEvent.update_coin_count_ui.connect(_on_update_coin_count_ui)


func _on_update_coin_count_ui(total_coins: int, collected_coins: int):
	update_coin_label(total_coins, collected_coins)


func update_coin_label(total_coins: int, collected_coins: int):
	coin_label.text = str(collected_coins, "/", total_coins)
