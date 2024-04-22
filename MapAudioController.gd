extends Node2D
#Sarah Code !

var audio_player: AudioStreamPlayer = null
var max_speed: float = 2.0

func _ready():
	# Find and store a reference to the audio player node
	audio_player = get_node("path_to_your_audio_player_node")
	# Connect the signal from the draggable sprite to the _on_position_changed function
	get_parent().connect("position_changed", self, "_on_position_changed")

func _on_position_changed(new_position: Vector2):
	# Calculate the speed based on the position of the draggable sprite
	var speed = new_position.x / get_viewport_rect().size.x * max_speed
	# Adjust the playback speed of the audio player based on the calculated speed
	audio_player.playback_speed = speed
