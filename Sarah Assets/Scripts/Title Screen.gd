extends Control

var buttons = {
	"SarahButton": "res://Sarah Assets/tinkering.tscn",
	"GraceButton": "res://Gracetitlescreen.tscn",
	"IzzyButton": "res://izzyscene.tscn",
	"DanniButton": "res://DannisScene.tscn",
	"EmilyButton": "res://emuhleetrying.tscn"
}

func _on_button_pressed(button_name: String) -> void:
	if buttons.has(button_name):
		get_tree().change_scene_to_file(buttons[button_name])
	else:
		print("Scene for button ", button_name, " not found!")

func _on_quit_button_pressed():
	get_tree().quit()
