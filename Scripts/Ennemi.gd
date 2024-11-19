extends CharacterBody2D
class_name Ennemi

var player: Node2D
var enemiesNode: Node
#var direction: Vector2 = Vector2(0, 0)
@export var speed : int = 10000
@export var contactDamage : int = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("/root/Racine/Joueur")
	enemiesNode = get_node("/root/Enemies")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.alive :#and not player.invuln :
		velocity = (player.position - global_position).normalized() * speed * delta
		if velocity.x > 0 : $AnimatedSprite2D.play("RunR")
		elif velocity.x <0 : $AnimatedSprite2D.play("RunL")
	else :
		velocity = Vector2(0,0)
	
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() is Joueur:
			collision.get_collider().damage(contactDamage)

#func get_contact_damage():
	#return contactDamage
