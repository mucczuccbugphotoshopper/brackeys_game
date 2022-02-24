extends KinematicBody2D

var is_imposter = rand_range(0,1)
var motion = Vector2()
var state
var dialugoe = preload("res://Dialoge_system.tscn")

func _ready():
	pass

func _physics_process(delta):

	
	if state == 0:
		motion.x = 0
		motion.y = 0
	
	elif state == 1:
		motion.x = 100
	
	elif state == 2:
		motion.x = -100
	
	elif state == 3:
		motion.y = -100
	elif state == 4:
		motion.y = 100
	
	move_and_slide(motion,Vector2(0,-1))



func _on_Timer_timeout():
	state = floor(rand_range(0,4))





func _on_collider_body_entered(body):
	if "Invesitigator" in body.name:
		state = 0
	


func _on_collider_body_exited(body):
	if "Invesitigator" in body.name:
		state = floor(rand_range(0,4))
