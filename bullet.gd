extends Area2D

var velocity = Vector2()
var spped = 20
var direction = 1

func set_dir(dir):
	direction = dir

func _physics_process(delta):
	position += (Vector2.RIGHT*spped).rotated(rotation)


func _on_bullet_body_entered(body):
	queue_free()


