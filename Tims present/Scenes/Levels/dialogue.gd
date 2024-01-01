extends TextureRect

@export var dialoguePath = ""
@export var textSpeed : float = 0.05


var dialogue

var phraseNum = 0
var finished = false

func _ready():
	$Timer.wait_time = textSpeed
	dialogue = getDialogue()
	assert(dialogue, "Dialogue not Found")
	nextPhrase()
	
	
func getDialogue() -> Array:
	var f = File.new()
	assert(f.file_exists(dialoguePath),"File path does not exist")
	
	f.open(dialoguePath, File.READ)
	var json = f.get_as_text()
	
	var output = parse_json(json)
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return[]
		
func nextPhrase() -> void:
	if phraseNum >= len(dialogue):
		queue_free()
		return
		
	finished = false
	
	$Name.bbcode_text = dialogue[phraseNum]["Name"]
	$Text.bbcode_text = dialogue[phraseNum]["Text"]
	
	$Text.visible_characters = 0
	
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		
		$Timer.start()
		await $Timer.timeout
	
