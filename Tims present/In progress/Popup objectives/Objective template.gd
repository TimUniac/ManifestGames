extends Control

func _ready():
	$VBoxContainer/TextureButton.visible = true
	$VBoxContainer/NinePatchRect.visible = true

var is_opened = false

func close():
	$VBoxContainer/NinePatchRect.visible = false
	is_opened = false
func open():
	$VBoxContainer/NinePatchRect.visible = true
	is_opened = true


	

func _on_texture_button_pressed():
	if is_opened:
		close()
	else:
		open()
