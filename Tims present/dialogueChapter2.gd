extends TextureRect
var dialogue = [
	{"speaker": "Sera", "line": "Ouch, that hurt."},
{"speaker": "Sera", "line": "Where did you find those things?"},
{"speaker": "Doc", "line": "I apologize for the discomfort,\n Seraphina. These items are from\n your memories."}, 
{"speaker": "Doc", "line": "When I asked you to recall where\n you felt most comfortable, you\n inadvertently guided me to your\n human bedroom."},
{"speaker": "Sera", "line": "I guess that makes sense. I still\n spend most of my time in my new\n bedroom. What do the items mean?"},
{"speaker": "Doc", "line": "Typically, the items I extract from\n your memories are those you had\n the strongest connection to during\n your human life."},
{"speaker": "Sera", "line": "I can't seem to remember any of\n them."},
{"speaker": "Doc", "line": "That's to be expected, and we'll\n proceed slowly to ensure you don’t\n feel overwhelmed. Let’s begin with\n the book. Can you recall any of the\n stories or characters?"},
{"speaker": "Sera", "line": "I'm assuming from the cover it is\n about this girl. With my new\n abilities and urges…"},
{"speaker": "Sera", "line": "I spend most of my time reading,\n and my favorite smell in the world\n is when you open up a new book." },
{"speaker": "Doc", "line": "Are you experiencing any specific\n feelings or memories?"},
{"speaker": "Sera", "line": "I'm having vague flashbacks, more\n like feelings of this book making\n me feel calm in an otherwise\n chaotic environment."},
{"speaker": "Doc", "line": "Usually, I prefer not to start by\n showing clients their old journals\n or previous writings until later in\n our sessions."},
{"speaker": "Doc", "line":  "However, while exploring your\n memories, I stumbled upon a list of\n notes that seemed to form a song.\n Would you mind trying to play it\n on the guitar?"},
{"speaker": "Sera", "line": "I don’t know how to play it."},
{"speaker": "Doc", "line": "Try your best to get comfortable\n and relax, so your body can rely on\n its muscle memory."},
{"speaker": "Sera", "line": "It’s working!"},
{"speaker": "Doc", "line": "Good job, keep going until you feel\n like stopping."},
{"speaker": "Sera", "line": "I recall all those times I would sit in\n my room and just strum away. This\n comfort is unlike anything I've felt\n since becoming a vampire."},
{"speaker": "Doc", "line": "You're doing a great job, Seraphina.\n Thank you for being so patient."},
{"speaker": "Doc", "line": "Although we have the entire\n physical journal, only certain\n entries or parts are accessible in\n these early stages."},
{"speaker": "Sera", "line": "I want to go back under now.\n Please, I need to find out more."},
{"speaker": "Doc", "line": "Are you sure you're ready? Now\n that your brain senses my presence,\n it may try harder to resist."},
{"speaker": "Sera", "line": "I am ready."},
{"speaker": "Doc", "line": "Okay, this time when you close\n your eyes, focus on feeling\n happiness and contentment."},
{"speaker": "Doc", "line": "Imagine something that makes you\n feel like yourself and safe.\n Concentrate on this place and your\n emotions. Remember, remember,\n remember."},]

var current_line = 0
var total_characters = 0
var visible_characters = 0
var is_line_complete = false

@onready var audio_stream_player_office = $"../../../../OfficeTheme"
@onready var audio_stream_player_guitar = $Guitar
var fade_out_target_db: float = -80.0
var fade_in_initial_db: float = -80.0
var fade_duration: float = 3.0
var fade_timer: float = 0.0
var fading_out: bool = false
var fading_in: bool = false

func _ready():
	update_dialogue()
	$Advance/Advance.visible = false
	audio_stream_player_guitar.volume_db = fade_in_initial_db

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
		$Type.play()
		update_visible_characters()
	if visible_characters == total_characters:
		complete_line()
	
	if fading_out:
		fade_timer += delta
		var progress = fade_timer / fade_duration
		audio_stream_player_office.volume_db = lerp(audio_stream_player_office.volume_db, fade_out_target_db, progress)
		if progress >= 1.0:
			fading_out = false
			fade_timer = 0.0

	if fading_in:
		audio_stream_player_guitar.play()
		fade_timer += delta
		var progress = fade_timer / fade_duration
		audio_stream_player_guitar.volume_db = lerp(fade_in_initial_db, -20.0, progress)
		if progress >= 1.0:
			fading_in = false
			fade_timer = 0.0

func handle_interact():
	if not is_line_complete:
		complete_line()
	else:
		next_line()
		$Advance/Advance.visible = false

func handle_up():
	if current_line > 0:
		current_line -= 1
		update_dialogue()

func complete_line():
	visible_characters = total_characters
	is_line_complete = true
	update_visible_characters()
	$Advance/Advance.visible = true

func next_line():
	current_line += 1
	if current_line >= dialogue.size():
		change_scene() 
	else:
		update_dialogue()
	
	
func update_dialogue():
	var current_dialogue = dialogue[current_line]
	if current_dialogue["speaker"] == "Sera" and current_dialogue["line"] == "I don’t know how to play it.":
		triggerOut()
	elif current_dialogue["speaker"] == "Doc" and current_dialogue["line"].ends_with("muscle memory."):
		triggerIn()
	
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

func triggerOut():
	fading_out = true
	fading_in = false
	fade_timer = 0.0

func triggerIn():
	fading_in = true
	fading_out = false
	fade_timer = 0.0

func change_scene():
	get_tree().change_scene_to_file("res://Scenes/highschool_hallway_scene.tscn")
