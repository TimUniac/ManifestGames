extends Node2D

var offLights = 0



func lightOn():
	offLights -= 1
	print (offLights)
	


func lightOff():
	offLights += 1
	print (offLights)
	if offLights == 25:
		winstate()

func winstate():
	print ("you win!")