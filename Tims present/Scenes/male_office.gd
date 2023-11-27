extends Node2D

@onready var audio_stream_player = $OfficeTheme


func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	audio_stream_player.playing = true
	

	
	var new_dialog = Dialogic.start('FirstSession')
	add_child(new_dialog)
	
func _on_dialogic_signal(argument:String):
	if argument == "end_scene":
		audio_stream_player.playing = false
		##get_tree().change_scene_to_file("res://Scenes/serephina_bedroom_male.tscn")
