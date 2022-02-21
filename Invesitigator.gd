extends KinematicBody2D

var direction = "idle"
var speed = 190;
var held_directions = []
export var health = 100



func _physics_process(delta):
	for dir in ["left","right","up","down"]:
		var is_pressed = Input.is_action_pressed("move_"+dir)
		var index_of_direction = held_directions.find(dir)
		if index_of_direction == -1:
			if is_pressed:
				held_directions.push_front(dir)
		else:
			if !is_pressed:
				held_directions.remove(index_of_direction)
				direction = 'idle'

	if held_directions.size() > 0:
		direction = held_directions[0]
		move_and_slide(_get_movement(direction))
	
	if Input.is_action_pressed("shift"):
		speed = 240;
	else:
		speed = 190;
	
	
	if direction == 'right':
		$anim_player.play("walking")
		$Character.flip_h = false
	elif direction == 'left':
		$anim_player.play("walking")
		$Character.flip_h = true
	elif direction == 'up':
		$anim_player.play("walking")
	elif direction == 'down':
		$anim_player.play("walking")
	else:
		$anim_player.play("idle")
		$Character.rotation_degrees = 0
		

func _get_movement(dir):
	var vectors = {
		"left" : Vector2(-speed,0),
		"right" : Vector2(speed,0),
		"up" : Vector2(0,-speed),
		"down" : Vector2(0,speed)
	}
	return vectors[dir]


