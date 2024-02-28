extends Control

var is_opened = false
@onready var areaLabel = $"Interaction Area"
@onready var in_range = false
@onready var doctor = get_parent().get_node("Male Doctor Character")
@onready var counter = $"../windowCounter"
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
	doctor.talking = false
	is_opened = false
	counter.closeWindow()
func open():
	$BigPostit.visible = true
	doctor.talking = true
	is_opened = true
	counter.openWindow()



func _on_close_pressed():
	close()
