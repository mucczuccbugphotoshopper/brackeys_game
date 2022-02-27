extends KinematicBody2D

var direction = "idle"
var speed = default_speed
var held_directions = []

export(int) var default_speed = 190
export(int) var run_speed = 240
export(int) var health = 100
var Velocity = Vector2()
var gun_mode = false
var light_mode = false
var bullet = preload("res://bullet.tscn")
var shoot = false
var shooted_bullet = 0




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
	if not light_mode:
		if gun_mode:
			$gun/Pistol.visible = true
			shoot = true
			
	if not gun_mode:
		if light_mode:
			$light/Flashlight1/Light2D.visible = true
			$light/Flashlight1.visible = true
			shoot = false
		
	if Velocity.length() > 0:
		$anim_player.play("walking")
		
	else:
		$anim_player.play("idle")
		$Character.rotation_degrees = 0
		$Character.texture = load("res://assets/characters/blue char/blue char.png")
		
	Velocity = move_and_slide(Velocity)
	
	if position.y > 3000:
		position.x = 190
		position.y = 1 
	
	if shooted_bullet > 3:
		get_tree().change_scene("res://bad_end.tscn")
	
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
			shooted_bullet += 1







func _on_Area2D_body_entered(body):
	if body != self:
		if "Enemy" in body.name:
			body.health -= 10
