extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (String) var path

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StaticBody2D_body_entered(body):
	if Input.is_action_pressed("ui_accept"):
		print("D")
		Ok.player_pos = body.global_position
		if "Invesitigator" in body.name:
			get_tree().change_scene(path)
			body.speed = 0
