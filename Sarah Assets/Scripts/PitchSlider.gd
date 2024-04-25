extends HSlider
#Sarah Code !! :)
@export 

var bus_name: String

var bus_index: int
var pitch_shift: AudioEffectPitchShift

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	
	if bus_index >= 0:
		pitch_shift = AudioEffectPitchShift.new()
		
		if pitch_shift != null:
			# Add the pitch shift effect to the specified audio bus
			AudioServer.add_bus_effect(bus_index, pitch_shift)
			value = 1.0
			value_changed.connect(_on_value_changed)
		else:
			print("No AudioEffectPitchShift added")


func _on_value_changed(value):
	if pitch_shift != null:
		pitch_shift.pitch_scale = value
	else:
		print("Pitch shift effect not working")

