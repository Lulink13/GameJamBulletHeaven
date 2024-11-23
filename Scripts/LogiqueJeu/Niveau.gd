extends Node2D
signal load_level
signal winnerIsYou
var finwave = false
var win = false

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func _on_level_timer_timeout() -> void:
	#print(finwave, get_tree().get_node_count_in_group("Ennemi"))
	if not finwave:
		finwave = true
		get_tree().call_group("Spawner", "finwave")
		$Level_Timer.wait_time = 0.5
		$Level_Timer.start(0.5)
	elif get_tree().get_node_count_in_group("Ennemi") == 0 and win == false:
		win = true
		winnerIsYou.emit()
		#print("WINNER!!!")


func _on_portal_next_level(id) -> void:
	load_level.emit(id)
	pass # Replace with function body.
