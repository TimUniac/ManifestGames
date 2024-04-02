extends AudioStreamPlayer2D


var loop_start_time = 76.0


func _ready():
	play()


func _on_finished():
		seek(loop_start_time)
		play()
