extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("item")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_flashlight_body_entered(body):
	print("E")
	if "Investigator" in body.name:
		if not body.gun_mode:
			queue_free()
		body.light_mode = true
