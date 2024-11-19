extends Node2D
class_name Arme

# Crossbow properties
var projectile_scene = preload("res://Scenes/scene_arrow.tscn")  # Make sure to create this scene
var enabled = true
var shoot_cooldown = 0.5  # Time between shots in seconds
var damage_multiplier = 1      # Adjust as needed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#handle_shooting()
	pass

#func handle_shooting():
	#if Input.is_action_just_pressed("shoot") and enabled:  # You'll need to set up this input action
		#enabled = false
		#get_tree().create_timer(shoot_cooldown).timeout.connect(func(): enabled = true)

func _on_timer_timeout() -> void:
	if enabled:
		var arrow : Area2D = projectile_scene.instantiate()
		get_node("/root/Racine/Projectiles").add_child(arrow)
		
		arrow.global_position = global_position
		arrow.direction = get_node("../").aim
		arrow.rotation = get_node("../").aim.angle()
		arrow.damage = int(get_node("../").attack * damage_multiplier)

#func shoot_arrow():
	# Get mouse position for aiming
	#var mouse_pos = get_global_mouse_position()
	#var direction = (mouse_pos - global_position).normalized()
	#var direction = direction
	
	# Set arrow properties


func _on_joueur_died() -> void:
	enabled=false
	pass # Replace with function body.
