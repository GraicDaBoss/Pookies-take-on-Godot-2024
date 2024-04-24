extends Node
#grace

var distortion : AudioEffectDistortion

func _ready():
	distortion = preload("res://default_bus_layout.tres::AudioEffectDistortion_ebiay")

func _on_toggled(toggled_on):
	# Get the index of the master bus
	var bus_index = AudioServer.get_bus_index("Master")

	# Get the distortion effect on the master bus
	var distortion_effect = AudioServer.get_bus_effect(bus_index, 1) # Assuming the distortion effect is the first effect on the master bus

	if distortion_effect:
		# Free the existing distortion effect instance
		distortion_effect.free()
		
		# If the CheckBox is checked, add the distortion effect with mode set to MODE_OVERDRIVE
		if toggled_on:
			distortion.mode = AudioEffectDistortion.MODE_OVERDRIVE
		else:
			distortion.mode = AudioEffectDistortion.MODE_CLIP

		# Add the updated distortion effect to the master bus
		AudioServer.add_bus_effect(bus_index, distortion)
	else:
		print("Distortion effect not found on the master bus.")


