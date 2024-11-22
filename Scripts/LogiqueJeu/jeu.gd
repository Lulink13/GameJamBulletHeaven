extends Node2D

@export var levels : Array[PackedScene]
var niveau:Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	niveau = preload("res://Scenes/Niveaux/Niveau_un.tscn").instantiate()
	add_child(niveau)
	niveau.load_level.connect(_on_level_load)

func _on_level_load(level_id:int):
	niveau.queue_free()
	niveau = levels[level_id].instantiate()
	add_child(niveau)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
