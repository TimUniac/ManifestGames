extends Node2D


@onready var music = $Control/TutorialMusic
@onready var doctor = $"Control/Male Doctor Character"


func _ready():
	$Control/Finish.visible = false
	$Control/Objectives/Label/Orbs.visible = false
	$Control/Objectives/Label2/Orbs2.visible = false
	$Control/Objectives/Label3/Orbs3.visible = false
	$Control/"Male Doctor Character/Footsteps".activeGround = "office"

func _process(_delta):
	if $Control/Finish.visible == true and Input.is_action_just_pressed("Next"):
		
		change_scene()
	
func _input(_event):
		hide_show_objectives()

func change_scene():
	$"Control/transitions/transition player".play("Fade_Out")
	await $"Control/transitions/transition player".animation_finished
	$Control/Finish.queue_free()
	get_tree().change_scene_to_file("res://Scenes/Levels/male_office.tscn")

func hide_show_objectives():
	if Input.is_action_just_pressed("Objective"):
		$Control/Objectives.visible = !$Objectives.visible

func _on_male_doctor_character_all_items_collected():
	$Control/Finish.visible = true
	
	
