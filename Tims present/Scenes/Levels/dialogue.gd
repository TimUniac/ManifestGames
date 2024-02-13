extends TextureRect

var dialogue = [
	{"speaker": "Doc", "line": "Hi Seraphina, I gotta tell ya, that song you wrote was a banger."},
	{"speaker": "Sera", "line": "Thank you, it makes me wonder if I wrote others."},
	{"speaker": "Doc", "line": "Of course we'll never know if these guys don't finish this friggin' game."}]

var current_line = 0
var total_characters = 0
var visible_characters = 0
var is_line_complete = false


func _ready():
	update_dialogue()
	$Advance.visible = false
	

func _process(delta):
	if (Input.is_action_just_released("Interact")):
		handle_interact()
	if (Input.is_action_just_released("jump")):
		handle_interact()
	if (Input.is_action_just_released("up")):
		handle_up()
	
		
	# Typewriter effect
	if visible_characters < total_characters:
		visible_characters += 1
		is_line_complete = false
		update_visible_characters()
	if visible_characters == total_characters:
		complete_line()
	
func handle_interact():
	if not is_line_complete:
		complete_line()
	else:
		next_line()
		$Advance.visible = false

func handle_up():
	if current_line > 0:
		current_line -= 1
		update_dialogue()

func complete_line():
	visible_characters = total_characters
	is_line_complete = true
	update_visible_characters()
	$Advance.visible = true

func next_line():
	current_line += 1
	if current_line >= dialogue.size():
		change_scene() 
	else:
		update_dialogue()
	
	
func update_dialogue():
	var current_dialogue = dialogue[current_line]
	visible_characters = 0
	total_characters = current_dialogue["line"].length()
	is_line_complete = false

	if current_dialogue["speaker"] == "Doc":
		$Doc.visible_characters = -1
		$Text.set_text(current_dialogue["line"])
		$Sera.visible_characters = 0
	elif current_dialogue["speaker"] == "Sera":
		$Sera.visible_characters = -1
		$Text.set_text(current_dialogue["line"])
		$Doc.visible_characters = 0

	update_visible_characters()

func update_visible_characters():
	$Text.visible_characters = visible_characters

func change_scene():
	get_tree().change_scene_to_file("res://Scenes/Levels/seraphina_bedroom_male.tscn")
