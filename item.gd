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


func _on_item_body_entered(body):
	if "Invesitigator" in body.name:
		if not body.light_mode:
			queue_free()
		body.gun_mode = true
