extends Area2D

# Arrow properties
#var speed = 700     # Adjust as needed
var damage :int
var direction : Vector2
var piercing:int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var velocity = speed * delta * direction
	#position += velocity
	pass

func _on_body_entered(body: Node2D) -> void:
	#print(body)
	
	if body is Ennemi:
		#print("ennemi touché!!!")
		body.damage(damage)
		#piercing -= 1
		#if piercing < 0:
			#$".".queue_free()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	#print(scale)
	$".".queue_free()
	pass # Replace with function body.
