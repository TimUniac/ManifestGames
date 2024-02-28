extends Control
var is_visible = false



func _ready():
	hide()  

func show_bubble(text):
	$Label.text = text
	show()
	is_visible = true
	

func hide_bubble():
	hide()
	is_visible = false
	
