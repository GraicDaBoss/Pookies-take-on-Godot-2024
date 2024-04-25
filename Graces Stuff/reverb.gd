extends CheckButton
#grace!!

var delay : AudioEffectDelay

func _ready():
	delay = preload("res://default_bus_layout.tres::AudioEffectDelay_r7t2f")

func _on_toggled(toggled_on):
	
	var bus_index = AudioServer.get_bus_index("Master")

	
	var delay_effect = AudioServer.get_bus_effect(bus_index, 1) 

	if delay_effect:

		if toggled_on:
			#panner.mode = AudioEffectDistortion.MODE_OVERDRIVE
			delay.tap1_active = true
		else:
			#distortion.mode = AudioEffectDistortion.MODE_CLIP
			delay.tap1_active = false


		
		AudioServer.add_bus_effect(bus_index, delay)
	else:
		print("Distortion effect not found on the master bus.")
