extends TextureRect

var dialogue = [
	{"speaker": "Sera", "line": "Ouch, that hurt."},
{"speaker": "Sera", "line": "Where did you find those things?"},
{"speaker": "Doc", "line": "I apologize for the discomfort, Seraphina. These items are from your memories. When I asked you to recall where you felt most comfortable, you inadvertently guided me to your human bedroom."},
{"speaker": "Sera", "line": "I guess that makes sense. I still spend most of my time in my new bedroom. What do the items mean?"},
{"speaker": "Doc", "line": "Typically, the items I extract from your memories are those you had the strongest connection to during your human life."},
{"speaker": "Sera", "line": "I can't seem to remember any of them."},
{"speaker": "Doc", "line": "That's to be expected, and we'll proceed slowly to ensure you don’t feel overwhelmed. Let’s begin with the book. Can you recall any of the stories or characters?"},
{"speaker": "Sera", "line": "I'm assuming from the cover it is about this girl. With my new abilities and urges, I spend most of my time reading, and my favorite smell in the world is when you open up a new book."},
{"speaker": "Sera", "line": "It's about a vampire and a human who fall in love. I can't believe my favorite book was about vampires."},
{"speaker": "Doc", "line": "Are you experiencing any specific feelings or memories?"},
{"speaker": "Sera", "line": "I'm having vague flashbacks, more like feelings of this book making me feel calm in an otherwise chaotic environment."},
{"speaker": "Doc", "line": "Usually, I prefer not to start by showing clients their old journals or previous writings until later in our sessions. However, while exploring your memories, I stumbled upon a list of notes that seemed to form a song. Would you mind trying to play it on the guitar?"},
{"speaker": "Sera", "line": "I don’t know how to play it."},
{"speaker": "Doc", "line": "Try your best to get comfortable and relax, so your body can rely on its muscle memory."},
{"speaker": "Sera", "line": "It’s working!"},
{"speaker": "Doc", "line": "Good job, keep going until you feel like stopping."},
{"speaker": "Sera", "line": "I recall all those times I would sit in my room and just strum away. This comfort is unlike anything I've felt since becoming a vampire."},
{"speaker": "Doc", "line": "You're doing a great job, Seraphina. Thank you for being so patient. Although we have the entire physical journal, only certain entries or parts are accessible in these early stages."},
{"speaker": "Sera", "line": "I want to go back under now. Please, I need to find out more."},
{"speaker": "Doc", "line": "Are you sure you're ready? Now that your brain senses my presence, it may try harder to resist."},
{"speaker": "Sera", "line": "I am ready."},
{"speaker": "Doc", "line": "Okay, this time when you close your eyes, focus on feeling happiness and contentment. Imagine something that makes you feel like yourself and safe. Concentrate on this place and your emotions. Remember, remember, remember. Snap sound."},]

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
	get_tree().change_scene_to_file("res://Scenes/highschool_hallway_scene.tscn")
