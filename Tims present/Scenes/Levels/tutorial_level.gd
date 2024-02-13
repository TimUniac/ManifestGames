extends Node2D

@onready var password = $Files/TutorialGame/SequenceInput 
@onready var music = $TutorialMusic
@onready var doctor = $"Male Doctor Character"
var gameFiles = null

func _ready():
	$Finish.visible = false
	music.stream.loop = true
	doctor.talking = false

func _process(delta):
	if $Finish.visible == true and Input.is_action_just_pressed("Next"):
		change_scene()
	
func _input(event):
		hide_show_objectives()

func change_scene():
	$"transitions/transition player".play("Fade_Out")
	await $"transitions/transition player".animation_finished
	get_tree().change_scene_to_file("res://Scenes/Levels/male_office.tscn")

func hide_show_objectives():
	if Input.is_action_just_pressed("Objective"):
		$Objectives.visible = !$Objectives.visible

func _on_male_doctor_character_all_items_collected():
	$Finish.visible = true

func _on_files_play_game():
	if gameFiles == null:
		var tutorial_game_scene = preload("res://Scenes/Nodes/UI/tutorial_game.tscn")
		gameFiles = tutorial_game_scene.instance()
		add_child(gameFiles)

func closeFiles():
	if gameFiles != null:
		remove_child(gameFiles)
		gameFiles.queue_free()
		gameFiles = null
