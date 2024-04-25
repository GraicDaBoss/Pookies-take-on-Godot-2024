extends Node2D
#grace / sarah

# Called when the node enters the scene tree for the first time.

func _on_button_pressed():
	$music.play() # Replace with function body.

#func _on_button2_pressed():
	#$whatever.play()



func _on_check_button_toggled(toggled_on):
	if toggled_on:
		$RainPlayer.play()
	else:
		$RainPlayer.stop()


func _on_check_button_2_toggled(toggled_on):
	if toggled_on:
		$BirdPlayer.play()
	else:
		$BirdPlayer.stop()


func _on_check_button_3_toggled(toggled_on):
	if toggled_on:
		$WindPlayer.play()
	else:
		$WindPlayer.stop()


func _on_button_4_pressed():
	$Strum1.play()


func _on_button_5_pressed():
	$Strum2.play()


func _on_button_6_pressed():
	$Strum3.play()


func _on_1button_pressed():
	$Flute.play()


func _on_2button_2_pressed():
	$Xylophone.play()


func _on_3button_3_pressed():
	$Shaker.play()


func _on_4button_4_pressed():
	$Chime.play()


func _on_5button_pressed():
	$Leaves.play()


func _on_6button_pressed():
	$Cat.play()


func _on_check_button_4_toggled(toggled_on):
	if toggled_on:
		$StepPlayer.play()
	else:
		$StepPlayer.stop()
