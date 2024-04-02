extends AudioStreamPlayer2D


var loop_start_time = 76.0
var firstPlaythrough= false

func _ready():
	play()


func _on_finished():
	if not firstPlaythrough:
		firstPlaythrough = true
		seek(loop_start_time)
		play()
