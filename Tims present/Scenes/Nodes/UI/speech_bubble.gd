extends Control
var is_visible = false

func _ready():
	hide()  # Hide the bubble initially

func show_bubble(text):
	$Label.text = text
	show()
	is_visible = true
	# Add tweening or animation code here if necessary

func hide_bubble():
	hide()
	is_visible = false
	# Add tweening or animation code here if necessary

