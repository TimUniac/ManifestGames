extends Control

@onready var doctor = get_parent().get_node("Male Doctor Character")

func _ready():
	$Camera2D/CanvasLayer2/SettingsPanel.visible = false
	$"Settings toggle".visible = true
	


var opened = false

func close():
	$Camera2D/CanvasLayer2/SettingsPanel.visible = false
	opened = false
	$"Settings toggle".visible = true
	doctor.talking = false
	
func open():
	$Camera2D/CanvasLayer2/SettingsPanel.visible = true
	opened = true
	$"Settings toggle".visible = false
	doctor.talking = true

		
func _on_settings_toggle_pressed():
	open()
	print("hey")



func _on_texture_button_pressed():
	close()



func _on_texture_button_2_pressed():
		get_tree().change_scene_to_file("res://Scenes/Levels/main_menu.tscn")
