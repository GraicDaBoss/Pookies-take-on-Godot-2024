extends Node

# Reference to the CheckBox node
var distortionModeCheckBox : CheckBox

func _ready():
	# Find and store a reference to the CheckBox node
	distortionModeCheckBox = $CheckButton

	# Connect the CheckBox's toggled signal to the _on_distortion_mode_toggled method
	#distortionModeCheckBox.connect("toggled", self, "_on_distortion_mode_toggled")

# Function to handle CheckBox toggled signal
func _on_toggled(toggled_on):
	# Set the distortion mode on the master bus
	var distortion_effect = AudioServer.get_bus_effect(AudioServer.get_bus_index("master"), 0) # Assuming the distortion effect is the first effect on the master bus

	if distortion_effect:
		var distortion_effect_instance = distortion_effect.instance()
		
		if toggled_on:
			distortion_effect_instance.mode = AudioEffectDistortion.MODE_OVERDRIVE
		else:
			distortion_effect_instance.mode = AudioEffectDistortion.MODE_CLIP
		
		
	else:
		print("Distortion effect not found on the master bus.")


