extends Control

func _ready() -> void:
	pass

func _on_restart_button_pressed() -> void:
	# Remove this overlay scene first
	queue_free()
	# Then change to the new scene
	get_tree().change_scene_to_file("res://Scenes/Niveaux/Niveau_UN.tscn")

func _on_quit_button_pressed() -> void:
	print("Exit pressed")
	get_tree().quit()


func _on_joueur_died() -> void:
	visible = true
	
