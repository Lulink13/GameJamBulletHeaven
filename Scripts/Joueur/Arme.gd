extends Node2D
class_name  Arme

# Crossbow properties
@export var stats : Stats_Arme
@export var projectile_scene : PackedScene
@export var enabled :bool = true
var niveau : int = 0
var shoot_cooldown = 0.5  # Time between shots in seconds
var damage_multiplier = 1      # Adjust as needed
var range_multiplier = 1
var piercing = 0

var projectile_node : Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	projectile_node = get_node("/root/Racine/Niveau/Projectiles")
	set_level(0) 
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#handle_shooting()
	pass

func _on_timer_timeout() -> void:
	if enabled:
		var attack : Area2D = projectile_scene.instantiate()
		#get_node("/root/Racine/Projectiles").add_child(attack)
		
		attack.global_position = global_position
		attack.direction = get_node("../").aim
		attack.rotation = get_node("../").aim.angle()
		attack.damage = int(get_node("../").attack * damage_multiplier)
		attack.scale = range_multiplier
		#attack.piercing = piercing

func level_up() :
	if niveau < len(stats.niveaux) - 1 :
		niveau+=1
		set_level(niveau)

func set_level(level:int) :
	var new_stats = stats.niveaux[niveau]
	shoot_cooldown = new_stats.cooldown
	$Timer.wait_time= shoot_cooldown
	damage_multiplier = new_stats.multiplicateur_degats
	range_multiplier = new_stats.multiplicateur_portée
	#piercing = new_stats.penetration_prejectile

func _on_joueur_died() -> void:
	enabled=false
	pass # Replace with function body.
