extends Node2D

# Crossbow properties
var arrow_scene = preload("res://Scenes/scene_arrow.tscn")  # Make sure to create this scene
var can_shoot = true
var shoot_cooldown = 0.5  # Time between shots in seconds
var arrow_speed = 400     # Adjust as needed
var arrow_damage = 1      # Adjust as needed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	handle_shooting()


func _on_timer_timeout() -> void:
	shoot_arrow() # Replace with function body.

func handle_shooting():
	if Input.is_action_just_pressed("shoot") and can_shoot:  # You'll need to set up this input action
		can_shoot = false
		get_tree().create_timer(shoot_cooldown).timeout.connect(func(): can_shoot = true)

func shoot_arrow():
	var arrow = arrow_scene.instantiate()
	get_parent().add_child(arrow)
	arrow.global_position = global_position
	
	# Get mouse position for aiming
	#var mouse_pos = get_global_mouse_position()
	#var direction = (mouse_pos - global_position).normalized()
	#var direction = direction
	
	# Set arrow properties
	arrow.direction = Vector2(1, 0)
