extends Node2D

onready var Dia = get_node("CanvasLayer/Dialoge_system")
onready var Player = get_node("Investigator")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dia.PhraseNum == 0
	print(Dia.PhraseNum)

func _physics_process(delta: float) -> void:
	if Dia.PhraseNum != 6:
		Player.speed = 0
	else:
		Player.speed = 190
	print(Dia.PhraseNum) 
#MAKE ITEMS BEING ABLE TO BE FOUND 
