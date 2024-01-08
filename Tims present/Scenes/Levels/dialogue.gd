extends TextureRect

var json= JSON.new()
var json_data = []
var current_dialogue_index = 0
var file = FileAccess.open("res://Assets/TemplateDialogue.json",FileAccess.READ)

func _ready():
	
	if file:
		var content = file.get_as_text()
		file.close()  # Close the file after reading its content

		# JSON parsing
		var json_result = json.parse(content)
	
	else:
		print("Failed to open file")
		
		
func update_dialogue(dialogue_data):
	$Name.text = dialogue_data["characterName"]
	# $Portrait.texture = load(dialogue_data["portrait"])
	$Text.text = dialogue_data["dialogue"]
	
func _input(event):
	if event.is_action_pressed("Pickup") and current_dialogue_index < json_data.size() - 1:
		# 'E' key pressed, go to next dialogue
		current_dialogue_index += 1
		update_dialogue(file)
	elif event.is_action_pressed("up") and current_dialogue_index > 0:
		# 'W' key pressed, go to previous dialogue
		current_dialogue_index -= 1
		update_dialogue(file)
