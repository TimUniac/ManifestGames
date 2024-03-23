extends Control


var offLights = 0


func _ready():
	$".".visible = true
func lightOn():
	offLights -= 1
	print (offLights)
	if offLights == 0:
		winstate()
	

 

func lightOff():
	offLights += 1
	print (offLights)
	

func winstate():
	print("winner")
	var parent = get_parent()
	parent.close()
	parent.lightsturnedon()

	
	


func _on_reset_pressed():
	offLights = 16


func _on_texture_button_pressed():
	var parent = get_parent()
	parent.close()
	
