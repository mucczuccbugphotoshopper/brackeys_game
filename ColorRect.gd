extends Control

export var dialogPath = ""
export (float)  var text_speed = 0.05

var dialog
var counter = 0
var PhraseNum = 0
var finished = false
var Player 
func _ready():
	Player = load("res://Invesitigator.tscn")
	$ColorRect/Timer.wait_time = text_speed
	dialog = getDialog()
	nextPhrase()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if finished:
			nextPhrase()
			var Player_InsTance = Player.instance()
			counter += 1
			
	

func getDialog() -> Array:
	var f = File.new()
	assert(f.file_exists(dialogPath),"File path doesnt exists") 
	
	f.open(dialogPath,File.READ)
	var json = f.get_as_text()
	
	var output = parse_json(json)
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []
		

func nextPhrase() -> void:
	if PhraseNum >= len(dialog):
		visible = false
		return
	
	finished = false
	$ColorRect/Name.bbcode_text = dialog[PhraseNum]["Name"]
	$ColorRect/Text.bbcode_text = dialog[PhraseNum]["Text"]
	
	$ColorRect/Text.visible_characters = 0
	
	while $ColorRect/Text.visible_characters < len($ColorRect/Text.text):
		$ColorRect/Text.visible_characters += 1
		
		$ColorRect/Timer.start()
		yield($ColorRect/Timer,"timeout")
	
	finished = true
	PhraseNum += 1
	return
