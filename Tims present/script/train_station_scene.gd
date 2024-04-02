extends Node2D


@onready var doctor = $"Male Doctor Character"

var done = false

func _ready():
	music()
	var steps = doctor.get_node("Footsteps")

	steps.activeGround = "parking"
	steps.groundMaterial()


	$CanvasLayer/Objectives/Label/Orbs.visible = false
	$CanvasLayer/Objectives/Label4/Orbs.visible = false
	$CanvasLayer/Objectives/Label2/Orbs.visible = false
	$CanvasLayer/Objectives/Label3/Orbs.visible = false
	
	

func music():
	var music = $Music
	music.stream = load("res://Assets/Sound/Music/Music_TrainStation.mp3")
	music.play()

func _input(_event):
		hide_show_objectives() 

func _process(delta):
	pass

func _on_male_doctor_character_all_items_collected():
	$ExitBlocker.disabled = true
	print ("bedroom clear")
	done = true

func _on_teleport_area_body_entered(body):
	$"transitions/transition player".play("Fade_Out")
	await $"transitions/transition player".animation_finished
	get_tree().change_scene_to_file("res://Scenes/forest_scene.tscn")
	get_tree().queue_delete($root)

func lightson():
	$lightgroup.visible = false
	$CanvasLayer/Objectives/Label/Orbs.visible = true
	
func mapcompleted():
	$CanvasLayer/Objectives/Label2/Orbs.visible = true
	
func puzzlecomplete():
	$CanvasLayer/Objectives/Label3/Orbs.visible = true

func hide_show_objectives():
	if Input.is_action_just_pressed("Objective"):
		$CanvasLayer/Objectives.visible = !$CanvasLayer/Objectives.visible

func donegames():
	if done == true:
		$ExitBlocker.disabled = false
