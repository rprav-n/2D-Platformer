class_name RandomAudioStreamPlayer

extends Node

@export var number_to_play: int = 2
@export var enable_pitch_randomization: bool = true
@export var min_pitch_scale: float = 0.9
@export var max_pitch_scale: float = 1.1

var rng: RandomNumberGenerator = RandomNumberGenerator.new()


func _ready():
	rng.randomize()


func play():
	var valid_nodes: Array[AudioStreamPlayer] = []
	for stream_player in get_children() as Array[AudioStreamPlayer]:
		if !stream_player.playing:
			valid_nodes.append(stream_player)
	
	for i in number_to_play:
		if valid_nodes.size() == 0: return
		
		var idx: int = rng.randi_range(0, valid_nodes.size() - 1)
		if enable_pitch_randomization:
			valid_nodes[idx].pitch_scale = rng.randf_range(min_pitch_scale, max_pitch_scale)
		valid_nodes[idx].play()
		valid_nodes.remove_at(idx)
