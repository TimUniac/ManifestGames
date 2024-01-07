extends TextureRect

@export var textSpeed: float = 0.05

var dialogue: Array
var phraseNum = 0
var finished = false

func _ready():
	$Timer.wait_time = textSpeed
	nextPhrase()

func getDialogue() -> Array:
	var file = FileAccess.open("res://Assets/TemplateDialogue.json", FileAccess.READ)
	if FileAccess.open("res://Assets/TemplateDialogue.json", FileAccess.READ):
		print("Failed to open file.")
	return []

	var json_data = file.get_as_text()
	file.close()

	var json = JSON.new()
	var result = json.parse(json_data)
	if result.error == OK:
		return result.result
	else:
		print("Failed to parse JSON: ", result.error)
		return []

func nextPhrase() -> void:
	if phraseNum >= dialogue.size():
		queue_free()
		return

	$Name.bbcode_text = dialogue[phraseNum]["Name"]
	$Text.bbcode_text = dialogue[phraseNum]["Text"]
	$Text.visible_characters = 0
	phraseNum += 1

	while $Text.visible_characters < $Text.bbcode_text.length():
		$Text.visible_characters += 1
		await $Timer.timeout
