extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/Niveau_deux.tscn")
	pass # Replace with function body.


func _on_racine_winner_is_you() -> void:
	monitorable=true
	monitoring=true
	$Sprite2D.visible = true
	pass # Replace with function body.