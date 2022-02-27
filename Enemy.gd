extends KinematicBody2D

enum {
	WANDERING,
	RUN,
	ATTACK
}

var state = RUN

var player_load = preload("res://Invesitigator.tscn") 


var move = Vector2.ZERO

export var speed := 4
export var accel := 5
var player = null
export(Vector2) var distance_to_position := Vector2(50, 50)
var p
var health = 60;

func _physics_process(delta):
	move = Vector2.ZERO
	p = rand_range(2,15)
	if player != null:
		move = position.direction_to(player.position) 
		$Placeholder.texture = load("res://assets/characters/gltch.png")
		$Placeholder.material.set_shader_param("p",p);
	else:
		move = Vector2.ZERO
	
		$Placeholder.texture = load("res://assets/characters/npc.png")
		$Placeholder.material.set_shader_param("p",1);
		
	
	if health < 1:
		queue_free()
		get_tree().change_scene("res://good_end.tscn")
	
	print(health)
	
	
		
	move = move.normalized() * speed
	move = move_and_collide(move)



func _on_PlayerChecker_body_entered(body):
	
	if body != self and "Invesitigator" in body.name:
		player = body
	print("collided")


func _on_PlayerChecker_body_exited(body):
	player = null

