extends CanvasLayer

var dialugoe = preload("res://Dialoge_system.tscn")


func _on_collider_body_entered(body):
	if "Npc" in body.name:
		var dialugoe_instance = dialugoe.instance()
		add_child(dialugoe_instance)
