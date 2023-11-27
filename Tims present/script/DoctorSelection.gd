extends Node

@onready var transition = $Transition

func _ready():
	transition.play("fade_IN")
	



#func _on_female_doctor_pressed():
	#get_tree().change_scene_to_file("res://In progress/female_tutorial.tscn")


func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://Completed Assets/Scenes/main_menu.tscn")


func _on_male_pressed():
	get_tree().change_scene_to_file("res://Scenes/male_tutorial.tscn")
