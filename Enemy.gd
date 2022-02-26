extends KinematicBody2D

enum {
	WANDERING,
	RUN,
	ATTACK
}

var state = WANDERING

var player = null

var velocity := Vector2.ZERO

export var speed := 20
export var accel := 5
export(Vector2) var distance_to_position := Vector2(50, 50)

func _process(delta: float) -> void:
	match state:
		WANDERING:
		#PLAY IDLE
			var distance = (distance_to_position - global_position)
			velocity = velocity.move_toward(distance * speed, accel * delta )
			print(global_position)
		RUN:
			var direction = (player.global_position - global_position).normalized()
			velocity = velocity.move_toward(direction * speed, accel * delta)
			print("RIUN")
		ATTACK:
			pass
	velocity = move_and_slide(velocity)




func _on_PlayerChecker_body_entered(body: Node) -> void:
	state = RUN
	player = body
	print(player.get_class())


func _on_PlayerChecker_body_exited(body: Node) -> void:
	state = WANDERING
	player = null
