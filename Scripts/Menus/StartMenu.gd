extends Control

#var menuItems = Array["$VBoxContainer/StartButton"; "$VBoxContainer/OptionsButton", "$VBoxContainer/ExitButton"]

func _ready():
	pass


func _on_start_button_pressed() -> void:
	# Replace with your scene transition logic
	print("Start Game pressed")
	get_tree().change_scene_to_file("res://Scenes/Menus/SelectCharacter.tscn")

func _on_options_button_pressed() -> void:
	# Open options menu logic
	print("Options pressed")
	get_tree().change_scene_to_file("res://Scenes/Menus/OptionsMenu.tscn")


func _on_exit_button_pressed() -> void:
	# Quit the game
	print("Exit pressed")
	get_tree().quit()


func _on_start_button_gui_input(event: InputEvent) -> void:
	pass
	if event.is_action_pressed("ui_down"):
		$VBoxContainer/Button2.grab_focus()
	elif event.is_action_pressed("ui_up"):
		$VBoxContainer/Button.grab_focus()
