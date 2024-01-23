extends Control


func _ready():
	$CanvasLayer2/SettingsPanel.visible = false
	$"Settings toggle".visible = true


var opened = false

func close():
	$CanvasLayer2/SettingsPanel.visible = false
	opened = false
func open():
	$CanvasLayer2/SettingsPanel.visible = true
	opened = true

		
func _on_settings_toggle_pressed():
	if opened:
		close()
		
	else:
		open()
		print("hey")
