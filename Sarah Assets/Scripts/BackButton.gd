extends Control

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://title_screen.tscn")


func _on_toggled(toggled_on):
	$Control/RainCheck/VboxContents/RainPlayer.play()
