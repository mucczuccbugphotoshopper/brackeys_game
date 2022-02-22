extends KinematicBody2D

var direction = "idle"
var speed = default_speed
var held_directions = []

export(int) var default_speed = 190
export(int) var run_speed = 285
export(int) var health = 100
var Velocity = Vector2()



func _physics_process(delta):
	Velocity = Vector2()
	if Input.is_action_pressed("move_right"):
		Velocity.x = speed
		$Character.flip_h = false
	if Input.is_action_pressed("move_left"):
		Velocity.x = -speed
		$Character.flip_h = false 
	if Input.is_action_pressed("move_down"):
		Velocity.y = speed 
	if Input.is_action_pressed("move_up"):
		Velocity.y = -speed 
	
	if Input.is_action_pressed("shift"):
		speed = run_speed
	else:
		speed = default_speed
	
	
	if Velocity.length() > 0:
		$anim_player.play("walking")
		
	else:
		$anim_player.play("idle")
		$Character.rotation_degrees = 0
		
	Velocity = move_and_slide(Velocity)
	
func _get_movement(dir):
	var vectors = {
		"left" : Vector2(-speed,0),
		"right" : Vector2(speed,0),
		"up" : Vector2(0,-speed),
		"down" : Vector2(0,speed)
	}
	return vectors[dir]


