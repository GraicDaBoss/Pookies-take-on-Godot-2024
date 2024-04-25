extends Sprite2D

func _process(delta):
	# Get the size of the viewport
	var viewport_size = get_viewport_rect().size
	
	# Set the position of the object to the center of the screen
	position = viewport_size / 2
