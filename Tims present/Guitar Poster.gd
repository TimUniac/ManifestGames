extends Control

var is_opened = false
@onready var areaLabel = $"Interaction Area"
@onready var in_range = false
@onready var doctor = get_parent().get_node("Male Doctor Character")

func _ready():
	$CanvasLayer/ChordChart.visible = false
	
func _process(_delta):
	if areaLabel.interaction_label.visible == true:
		in_range = true
	if areaLabel.interaction_label.visible == false:
		in_range = false
	
	if Input.is_action_just_pressed("Interact") and in_range:
		if is_opened:
			close()
		else:
			open()
			

func close():
	$CanvasLayer/ChordChart.visible = false
	doctor.talking = false
	is_opened = false
func open():
	$CanvasLayer/ChordChart.visible = true
	doctor.talking = true
	is_opened = true

	

		
	
		
	
