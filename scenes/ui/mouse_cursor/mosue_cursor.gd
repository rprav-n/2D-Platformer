extends CanvasLayer

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN


func _process(_delta: float):
	sprite_2d.global_position = sprite_2d.get_global_mouse_position()
	if Input.is_action_just_pressed("click"):
		animation_player.play("click")
		
