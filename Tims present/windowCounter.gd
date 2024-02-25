extends Node

@onready var player = null
var openWindows = 0


func _ready():
	pass
	
func _process(delta):
	if player == null:
		player = get_tree().current_scene.get_node_or_null("Male Doctor Character")
		
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
			player.talking == true
		else:
			player.talking == false
	
