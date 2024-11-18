extends CharacterBody2D


const SPEED : float = 300.0
const ACCEL : float = 0.1 * SPEED

var hp : int = 10
var spd : Vector2 = Vector2(0, 0)
var invuln : bool = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var direction_x = Input.get_axis("ui_left", "ui_right")
	var direction_y = Input.get_axis("ui_up", "ui_down")
	spd.x = max(min(SPEED, spd.x+direction_x*ACCEL),-SPEED)
	spd.y = max(min(SPEED, spd.y+direction_y*ACCEL),-SPEED)
	if direction_y == 0:
		spd.y -= ACCEL / 2 if spd.y > 0 else -ACCEL / 2
		if abs(spd.y) < 2 * ACCEL:
			spd.y = 0
	if direction_x == 0:
		spd.x -= ACCEL / 2 if spd.x > 0 else -ACCEL / 2
		if abs(spd.x) < 2 * ACCEL:
			spd.x = 0

	velocity = spd
	move_and_slide()
	if not invuln :
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			if collision.is_ennemy():
				hp -= collision.get_contact_damage()
				if hp <= 0: queue_free()
				else : invuln = false
		$InvulnTimer.start()

	get_slide_collision_count()

func _on_invuln_timer_timeout() -> void:
	invuln = false


func _on_attack_timer_timeout() -> void:
	pass # Replace with function body.
