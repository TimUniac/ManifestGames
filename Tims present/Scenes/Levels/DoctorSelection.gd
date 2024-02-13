extends Node



#func _on_female_doctor_pressed():
	#get_tree().change_scene_to_file("res://In progress/female_tutorial.tscn")


func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://Completed Assets/Scenes/main_menu.tscn")


func _on_male_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/tutorial_level.tscn")


func _on_female_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/tutorial_level.tscn")
