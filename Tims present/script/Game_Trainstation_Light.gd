extends Control


var onLights = 25


func _ready():
	$".".visible = true
func lightOn():
	onLights -= 1
	print (onLights)
	


func lightOff():
	onLights += 1
	print (onLights)
	if onLights == 0:
		winstate()

func winstate():
	var parent = get_parent()
	parent.close()
	parent.playerturnedofflights()
	parent.lightsturnedoff()
	var grandparent = parent.get_parent()
	grandparent.lightsoff()
	


func _on_reset_pressed():
	onLights = 16


func _on_texture_button_pressed():
	$".".visible = false
	
