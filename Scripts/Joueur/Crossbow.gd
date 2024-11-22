extends Arme

func _on_timer_timeout() -> void:
	if enabled:
		var arrow : Area2D = projectile_scene.instantiate()
		get_parent().add_child(arrow)
		
		arrow.global_position = global_position
		arrow.direction = get_node("../").aim
		arrow.rotation = get_node("../").aim.angle()
		arrow.damage = int(get_node("../").attack * damage_multiplier)
		arrow.piercing = piercing
