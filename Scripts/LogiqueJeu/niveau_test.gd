extends Node2D

signal winnerIsYou
var finwave = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if len($Spawner.get_children()) == 1 and len($Enemies.get_children()) == 0 and finwave:
		winnerIsYou.emit()
	pass


func _on_level_timer_timeout() -> void:
	finwave = true
	pass # Replace with function body.
