extends Area2D
class_name Objet

const MAX_SPEED = 50
const FOLLOW_SPEED = 300
var follow : Node = null

var tween : Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	tween = get_tree().create_tween().set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	var movement = Vector2(rng.randf_range(-MAX_SPEED, MAX_SPEED), rng.randf_range(-MAX_SPEED, MAX_SPEED))
	tween.tween_property(self, "global_position",global_position+movement, 1)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if follow:
		position += (follow.global_position - global_position).normalized() * FOLLOW_SPEED * delta


func _on_area_entered(area: Area2D) -> void:
	tween.stop()
	follow = area


func _on_body_entered(body: Node2D) -> void:
	if body is Joueur:
		body.collect_xp(1)
		queue_free()
	pass # Replace with function body.
