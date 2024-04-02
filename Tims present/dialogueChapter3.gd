extends TextureRect
var dialogue = [
{"speaker": "Sera", "line": " I'm never going to get used to that."},
{"speaker": "Doc", "line": "I know it's not the most\n comfortable feeling, but I found\n some interesting stuff! It seems like\n you were going somewhere."},
{"speaker": "Doc", "line": "I want us to start with the journal;\n it seems to be a significant part of\n your past life. What memories\n come to mind when you think of\n journaling?"},
{"speaker": "Sera", "line": "I haven't journaled much recently,\n but I could imagine it would be a\n great way to let off some steam and\n express yourself freely."},
{"speaker": "Doc", "line": "Your last three journal entries have\n been paragraphs describing your\n day or week in a negative way your\n last entry is different."},
{"speaker": "Sera", "line": "I haven't felt like that since I was\n human. I feel this sharp pain where\n the memory of my friends used to\n be."},
{"speaker": "Doc", "line": "Excellent. I want you to immerse\n yourself in that feeling while I\n reread the passage to you. And this\n time, please hold onto the best\n friend necklace."},
{"speaker": "Sera", "line": "I see them, I see her. The day she\n gave me this necklace means\n everything to me; she means\n everything to me. Where is she?\n Where did she go? What happened?"},
{"speaker": "Doc", "line": "Are you okay, Seraphina? Take a\n deep breath."},
{"speaker": "Sera", "line": "No, something isn't right. She is\n not okay. I need to find her. What\n did you do to her?"},
{"speaker": "Doc", "line": "I don't know what you're talking\n about, Seraphina. I don’t\n understand."},
{"speaker": "Sera", "line": "Go back and find her. I need her."},
{"speaker": "Doc", "line": "Okay, I need you to focus on the\n place you are thinking of. Focus on\n the memory."}
]
var current_line = 0
var total_characters = 0
var visible_characters = 0
var is_line_complete = false



func _ready():
	update_dialogue()
	$Advance/Advance.visible = false


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
	get_tree().change_scene_to_file("res://Scenes/Levels/train_station_scene.tscn")
