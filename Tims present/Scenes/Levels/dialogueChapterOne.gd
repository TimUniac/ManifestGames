extends TextureRect

var dialogue = [
	{"speaker": "Doc", "line": "Hi Seraphina, thank you so much for coming in today. What brings you here?"},
	{"speaker": "Sera", "line": "Thank you for meeting me at night; I really appreciate it. Umm, I'm not quite sure where to start."},
	{"speaker": "Doc", "line": "Of course, I understand being vulnerable is scary, but I want you to be as open as you can in know this is a safe space."},
	{"speaker": "Doc", "line": "What would you like me to know about you?"},
	{"speaker": "Sera", "line":"Hmm, well, that's kind of a tricky question to answer and one of the main reasons I'm here."}, 
	{"speaker": "Sera", "line": "I want to get to know my human self. I know I didn't choose this life"},
	{"speaker": "Sera", "line": "I can feel in my cold-blooded veins that I was not meant to be a monster. But I don't remember the human I used to be."},
	{"speaker": "Doc", "line": "What does that feeling feel like in your body?"},
	{"speaker": "Sera", "line": "It feels like there is a rope attached to my heart, and it's being pulled in this unknown direction."},
	{"speaker": "Sera", "line": "I am constantly feeling a loss of connection or that it's on the tip of my mind, but I just can’t seem to remember."},
	{"speaker": "Sera", "line": "I am fighting these animalistic urges to feed because I couldn't live with myself if I turned into a bloodthirsty monster."},
	{"speaker": "Doc", "line": "You may have heard that my methods are a bit unorthodox, but if you are willing to trust me and embark on this healing journey,"}, 
	{"speaker": "Doc", "line": "I can assure you that we can solve your problem."},
	{"speaker": "Sera", "line": "Yes, I am open to anything. I just don’t want to feel like this anymore."},
	{"speaker": "Doc", "line": "Okay, Seraphina, I would like you to get into a position you are most comfortable in, whether that is lying down or simply lying back."}, 
	{"speaker": "Doc", "line": "I need you to close your eyes and imagine a place where you feel the most comfortable. Really focus on this place and your feelings. Remember, remember,"}]

var current_line = 0
var total_characters = 0
var visible_characters = 0
var is_line_complete = false


func _ready():
	update_dialogue()
	$Advance/Advance.visible = false
	

func _process(_delta):
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
	$Advance/Advance.visible = true

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
	play_dialogue_audio(current_dialogue["speaker"], current_line)
	
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
	
func play_dialogue_audio(speaker, line_):
	var audio_file_name = "res://Assets/Sound/VO/VO_Office_1/" + speaker + "_" + "line_" + str(line_ + 1) + ".mp3"
	var audio_stream = load(audio_file_name)
	if audio_stream:
		$VOPlayer.stream = audio_stream
		$VOPlayer.play()
	else:
		print("Audio file not found: " + audio_file_name)
