extends Area2D


export(bool) var enemy_inside 
export(PackedScene) var level_changer

var enemy := preload("res://Enemy.tscn")
var key := preload("res://assets/entities/Key.tscn")
var key_is_true := false

func _ready() -> void:
	if enemy_inside == false:
		$"Enemy Placeholder".visible = false
		$EE.visible = true
	else:
		$"Enemy Placeholder".visible = true
		$EE.visible = false



func _on_Pot_area_entered(area: Area2D) -> void:

	if start.flashlight == false:
		if enemy_inside == true:
			var Enemy := enemy.instance()
			add_child(Enemy)
			enemy_inside = false
		else:
			var key_input := key.instance()
			add_child(key_input)
			var k_e_y = get_node("Key")
			k_e_y.level_changer = level_changer
			
		$EE.queue_free()
		$"Enemy Placeholder".queue_free()
		$Pot.visible = false
		$CollisionShape2D.queue_free()
	elif start.flashlight == true:
		$Pot.frame = 1
		key_is_true = true

func _on_Pot_area_exited(area: Area2D) -> void:
	$Pot.frame = 0
	key_is_true = false

func _physics_process(delta: float) -> void:
	if start.flashlight == true and Input.is_action_just_pressed("ui_accept") and key_is_true == true:
		get_tree().change_scene_to(level_changer)
