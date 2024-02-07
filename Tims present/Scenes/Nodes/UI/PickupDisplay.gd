extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Box.visible = false
	$Box/Item1.visible = false
	$Box/Item2.visible = false
	$Box/Item3.visible = false
	$Box/Item4.visible = false
	$Box/Item5.visible = false
	$Box/Item6.visible = false
	
var opened = false
func open():
	$Box.visible = true
	opened = true
	
func close():
	$Box.visible = false
	opened = false	
	

func _process(delta):
	if Input.is_action_just_pressed("Inventory"):
		if opened:
			close()
		else:
			open()
