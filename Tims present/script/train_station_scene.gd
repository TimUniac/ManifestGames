extends Node2D

var done = false
var lightsturnt = false
var mapdone = false
var necklacebuilt = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/Objectives/Label/Orbs.visible = false
	$CanvasLayer/Objectives/Label4/Orbs.visible = false
	$CanvasLayer/Objectives/Label2/Orbs.visible = false
	$CanvasLayer/Objectives/Label3/Orbs.visible = false
	$ExitBlocker/CollisionShape2D.disabled = false
	$"ExitBlocker/Area2D/Speech bubble to collect".disabled = false
	
	
	$"Male Doctor Character/Footsteps".activeGround = "parking"


func _input(_event):
		hide_show_objectives() 

func _process(delta):
	donegames()

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
	lightsturnt = true
	
func mapcompleted():
	$CanvasLayer/Objectives/Label2/Orbs.visible = true
	mapdone = true
	
func puzzlecomplete():
	$CanvasLayer/Objectives/Label3/Orbs.visible = true
	necklacebuilt = true

func hide_show_objectives():
	if Input.is_action_just_pressed("Objective"):
		$CanvasLayer/Objectives.visible = !$CanvasLayer/Objectives.visible

func donegames():
	if necklacebuilt == true and mapdone ==true and lightsturnt == true :
		$ExitBlocker/CollisionShape2D.disabled = true
		$"ExitBlocker/Area2D/Speech bubble to collect".disabled = true
