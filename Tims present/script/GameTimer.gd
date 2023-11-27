extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var startTime = 60
var seconds = startTime
var minutes = 1


func _on_timer_timeout():
	game_time()
	
func game_time():
	if seconds > 0:
		seconds -= 1
		$Label.text = str(minutes) + ":" + str(seconds)	
	else:
		seconds = startTime - 1 
		if minutes > 0:
			minutes -= 1
			$Label.text = str(minutes) + ":" +str(seconds)
		else:
			$Timer.stop()
			get_tree().change_scene_to_file("res://In progress/doctors_office_male_chapter 1.tscn")
	#change to chapter 2 when that sceen is created



