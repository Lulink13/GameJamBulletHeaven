extends Sprite2D
class_name Spawner

@export var spawnable: PackedScene
@export var spawnCooldown: float = 1.5
<<<<<<< Updated upstream
@export var max_spawn = 20
var enabled = true
=======
>>>>>>> Stashed changes

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	$Timer.start(spawnCooldown)
<<<<<<< Updated upstream
	if len(get_children()) <= max_spawn and enabled:
		add_child(spawnable.instantiate())
=======
	add_child(spawnable.instantiate())
>>>>>>> Stashed changes
	pass # Replace with function body.

func update(ennemi, spawnCooldown) :
	if ennemi :
		spawnable = ennemi
	else :
		$Timer.stop()
	%Timer. spawnCooldown
<<<<<<< Updated upstream


func _on_joueur_died() -> void:
	enabled = false
	pass # Replace with function body.


func _on_level_timer_timeout() -> void:
	enabled=false
	pass # Replace with function body.
=======
>>>>>>> Stashed changes
