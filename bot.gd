extends KinematicBody2D

var is_imposter = rand_range(0,1)
var motion = Vector2()
var state
var dialugoe = preload("res://Dialogue_system.tscn")
var Player = preload("res://Investigator.tscn")
var follow = false

func _ready():
	pass

func _physics_process(delta):
	motion = Vector2.ZERO
	
	if follow:
		var p = Player.instance()
		motion = (p.global_position-global_position).normalized()
		
		
	
	
	motion = motion*5
	motion = move_and_collide(motion)



func _on_Timer_timeout():
	state = floor(rand_range(0,4))





func _on_collider_body_entered(body):
	if "Invesitigator" in body.name:
		state = 0
		$Timer.wait_time = 456
	
	


func _on_collider_body_exited(body):
	if "Invesitigator" in body.name:
		state = floor(rand_range(0,4))
		$Timer.wait_time = 7


func _on_collider_area_entered(area):
	if "bullet" in area.name:
		pass
