extends Control

var is_visible = false

@onready var doctor = get_parent()

func _ready():
	hide()  

func show_bubble(text):
	$Label.text = text
	
	show()	
	is_visible = true
	
	
func hide_bubble():
	hide()
	is_visible = false
