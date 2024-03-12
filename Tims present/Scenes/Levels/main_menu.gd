extends Node2D



func _ready():
	$AnimatedSprite2D.play("Title")

	
func _on_new_pressed():
	Clicks.play(0.0)
	
	get_tree().change_scene_to_file("res://Prologue.tscn")

func _on_setting_pressed():
	Clicks.play(0.0)
	get_tree().change_scene_to_file("res://Scenes/Levels/setting_scene.tscn")
	
func _on_exit_pressed():
	Clicks.play(0.0)
	get_tree().quit()


