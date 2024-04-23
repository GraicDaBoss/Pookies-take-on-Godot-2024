extends Button

var basePitch = 1.0

func _ready():
	pass

func _on_mouse_entered():
	var pitch = basePitch + (0.1 * get_position().x) # Adjust the factor to get desired pitch variation
	$Hitsound.pitch_scale = pitch
	$Hitsound.play()

