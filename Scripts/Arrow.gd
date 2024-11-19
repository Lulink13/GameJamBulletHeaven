extends Area2D

# Arrow properties
var arrow_speed = 400     # Adjust as needed
var arrow_damage = 1      # Adjust as needed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		collided_entity: Object = collision.get_collider()
		if collided_entity is Ennemi:
			print("ennemi touché!!!")
			collided_entity.hp -= arrow_damage
			$Sprite2D.queue_free()
			$CollisionShape2D.queue_free()
			
