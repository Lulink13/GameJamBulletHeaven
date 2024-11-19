extends CharacterBody2D
class_name Joueur

const SPEED : float = 40000
const ACCEL : float = 240000
const DECEL : float = 140000

var hp : int = 10
var spd : Vector2 = Vector2(0, 0)
var invuln : bool = false
var alive = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var direction = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down")).normalized()
	var tmp_spd : Vector2
	#print(direction)
	
#-- Accélération --
	if direction.x == 0 :
		tmp_spd.x = spd.move_toward(Vector2(0,0), DECEL*delta).x
	else :	
		tmp_spd.x = spd.x + (direction.x * ACCEL*delta)
	if direction.y == 0 :
		tmp_spd.y = spd.move_toward(Vector2(0,0), DECEL*delta).y
	else :
		tmp_spd.y = spd.y + (direction.y * ACCEL*delta)
	spd = tmp_spd.limit_length(SPEED)
	
	velocity = spd*delta
	move_and_slide()

#-- Prendre des dégâts --
	if not invuln :
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			if collision.get_collider() is Ennemi:
				print("ennemi!!!")
				hp -= collision.get_collider().get_contact_damage()
				if hp <= 0:
					$Sprite2D.queue_free()
					$CollisionShape2D.queue_free()
					alive = false
				else : invuln = true
				$InvulnTimer.start() 
				modulate = Color("Red")
				break
	get_slide_collision_count()

func _on_invuln_timer_timeout() -> void:
	invuln = false
	modulate = Color("White")

func _on_attack_timer_timeout() -> void:
	pass # Replace with function body.
