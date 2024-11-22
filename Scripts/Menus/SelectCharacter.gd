extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_dark_elf_button_pressed() -> void:
	Globales.character = 0
	start_game()
	
func _on_fighter_button_pressed() -> void:
	Globales.character = 1
	start_game()

func _on_knight_button_pressed() -> void:
	Globales.character = 2
	start_game()
	
func start_game():
	get_tree().change_scene_to_file("res://Scenes/Niveaux/Jeu.tscn")
	

#func _on_elf_button_pressed() -> void:
	#get_tree().change_scene_to_file("res://Scenes/Niveau_test.tscn")

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/StartMenu.tscn")
