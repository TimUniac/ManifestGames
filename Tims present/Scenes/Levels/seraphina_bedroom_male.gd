extends Node2D

func _ready():
	show_initial_speech_bubble()
	var guitar = $"Seraphina's Guitar"
	var doctor = $"Male Doctor Character"
	var necklace = $"Friendship Necklace"
	var book = $Novel
	var journal = $"CanvasLayer/Journal Read" 
	print (doctor)
	print (guitar)
	
func _process(delta):
	change_scene()
	
func show_initial_speech_bubble():
	$"Male Doctor Character/SpeechBubble".show_bubble("I need to find and unlock some of her core memories.")
	

func change_scene():
	if Input.is_action_just_pressed("Next"):
		$"transitions/transition player".play("Fade_Out")
		await $"transitions/transition player".animation_finished
		get_tree().change_scene_to_file("res://Scenes/Levels/more_game_please.tscn")

