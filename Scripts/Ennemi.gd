extends CharacterBody2D

var player: Node2D
var direction: Vector2 = Vector2(0, 0)
const SPEED = 300.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("../Joueur")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print_debug(player)
	direction = Vector2(player.position.x - position.x, player.position.y - position.y)
	# velocity = direction.normalized() * SPEED * direction
	velocity = direction.normalized() * SPEED * direction
	# velocity = player.position.direction_to(position)
	#print_debug(direction)
	
	move_and_slide()
