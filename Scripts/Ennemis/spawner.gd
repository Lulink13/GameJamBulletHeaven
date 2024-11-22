extends Sprite2D
class_name Spawner

@export var spawnable: PackedScene
@export var spawnCooldown: float = 1.5
@export var max_spawn = 20
var enabled = true

func _ready() -> void:
	$Timer.wait_time = spawnCooldown

func finwave():
	enabled=false

func disable():
	enabled=false

func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	if len(get_children()) <= max_spawn and enabled:
		add_child(spawnable.instantiate())
