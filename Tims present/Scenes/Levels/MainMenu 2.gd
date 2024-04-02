extends AudioStreamPlayer

signal startCrossfade
var fadeCrossedA = false
var fadeCrossedB = false
var waitTime = 162.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var trackPosition = get_playback_position()
	if $'.'.playing:
		if trackPosition >= waitTime and fadeCrossedA == false:
			emit_signal("startCrossfade")
			fadeCrossedA = true
		elif trackPosition >= waitTime and fadeCrossedB == false:
			emit_signal("startCrossfade")
			fadeCrossedB = true



func _on_audio_stream_player_b_start_crossfade():
	$'.'.play()
	fadeCrossedA = false


func _on_audio_stream_player_a_start_crossfade():
	$'.'.play()
	fadeCrossedB = false
