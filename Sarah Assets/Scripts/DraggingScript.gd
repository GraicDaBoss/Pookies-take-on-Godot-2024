extends Area2D
#Sarah code

#drag code
var previous_mouse_position = Vector2()
var is_dragging = false
var min_x = 651
var max_x = 1273
var min_y = 333
var max_y = 724

#audio code
@export var bus_name: String
var bus_index: int
var valueY: float
var valueX: float
signal value_changed(value: float)
var pitch_shift: AudioEffectPitchShift
var distortion : AudioEffectDistortion
var minPitch = 0.5
var maxPitch = 2.0

func _ready() -> void:
	#Drag
	var viewport_size = get_viewport_rect().size
	position = viewport_size / 2
	
	#Audio	
	bus_index = AudioServer.get_bus_index(bus_name)
	
	if bus_index >= 0:
		pitch_shift = AudioEffectPitchShift.new()
		distortion = AudioEffectDistortion.new()
		
		if pitch_shift != null:
			# Add the pitch shift effect to the specified audio bus
			AudioServer.add_bus_effect(bus_index, pitch_shift)
			AudioServer.add_bus_effect(bus_index, distortion)
			valueY = 1.0
			valueX = 1.0  
			value_changed.connect(_on_y_value_changed)
			value_changed.connect(_on_x_value_changed)
		else:
			print("No AudioEffectPitchShift added")

func _on_Draggable_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("ui_touch"):
		print(event)
		previous_mouse_position = event.position
		is_dragging = true

func _input(event):
	if not is_dragging:
		return
	if event is InputEventMouseButton and event.is_pressed():
		return  # Ignore mouse presses outside the draggable area
	if event.is_action_released("ui_touch"):
		previous_mouse_position = Vector2()
		is_dragging = false
	
	if is_dragging and event is InputEventMouseMotion:
		var new_position = position + event.position - previous_mouse_position
		
		# Check if the new position is within the specified boundaries
		if new_position.x >= min_x and new_position.x <= max_x and new_position.y >= min_y and new_position.y <= max_y:
			position = new_position
			previous_mouse_position = event.position
			emit_signal("position_changed", position)
			 # Calculate value for y-axis (pitch)
			var valueY = (global_position.y / 50) - 9.5
			print("Y Value: ", valueY)
			emit_signal("value_changed", valueY)
			
			# Calculate value for x-axis (pitch)
			var valueX = (global_position.x * 0.0482) - 45
			print("X value: ", valueX)
			emit_signal("value_changed", valueX)



func _on_y_value_changed(valueY):
	if pitch_shift != null:
		pitch_shift.pitch_scale = valueY
	else:
		print("Pitch shift effect not working")
		
func _on_x_value_changed(valueX):
	if distortion != null:
		distortion.pre_gain = valueX
	else:
		print("Distortion effect not working")
		
