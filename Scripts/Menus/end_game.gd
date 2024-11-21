extends Control

# Add a variable for transparency level
var transparency_level: float = 0.7  # Adjust this value between 0 and 1

func _ready() -> void:
	# Set up the transparency for the entire end game scene
	self.modulate.a = transparency_level

	# Make sure the buttons remain fully visible
	if has_node("restart_button"):
		$restart_button.modulate.a = 1.0
	if has_node("quit_button"):
		$quit_button.modulate.a = 1.0

	# If you have a background panel or color rect, you can set its transparency separately
	if has_node("Background"):
		$Background.modulate.a = transparency_level

func _on_restart_button_pressed() -> void:
	# Remove this overlay scene first
	queue_free()
	# Then change to the new scene
	get_tree().change_scene_to_file("res://Scenes/Niveau_test.tscn")

func _on_quit_button_pressed() -> void:
	print("Exit pressed")
	get_tree().quit()
