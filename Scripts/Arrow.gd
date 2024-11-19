extends Sprite2D
class_name Projectile

# Arrow properties
var arrow_speed = 200     # Adjust as needed
var arrow_damage = 1      # Adjust as needed
var direction : Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = arrow_speed * delta * direction
	position += velocity


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Ennemi:
		print("ennemi touché!!!")
		#collided_entity.hp -= arrow_damage
		$".".queue_free()
	pass # Replace with function body.
