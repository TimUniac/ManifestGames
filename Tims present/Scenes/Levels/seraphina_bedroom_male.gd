extends Node2D

func _ready():
	show_initial_speech_bubble()
	var guitar = $"Seraphina's Guitar"
	var doctor = $"Male Doctor Character"
	var necklace = $"Friendship Necklace"
	var book = $Novel
	print (doctor)
	print (guitar)
	

func show_initial_speech_bubble():
	$"Male Doctor Character/SpeechBubble".show_bubble("I need to find and unlock some of her core memories.")
	

func change_scene():
	print("add more game here!")

func _on_dialogue_trigger():
	$"Male Doctor Character/SpeechBubble".show_bubble("Your dialogue text here")
	


func _on_dialogue_end():
	$"Male Doctor Character/SpeechBubble".visible = false
