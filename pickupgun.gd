extends Area2D

func _ready():
	$AnimationPlayer.play("item")

func _on_flashlight_body_entered(body):
	if body.name == "Investigator":
		body.light_mode = false
		body.gun_mode = true
		queue_free()
