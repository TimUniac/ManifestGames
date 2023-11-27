extends Node2D


func changescene():
	if Input.is_action_just_pressed("Pickup"):
		get_tree().change_scene_to_file("res://In progress/seraphina_bedroom_male.tscn")

#func 
#changescene()
