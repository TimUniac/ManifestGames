extends Node2D

func _process(delta):
	change_scene()
func change_scene():
	if Input.is_action_just_pressed("Next"):
		get_tree().change_scene_to_file("res://Scenes/Levels/male_office.tscn")

