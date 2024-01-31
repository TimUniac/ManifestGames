extends Control

var is_opened = false
@onready var areaLabel = $"Interaction Area"
@onready var in_range = false
func _ready():
	$BigPostit.visible = false
	
func _process(delta):
	if areaLabel.interaction_label.visible == true:
		in_range = true
	if areaLabel.interaction_label.visible == false:
		in_range = false
	
			
	if Input.is_action_just_pressed("Look") and in_range:
		if is_opened:
			close()
		else:
			open()
			
	
func close():
	$BigPostit.visible = false
	is_opened = false
func open():
	$BigPostit.visible = true
	is_opened = true


