extends Sprite2D

var dragging = false
var drag_offset = Vector2()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Check if the mouse click is inside the object's bounding box
				if get_rect().has_point(event.position):
					dragging = true
					# Calculate the offset from the mouse click to the object's position
					drag_offset = event.position - position
					# Bring the dragged object to the front
					bring_to_front()
			elif event.release:
				dragging = false

	if dragging and event is InputEventMouseMotion:
		# Update the position of the object while dragging
		position = event.position - drag_offset

func bring_to_front():
	# Bring the node to the front by changing its Z index
	pass
