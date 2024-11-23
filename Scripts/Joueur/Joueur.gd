extends CharacterBody2D
class_name Joueur

signal died
signal hit
signal levelUP

@export var animations : Array[SpriteFrames]
@export var starting_stats : Array[Character_Stats]
@export var xp_curve : float = 1.3

var speed : float = 180
const ACCEL : float = 1000
const DECEL : float = 1600

var max_hp: int
var hp : int = max_hp
var spd : Vector2 = Vector2(0, 0)
var aim: Vector2 = Vector2(0,1)

var level :int = 1
var xp :int = 0
var next_xp :int = 10

var invuln : bool = false
var alive = true

var attack : int = 1

func _ready() -> void:
	var id = Globales.character
	$AnimatedSprite2D.sprite_frames = animations[id]
	max_hp = starting_stats[id].max_hp
	hp = max_hp
	speed = starting_stats[id].speed
	if Globales.character == 0 : $CrossBow.enabled=true
	if Globales.character == 1 : $Sword.enabled=true
	if Globales.character == 2 : $Shield.enabled=true
	

func show_end_game() -> void:
	# Instance the end game scene
	var end_game_scene = preload("res://Scenes/Menus/EndGame.tscn").instantiate()

	# Add it as a child of the current scene
	add_child(end_game_scene)

	# Make sure it appears on top
	end_game_scene.z_index = 100

func _physics_process(delta):
	if not alive : return

	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var direction = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down")).normalized()
	#print(direction)
	
	if direction!= Vector2(0,0) :
		if $AudioStreamPlayer2D.playing==false:$AudioStreamPlayer2D.play()
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0 :
				$AnimatedSprite2D.play("Walk_R")
			else :
				$AnimatedSprite2D.play("Walk_L")
		else :
			if direction.y > 0 :
				$AnimatedSprite2D.play("Walk_D")
			else :
				$AnimatedSprite2D.play("Walk_U")
	else :
		$AnimatedSprite2D.play("Idle")
		$AudioStreamPlayer2D.playing=false
	
	var tmp_spd : Vector2
#-- Accélération --
	if direction.x == 0 :
		tmp_spd.x = spd.move_toward(Vector2(0,0), DECEL*delta).x
	else :	
		tmp_spd.x = spd.x + (direction.x * ACCEL*delta)
	if direction.y == 0 :
		tmp_spd.y = spd.move_toward(Vector2(0,0), DECEL*delta).y
	else :
		tmp_spd.y = spd.y + (direction.y * ACCEL*delta)
	spd = tmp_spd.limit_length(speed)
	
	if velocity.length() > 0.5:
		aim = velocity.normalized()
	
	velocity = spd
	move_and_slide()

func damage(ammount:int):
	if not invuln and alive :
		hp -= ammount
		hit.emit(hp, max_hp)
		if hp <= 0:
			modulate = Color("White")
			$AnimatedSprite2D.play("Tomb")
			$CollisionShape2D.queue_free()
			$AudioDeath.play()
			$CoinVaccum.monitorable = false
			alive = false
			died.emit()
			get_tree().call_group("Spawner", "disable")
		else : 
			invuln = true
			$InvulnTimer.start()
			modulate = Color("Red")
			$AudioDamage.play()
			

func collect_xp(ammount:int):
	xp += ammount
	if xp >= next_xp :
		xp -= next_xp
		level+=1
		#print("LEVEL UP!")
		levelUP.emit(level)
		next_xp *= xp_curve
		$CrossBow.level_up()
		$Sword.level_up()

func _on_invuln_timer_timeout() -> void:
	invuln = false
	modulate = Color("White")

func _on_attack_timer_timeout() -> void:
	pass # Replace with function body.
