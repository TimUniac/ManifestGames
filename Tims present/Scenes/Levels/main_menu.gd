extends Node2D

func _ready():
	$AnimatedSprite2D.play("Title")

	
func _on_new_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/tutorial_level.tscn")
	
func _on_setting_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/setting_scene.tscn")

func _on_exit_pressed():
	get_tree().quit()
