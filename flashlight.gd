extends Area2D


func _ready():
	$AnimationPlayer.play("item")

func _on_flashlight_body_entered(body):
	print(body.name)
	if body.name == "Investigator":
		body.light_mode = true
		queue_free()
