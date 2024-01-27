extends Control

var is_opened = false
@onready var areaLabel = $"Interaction Area"
@onready var in_range = false
func _ready():
	$ChordChart.visible = false
	
func _process(delta):
	if areaLabel.interaction_label.visible == true:
		in_range = true
	if areaLabel.interaction_label.visible == false:
		in_range = false
	if in_range == true and Input.is_action_just_pressed("Interact") and is_opened == false:
			$ChordChart.visible = true
			is_opened = true
	if in_range == false and Input.is_action_just_pressed("Interact") and is_opened == true:
			$ChordChart.visible = false
			is_opened = false
		
	
