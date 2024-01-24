extends Control


func _ready():
	$"Objective base".visible = false

	
var seen = false

func open():
	$"Objective base".visible = true
	seen = true

func close():
	$"Objective base".visible = false
	seen = false

func _on_objective_toggle_pressed():
	if seen:
		close()
	else:
		open()
