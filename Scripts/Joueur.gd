extends CharacterBody2D
class_name Joueur

signal died

const SPEED : float = 180
const ACCEL : float = 1000
const DECEL : float = 1600

var hp : int = 3
var spd : Vector2 = Vector2(0, 0)
var aim: Vector2 = Vector2(0,1)

var level = 1
var xp = 0

var invuln : bool = false
var alive = true

var attack : int = 1

func _physics_process(delta):
	if not alive : return

	var direction = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down")).normalized()
	
	if direction!= Vector2(0,0) :
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0 :
				$AnimatedSprite2D.play("Walk_R")
			else :
				$AnimatedSprite2D.play("Walk_L")
		else :
			if direction.y > 0 :
				$AnimatedSprite2D.play("Walk_D")
			else :
				$AnimatedSprite2D.play("Walk_U")
	else :
		$AnimatedSprite2D.play("Idle")
	
	var tmp_spd : Vector2
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
	
	if velocity.length() > 0.5:
		aim = velocity.normalized()
	
	velocity = spd
	move_and_slide()

func damage(ammount:int):
	if not invuln :
		hp -= ammount
		if hp <= 0:
			modulate = Color("White")
			$AnimatedSprite2D.play("Tomb")
			#$CollisionShape2D.queue_free()
			$CoinVaccum.monitorable = false
			alive = false
			died.emit()
		else : 
			invuln = true
			$InvulnTimer.start()
			modulate = Color("Red")

func collect_xp(ammount:int):
	xp += ammount
	print(xp, " Xp!")

func _on_invuln_timer_timeout() -> void:
	invuln = false
	modulate = Color("White")

func _on_attack_timer_timeout() -> void:
	pass # Replace with function body.
