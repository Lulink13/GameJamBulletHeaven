extends CharacterBody2D
class_name Ennemi

@export var spawnable: PackedScene

var player: Node2D
var itemNode: Node
var speed : int = 60
var contactDamage : int = 1
var hp = 1
var alive = true

func _ready() -> void:
	player = get_tree().get_nodes_in_group("Joueur")[0]

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
		var coin:Objet = spawnable.instantiate()
		get_parent().add_child(coin)
		coin.position = position
		coin.random_move()
		$Hurtbox.queue_free()
		$AnimatedSprite2D.play("death")

func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
	pass # Replace with function body.
