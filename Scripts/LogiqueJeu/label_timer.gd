extends Label

var wave = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if wave :
		text = str(int($"../../Level_Timer".time_left))
	pass


func _on_level_timer_timeout() -> void:
	wave = false
	text = "Wave finished!"
	pass # Replace with function body.
