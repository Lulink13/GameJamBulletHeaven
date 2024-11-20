extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_button_pressed() -> void:
	# Optional: Save any settings if needed
	save_settings()

	# Optional: Play a sound effect
	if $ClickSound:
		$ClickSound.play()
	# Change to the main menu scene
	get_tree().change_scene_to_file("res://Scenes/StartMenu.tscn")



# Optional helper function for saving settings
func save_settings() -> void:
	# Add your settings saving logic here
	pass


func _on_sound_check_button_toggled(toggled_on: bool) -> void:
	# Get the master bus index (0 is usually the master bus)
	var master_bus = AudioServer.get_bus_index("Master")

	# Toggle the audio - if it's currently muted, unmute it and vice versa
	var is_muted = AudioServer.is_bus_mute(master_bus)
	AudioServer.set_bus_mute(master_bus, !is_muted)
