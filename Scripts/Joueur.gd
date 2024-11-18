extends CharacterBody2D


const SPEED = 300.0
const ACCEL = 0.5 * SPEED
var spd : Vector2 = Vector2(0, 0)
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
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
