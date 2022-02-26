extends Area2D

export(PackedScene) var level_changer 

var test : String
func _on_Key_body_entered(body: Node) -> void:
	if body.name == "Investigator":
		get_tree().change_scene_to(level_changer)
	print("EE")


func _on_Key_area_entered(area: Area2D) -> void:
	get_tree().change_scene_to(level_changer)
	print("EE")
