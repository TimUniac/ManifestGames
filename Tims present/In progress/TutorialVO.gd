extends AudioStreamPlayer

@onready var audio_stream_player = $TutorialVO

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	var new_dialog = Dialogic.start('tutorial')
	add_child(new_dialog)

func _on_dialogic_signal(argument:String):
	if argument == "1":
		audio_stream_player.playing
