extends Arme
class_name Shield


func _on_timer_timeout() -> void:
	if enabled:
		extra_attack(global_position, piercing)

func extra_attack (global_pos:Vector2, pierce:int, _propa_list:Array[Node]=[]):
	var attack : Area2D = projectile_scene.instantiate()
	attack.shield = self
	get_node("/root/Racine").add_child(attack)
	
	attack.global_position = global_pos
	attack.direction = get_node("../").aim
	#attack.rotation = get_node("../").aim.angle()
	attack.damage = int(get_node("../").attack * damage_multiplier)
	scale = Vector2(range_multiplier, range_multiplier)
	attack.piercing = pierce
	attack.propa_list = _propa_list
	
