extends Node

@onready var player = $"../Male Doctor Character"
var openWindows = 0


func _ready():
	pass

		
func openWindow():
	openWindows += 1
	walkable()
	
func closeWindow():
	openWindows -= 1
	walkable()
	
func walkable():
	print (openWindows)
	print (player)
	if player != null:
		if openWindows > 0:
			player.talking = true
		if openWindows == 0:
			player.talking = false
	
