extends OptionButton


func _ready():
	# Connect the item_selected signal of the OptionButton to the _on_item_selected method
	var audio_player = get_node("music")
	var pitch_scale: float

func _on_item_selected(index):
	var audio_player = get_node("music")
	match index:
		0: # If the first item is selected
			audio_player.pitch_scale = 1.0 # Set the pitch scale to default
		1: # If the second item is selected
			audio_player.pitch_scale = 1.5 # Set the pitch scale to 1.5 times faster
		2: # If the third item is selected
			audio_player.pitch_scale = 0.5 # Set the pitch scale to half speed
		# Add more cases as needed for each option in your OptionButton
