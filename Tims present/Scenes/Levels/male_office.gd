extends Node2D

@onready var audio_stream_player = $OfficeTheme

func _ready():
	audio_stream_player.playing = true
	
#func _process(delta):
#	change_scene()

#func change_scene():
#	if Input.is_action_just_pressed("Next"):
#		get_tree().change_scene_to_file("res://Scenes/Levels/seraphina_bedroom_male.tscn")



