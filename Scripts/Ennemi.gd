extends CharacterBody2D
class_name Ennemi

var player: Node2D
var direction: Vector2 = Vector2(0, 0)
const SPEED = 3000.0
var ContactDamage = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("../Joueur")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = player.position - position 
	# velocity = direction.normalized() * SPEED * direction
	velocity = direction.normalized() * SPEED * delta
	# velocity = player.position.direction_to(position)
	print_debug(direction)
	
	move_and_slide()

func get_contact_damage():
	return ContactDamage
