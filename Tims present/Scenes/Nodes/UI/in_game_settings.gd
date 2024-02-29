extends Control

@onready var counter = $"../windowCounter"

func _ready():
	$Camera2D/CanvasLayer2/SettingsPanel.visible = false
	$"Settings toggle".visible = true
	


var opened = false

func close():
	$Camera2D/CanvasLayer2/SettingsPanel.visible = false
	opened = false
	$"Settings toggle".visible = true
	
func open():
	$Camera2D/CanvasLayer2/SettingsPanel.visible = true
	opened = true
	$"Settings toggle".visible = false

		
func _on_settings_toggle_pressed():
	open()
	print("hey")
	counter.openWindow()


func _on_texture_button_pressed():
	close()
	counter.closeWindow()
