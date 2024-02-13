extends Control


var startTime = 60
var seconds = startTime
var minutes = 0



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
			get_tree().change_scene_to_file("res://Scenes/Levels/male_office.tscn")




