extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Male Doctor Character/Footsteps".activeGround = "parking"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_teleport_area_body_entered(body):
	$"transitions/transition player".play("Fade_Out")
	await $"transitions/transition player".animation_finished
	get_tree().change_scene_to_file("res://Scenes/Levels/main_menu.tscn")
	get_tree().queue_delete($root)

func lightson():
	$lightgroup.visible = false
