extends PhysicsBody2D
class_name Ennemi

var player: Node2D
#var direction: Vector2 = Vector2(0, 0)
const SPEED = 140
var ContactDamage = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("../Joueur")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var spd : Vector2
	if player.alive :#and not player.invuln : 
		spd = (player.position - position).normalized() * SPEED * delta
	else : spd = Vector2(0,0)
	
	var collision = move_and_collide(spd)
	#if collision.get_collider() is Joueur :
		#print("joueur!!")

func get_contact_damage():
	return ContactDamage
