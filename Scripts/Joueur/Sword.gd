extends Arme

func _on_timer_timeout() -> void:
	if enabled:
		print(niveau)
		var attack : Area2D = projectile_scene.instantiate()
		add_child(attack)
		#get_node("/root/Racine/Projectiles").add_child(attack)
		
		attack.global_position = global_position
		attack.direction = get_node("../").aim
		attack.rotation = get_node("../").aim.angle()
		attack.damage = int(get_node("../").attack * damage_multiplier)
		scale = Vector2(range_multiplier, range_multiplier)
		#attack.piercing = piercing
