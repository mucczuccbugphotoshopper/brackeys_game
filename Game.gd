extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var PLayer = get_node("Invesitigator")
onready var Dia = get_node("CanvasLayer/Dialoge_system")
onready var Npc = get_node("Npc")
onready var timer := $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
var p
func _physics_process(delta):
	PLayer.speed = 0
	p = rand_range(2,15)
	#if Dia.counter > 6:
		#PLayer.gun_mode = true
		#Npc.follow = false
		#$Npc/Icon.texture = load("res://assets/characters/gltch.png")
		#$Npc/Icon.material.set_shader_param("p",p);

	
	if Dia.PhraseNum == 8:
		$CanvasLayer/Icon2.visible = true
		get_tree().change_scene("res://level2.tscn")
		print("E")
	
	print(Dia.PhraseNum)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	get_tree().change_scene("res://level2.tscn")
