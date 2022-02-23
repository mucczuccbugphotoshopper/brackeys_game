extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_item_body_entered(body):
	print(body.name)
	if body.name == "Invesitigator":
		$AnimationPlayer.play("got eem")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "got eem":
		queue_free()
