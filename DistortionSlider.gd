extends Node
#grace and sarah

var distortion : AudioEffectDistortion

func _ready():
	distortion = preload("res://default_bus_layout.tres::AudioEffectDistortion_ebiay")

func _on_toggled(toggled_on):
	
	var bus_index = AudioServer.get_bus_index("Master")

	
	var distortion_effect = AudioServer.get_bus_effect(bus_index, 1) 

	if distortion_effect:
<<<<<<< Updated upstream
		# Free the existing distortion effect instance
		#distortion_effect.free()
=======
>>>>>>> Stashed changes
		


		if toggled_on:
			distortion.mode = AudioEffectDistortion.MODE_OVERDRIVE
			distortion.pre_gain = 25.0
		else:
			distortion.mode = AudioEffectDistortion.MODE_CLIP
			distortion.pre_gain = 0.0


		# Add the updated distortion effect to the master bus
		AudioServer.add_bus_effect(bus_index, distortion)
	else:
		print("Distortion effect not found on the master bus.")
