extends Node2D


@onready var music = $TutorialMusic
@onready var doctor = $"Male Doctor Character"

func _ready():
	$Finish.visible = false
	var tutorial = $Files
	music.stream.loop = true
	doctor.talking = false
	$Files/TutorialGame/SequenceInput.set_process(false)

func _process(delta):
	if $Finish.visible == true and Input.is_action_just_pressed("Next"):
		change_scene()
	
func _input(event):
	pass
	hide_show_objectives()
	


func change_scene():
	$"transitions/transition player".play("Fade_Out")
	await $"transitions/transition player".animation_finished
	get_tree().change_scene_to_file("res://Scenes/Levels/male_office.tscn")

func hide_show_objectives():
	if Input.is_action_just_pressed("Objective"):
		if $Objectives.visible == true:
			$Objectives.visible = false
		elif $Objectives.visible == false:
			$Objectives.visible = true


func _on_male_doctor_character_all_items_collected():
		$Finish.visible = true
