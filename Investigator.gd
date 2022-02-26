extends KinematicBody2D

onready var pickup_items = get_node("SFX/PickupItems")

export(int) var default_speed = 190
export(int) var run_speed = 240
export(int) var health = 100

export(PackedScene) var light_scene = preload("res://flashlight.tscn")
export(PackedScene) var gun_scene = preload("res://gun.tscn")

var direction = "idle"
var speed = default_speed
var held_directions = []

var Velocity = Vector2()

var bullet = preload("res://bullet.tscn")

var gun_mode = false
var light_mode = false
var shoot = false


func _physics_process(delta):
	Velocity = Vector2()
	if Input.is_action_pressed("move_right"):
		Velocity.x = speed
		$Character.texture = load("res://assets/characters/blue char/blue char left.png")
	if Input.is_action_pressed("move_left"):
		Velocity.x = -speed
		$Character.texture = load("res://assets/characters/blue char/blue char right.png")
	if Input.is_action_pressed("move_down"):
		Velocity.y = speed
		$Character.texture = load("res://assets/characters/blue char/blue char.png") 
	if Input.is_action_pressed("move_up"):
		Velocity.y = -speed
		$Character.texture = load("res://assets/characters/blue char/blue char.png") 
	
	if Input.is_action_pressed("shift"):
		speed = run_speed
	else:
		speed = default_speed
	
	if gun_mode:
		start.flashlight = false
		pickup_items.presets_powerup()
		shoot = true
		
		if light_mode:
			light_mode = false
			$light/Flashlight1/Light2D.visible = false
			$light/Flashlight1.visible = false
			$gun/Pistol.visible = true
		
		else:
			$gun/Pistol.visible = true
	if light_mode:
		$light/Flashlight1/PotChecker/CollisionShape2D.disabled = false
		start.flashlight = true
		pickup_items.presets_powerup()
		shoot = false
		
		if gun_mode:
			gun_mode = false
			$gun/Pistol.visible = false
			$light/Flashlight1/Light2D.visible = true
			$light/Flashlight1.visible = true
		
		else:
			$light/Flashlight1/Light2D.visible = true
			$light/Flashlight1.visible = true
		
	if Velocity.length() > 0:
		$anim_player.play("walking")
		
	else:
		$anim_player.play("idle")
		$Character.rotation_degrees = 0
		$Character.texture = load("res://assets/characters/blue char/blue char.png")
		
	Velocity = move_and_slide(Velocity)


func _get_movement(dir):
	var vectors = {
		"left" : Vector2(-speed,0),
		"right" : Vector2(speed,0),
		"up" : Vector2(0,-speed),
		"down" : Vector2(0,speed)
	}
	return vectors[dir]


func _input(event):
	if shoot:
		if event is InputEventMouseButton and event.is_pressed():
			var bullet_instance = bullet.instance()
			get_parent().add_child(bullet_instance)
			bullet_instance.global_position = $gun/Position2D.global_position
			bullet_instance.rotation = $gun.rotation
