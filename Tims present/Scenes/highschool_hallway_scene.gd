extends Node2D

var done = false
@onready var doctor = $"Male Doctor Character"
# Called when the node enters the scene tree for the first time.
func _ready():
	$Objectives/Label/Orbs.visible = false
	$Objectives/Label2/Orbs2.visible = false
	$Objectives/Label3/Orbs3.visible = false
	$TextureRect.visible = false
	$Finish.visible = false
	$"Male Doctor Character/Footsteps".activeGround = "hallway"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if done == true and Input.is_action_just_pressed("Next"):
		change_scene()

func hide_show_objectives():
	if Input.is_action_just_pressed("Objective"):
		$Objectives.visible = !$Objectives.visible

func _input(_event):
		hide_show_objectives()

func lightsoff():
	$TextureRect.visible = true

func change_scene():
	$"transitions/transition player".play("Fade_Out")
	$Finish.queue_free()
	await $"transitions/transition player".animation_finished
	get_tree().change_scene_to_file("res://Scenes/Levels/main_menu.tscn")
	get_tree().queue_delete($root)
	
func _on_male_doctor_character_all_items_collected():
	$Finish.visible = true
	done = true
	print ("you did it")
