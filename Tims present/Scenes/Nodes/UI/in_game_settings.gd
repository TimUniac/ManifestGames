extends Control



func _ready():
	$CanvasLayer2/SettingsPanel.visible = false
	$"Settings toggle".visible = true
	


var opened = false

func close():
	$CanvasLayer2/SettingsPanel.visible = false
	opened = false
	$"Settings toggle".visible = true
func open():
	$CanvasLayer2/SettingsPanel.visible = true
	opened = true
	$"Settings toggle".visible = false

		
func _on_settings_toggle_pressed():
	open()
	print("hey")


func _on_texture_button_pressed():
	close()
