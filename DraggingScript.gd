extends Area2D
#Sarah code

var previous_mouse_position = Vector2()
var is_dragging = false

func _ready():
	var viewport_size = get_viewport_rect().size
	
	# Set the position of the object to the center of the screen
	position = viewport_size / 2

func _on_Draggable_input_event(viewport, event, shape_idx):
	
	"""
	Allows dragging if the user clicks inside
	the collision shape
	"""
	
	if event.is_action_pressed("ui_touch"):
		print(event)
		previous_mouse_position = event.position
		is_dragging = true

func _input(event):
	
	"""
	Works globally so dragging works if
	mouse cursor is outside of Collision Shape
	Disables dragging if the user releases click
	"""
	
	if not is_dragging:
		return
	
	if event is InputEventMouseButton and event.is_pressed():
		return  # Ignore mouse presses outside the draggable area
	
	if event.is_action_released("ui_touch"):
		previous_mouse_position = Vector2()
		is_dragging = false
	
	
	if is_dragging and event is InputEventMouseMotion:
		position += event.position - previous_mouse_position
		previous_mouse_position = event.position
		emit_signal("position_changed", position)

func _process(delta):
	"""x axis"""
	
	#find x position
	#
	
	"""y axis"""
