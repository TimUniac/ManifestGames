extends Node

func _ready():
	var file = File.new()
	if file.open("user://test.txt", File.WRITE):
		file.store_string("Hello Godot")
		file.close()
		print("File written successfully")
	else:
		print("Failed to open file for writing")
