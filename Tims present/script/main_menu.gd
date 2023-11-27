extends Node2D

func _on_new_pressed():
	get_tree().change_scene_to_file("res://Scenes/doctor_selection.tscn")

func _on_exit_pressed():
	get_tree().quit()
