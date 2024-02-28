extends Node


func toggle_pause():
	get_tree().paused = !get_tree().paused
