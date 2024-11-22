extends TextureRect

# Array to store the textures
var textures: Array[Texture2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Load the 5 textures
	textures = [
		preload("res://Images/Tiles/Heart_icons/Heart_icon (6).png"),
		preload("res://Images/Tiles/Heart_icons/Heart_icon (7).png"),
		preload("res://Images/Tiles/Heart_icons/Heart_icon (8).png"),
		preload("res://Images/Tiles/Heart_icons/Heart_icon (9).png"),
		preload("res://Images/Tiles/Heart_icons/Heart_icon (10).png")
	]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_joueur_hit(hp: int, max_hp: int) -> void:
	if hp == 0:
		return
	print("hp: ", hp, " - max_hp: ", max_hp)
	# Calculate health percentage and convert to index
	var health_percentage: float = float(hp) / float(max_hp)
	var health_index: int = textures.size() - round(health_percentage * textures.size())
	print("health percentage: ", round(health_percentage * 100), "% - health index: ", health_index)
	texture = textures[health_index]
