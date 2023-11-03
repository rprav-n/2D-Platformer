class_name GameCamera

extends Camera2D

const CAMERA_SPEED: int = 300


func _ready():
	GameEvent.player_position.connect(_on_player_position)


func _on_player_position(player_position: Vector2):
	global_position = lerp(player_position, global_position, 
		pow(2, -15 * get_physics_process_delta_time()))
#	global_position = lerp(global_position, player_position, 15 * get_process_delta_time())
