extends Node2D

@onready var music_player = $Room
@onready var music_start = preload("res://Assets/Sound/Music/seraroom.mp3")
@onready var music_win = preload("res://Assets/Sound/Music/serawin.mp3")
@onready var doctor = $"Male Doctor Character"
@onready var guitarposter = $"Guitar Poster"
@onready var ground = "bedroom" 

var done = false


func _ready():
	music_player.stream = music_start
	music_player.play(1.65)
	show_initial_speech_bubble()
	var guitar = $"Seraphina's Guitar"
	var doctor = $"Male Doctor Character"
	var necklace = $"Friendship Necklace"
	var book = $Novel
	var journal = $"CanvasLayer/Journal Read" 
	print (doctor)
	print (guitar)
	$Finish.visible = false
	$Objectives/Label/Orbs.visible = false
	$Objectives/Label2/Orbs.visible = false
	$Objectives/Label3/Orbs.visible = false
	$Objectives/Label4/Orbs.visible = false
	guitarposter.interactionnotvisible()
	doctor.talking = true
	$"Male Doctor Character/Footsteps".activeGround = "bedroom"

func _process(_delta):
	if done == true and Input.is_action_just_pressed("Next"):
		change_scene()
func show_initial_speech_bubble():
	$"Male Doctor Character/SpeechBubble".show_bubble("I need to find and unlock some of her core memories.")
	
func _input(_event):
		hide_show_objectives() 

func change_scene():
	$"transitions/transition player".play("Fade_Out")
	$Finish.queue_free()
	await $"transitions/transition player".animation_finished
	get_tree().change_scene_to_file("res://OfficeChapter2.tscn")
	get_tree().queue_delete($root)


func _on_male_doctor_character_all_items_collected():
	$Finish.visible = true
	print ("bedroom clear")
	done = true

func hide_show_objectives():
	if Input.is_action_just_pressed("Objective"):
		$Objectives.visible = !$Objectives.visible


func guitarSong():
	music_player.stream = music_win
	music_player.play()

func lyricsSeen():
	print ("the root has seen the lyrics")
	var guitar = $"Seraphina's Guitar"
	guitar.showChords()
