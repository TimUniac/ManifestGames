extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("Loading")





func _on_animated_sprite_2d_animation_finished():
	get_tree().change_scene_to_file("res://Scenes/Levels/tutorial_level.tscn")
