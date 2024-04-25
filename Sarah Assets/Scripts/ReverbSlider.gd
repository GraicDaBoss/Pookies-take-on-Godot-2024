extends HSlider
#Sarah Code !! :)
@export 

var bus_name: String

var bus_index: int
var reverb: AudioEffectReverb

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	
	if bus_index >= 0:
		reverb = AudioEffectReverb.new()
		
		if reverb != null:
			# Add the pitch shift effect to the specified audio bus
			AudioServer.add_bus_effect(bus_index, reverb)
			value = 20
			value_changed.connect(_on_value_changed)
		else:
			print("No AudioEffectReverb added")


func _on_value_changed(value):
	if reverb != null:
		reverb.room_size = value
	else:
		print("Reverb effect not working")

