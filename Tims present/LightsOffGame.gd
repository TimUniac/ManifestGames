extends Node2D

var offLights = 0


func _ready():
	$".".visible = true
func lightOn():
	offLights -= 1
	print (offLights)
	


func lightOff():
	offLights += 1
	print (offLights)
	if offLights == 25:
		winstate()

func winstate():
	
	var parent = get_parent()
	parent.close()
	parent.playerturnedofflights()
	parent.lightsturnedoff()
	var grandparent = parent.get_parent()
	grandparent.lightsoff()
	


func _on_reset_pressed():
	offLights = 16


func _on_texture_button_pressed():
	$".".visible = false
	
