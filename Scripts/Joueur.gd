extends CharacterBody2D
class_name Joueur

const SPEED : float = 40000
const ACCEL : float = 240000
const DECEL : float = 140000

var hp : int = 10
var spd : Vector2 = Vector2(0, 0)
var aim: Vector2 = Vector2(0,1)

var invuln : bool = false
var alive = true

func _physics_process(delta):
	var direction = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down")).normalized()
	var tmp_spd : Vector2
	#print(direction)
	if velocity.length() > 0.5:
		aim = velocity.normalized()
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

func damage(ammount:int):
	if not invuln :
		hp -= ammount
		if hp <= 0:
			$Sprite2D.queue_free()
			$CollisionShape2D.queue_free()
			alive = false
		else : invuln = true
		$InvulnTimer.start() 
		modulate = Color("Red")

func _on_invuln_timer_timeout() -> void:
	invuln = false
	modulate = Color("White")

func _on_attack_timer_timeout() -> void:
	pass # Replace with function body.
