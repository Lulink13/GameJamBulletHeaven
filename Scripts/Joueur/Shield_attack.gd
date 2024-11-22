extends Area2D

# Arrow properties
#var speed = 700     # Adjust as needed
var damage :int
var direction : Vector2
var piercing:int
var shield : Shield
var propa_list :Array[Node]

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rand_int = rng.randi_range(0, 3)
	rotation = 90*rand_int
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var velocity = speed * delta * direction
	#position += velocity
	pass

func _on_body_entered(body: Node2D) -> void:
	#print(body)
	var propagation = false
	if body is Ennemi:
		#print("ennemi touché!!!")
		body.damage(damage)
		if propagation == false and piercing >0 and body not in propa_list :
			propa_list.append(body)
			shield.extra_attack(body.global_position, piercing-1, propa_list)
			propagation= true
			


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	#print(scale)
	$".".queue_free()
	pass # Replace with function body.
