extends Node



func _ready():
	$Transitioner.fadein()
	



#func _on_female_doctor_pressed():
	#get_tree().change_scene_to_file("res://In progress/female_tutorial.tscn")


func _on_texture_button_pressed():
	$Transitioner.fadeout()
	await($Transitioner.finished)
	get_tree().change_scene_to_file("res://Completed Assets/Scenes/main_menu.tscn")


func _on_male_pressed():
	$Transitioner.fadeout()
	await($Transitioner.finished)
	get_tree().change_scene_to_file("res://In progress/tutorial_level.tscn")
