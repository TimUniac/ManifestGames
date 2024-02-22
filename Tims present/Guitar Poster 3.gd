extends Control

var is_opened = false
@onready var areaLabel = $"Interaction Area"
@onready var in_range = false
@onready var doctor = get_parent().get_node("Male Doctor Character")

func _ready():
	$ChordChart.visible = false
	
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
	$ChordChart.visible = false
	doctor.talking = false
	is_opened = false
func open():
	$ChordChart.visible = true
	doctor.talking = true
	is_opened = true

	

		
	
		
	