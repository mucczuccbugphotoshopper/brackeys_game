extends ColorRect

export var dialogPath = ""
export (float)  var text_speed = 0.05

var dialog

var PhraseNum = 0
var finished = false

func _ready():
	$Timer.wait_time = text_speed
	dialog = getDialog()
	nextPhrase()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if finished:
			nextPhrase()
	

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
		queue_free()
		return
	
	finished = false
	$Name.bbcode_text = dialog[PhraseNum]["Name"]
	$Text.bbcode_text = dialog[PhraseNum]["Text"]
	
	$Text.visible_characters = 0
	
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		
		$Timer.start()
		yield($Timer,"timeout")
	
	finished = true
	PhraseNum += 1
	return
