extends Node2D

func _ready():
	show_initial_speech_bubble()
	var guitar = $"Seraphina's Guitar"
	var doctor = $"Male Doctor Character"
	guitar.connect("guitar_interacted", doctor, "_on_guitar_interacted")

func show_initial_speech_bubble():
	$"Male Doctor Character/SpeechBubble".show_bubble("I need to find and unlcok some of her core memories.")
	

func change_scene():
	print("add more game here!")

func _on_dialogue_trigger():
	$"Male Doctor Character/SpeechBubble".show_bubble("Your dialogue text here")
	

# Make sure to resume the game when the dialogue is done
func _on_dialogue_end():
	$"Male Doctor Character/SpeechBubble".visible = false
