extends Node2D


@onready var music = $TutorialMusic
@onready var doctor = $"Male Doctor Character"


func _ready():
	$Finish.visible = false
	music.stream.loop = true
	

func _process(_delta):
	if $Finish.visible == true and Input.is_action_just_pressed("Next"):
		
		change_scene()
	
func _input(_event):
		hide_show_objectives()

func change_scene():
	$"transitions/transition player".play("Fade_Out")
	await $"transitions/transition player".animation_finished
	$Finish.queue_free()
	get_tree().change_scene_to_file("res://Scenes/Levels/male_office.tscn")

func hide_show_objectives():
	if Input.is_action_just_pressed("Objective"):
		$Objectives.visible = !$Objectives.visible

func _on_male_doctor_character_all_items_collected():
	$Finish.visible = true
	
	
