extends CharacterBody2D
class_name Ennemi

signal died

@export var spawnable: PackedScene

var player: Node2D
#var enemiesNode: Node
var itemNode: Node
#var direction: Vector2 = Vector2(0, 0)
var speed : int = 60
var contactDamage : int = 1
var hp = 1
var alive = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("/root/Racine/Joueur")
	#enemiesNode = get_node("/root/Racine/Enemies")
	itemNode = get_node("/root/Racine/Items")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if alive :
		if player.alive:#and not player.invuln :
			velocity = (player.position - global_position).normalized() * speed
			if velocity.x > 0 :
				$AnimatedSprite2D.scale.x = 1
			elif velocity.x <0 :
				$AnimatedSprite2D.scale.x = -1
		else :
			$AnimatedSprite2D.play("idle")
				
			velocity = Vector2(0,0)
	
		move_and_slide()
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			if collision.get_collider() is Joueur:
				collision.get_collider().damage(contactDamage)

func damage(ammount:int):
	hp -= ammount
	if hp <= 0 :
		alive = false
		died.emit() #TODO
		var coin:Objet = spawnable.instantiate()
		itemNode.add_child(coin)
		coin.position= self.global_position
		$Hurtbox.queue_free()
		$AnimatedSprite2D.play("death")

func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
	pass # Replace with function body.
