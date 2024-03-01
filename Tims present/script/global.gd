extends Node

var player_exit_hallway_posx = 0
var player_exit_hallway_posy = 0
var player_start_posx = 0
var player_start_posy = 0

func _process(_delta):
	closewindow()

func closewindow(): 
	if Input.is_action_just_pressed("Close"):
		get_tree().root.mode = Window.MODE_WINDOWED
	
