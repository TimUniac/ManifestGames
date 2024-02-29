extends Node2D

@onready var music_player = $Room
@onready var music_start = preload("res://Assets/Sound/Music/seraroom.mp3")
@onready var music_win = preload("res://Assets/Sound/Music/serawin.mp3")



func _ready():
	music_player.stream = music_start
	music_player.play()
	show_initial_speech_bubble()
	var guitar = $"Seraphina's Guitar"
	var doctor = $"Male Doctor Character"
	var necklace = $"Friendship Necklace"
	var book = $Novel
	var journal = $"CanvasLayer/Journal Read" 
	print (doctor)
	print (guitar)
	$Finish1.visible = false

func _process(delta):
	if $Finish1.visible == true and Input.is_action_just_pressed("Next"):
		change_scene()
func show_initial_speech_bubble():
	$"Male Doctor Character/SpeechBubble".show_bubble("I need to find and unlock some of her core memories.")
	

func change_scene():
	$"transitions/transition player".play("Fade_Out")
	$Finish1.queue_free()
	await $"transitions/transition player".animation_finished
	get_tree().change_scene_to_file("res://Scenes/Levels/more_game_please.tscn")
	get_tree().queue_delete($root)


func _on_male_doctor_character_all_items_collected():
	$Finish1.visible = true
	print ("bedroom clear")
	

func _on_guitar_game_changeSong():
	music_player.stream = music_win
	music_player.play()
