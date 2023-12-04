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
			$Transitioner.fadeout()
			await($Transitioner.finished)
			get_tree().change_scene_to_file("res://In progress/doctors_office_male_chapter 1.tscn")




