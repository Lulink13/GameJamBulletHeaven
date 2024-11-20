extends Area2D

const SPEED = 1/20
var pickuplist : Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for item in pickuplist:
		print("moved ", item)
		item.position -= (item.position - global_position).normalized() * SPEED * delta
	pass


func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_area_entered(area: Area2D) -> void:
	pickuplist.append(area)
	print("added ", area)
	pass # Replace with function body.
