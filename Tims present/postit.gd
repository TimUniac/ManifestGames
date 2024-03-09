extends Control

var is_opened = false
@onready var areaLabel = $"Interaction Area/Panel"
@onready var in_range = false
@onready var doctor = get_parent().get_node("Male Doctor Character")

func _ready():
	$BigPostit.visible = false
	areaLabel.visible = false
func _process(_delta):
	if areaLabel.visible == true:
		in_range = true
	if areaLabel.visible == false:
		in_range = false
	
			
	if Input.is_action_just_pressed("Interact") and in_range:
		if is_opened:
			close()
		else:
			open()
			
	
func close():
	$BigPostit.visible = false
	doctor.talking = false
	is_opened = false
	
func open():
	$BigPostit.visible = true
	doctor.talking = true
	is_opened = true




func _on_close_pressed():
	close()


func _on_interaction_area_body_entered(body):
	areaLabel.visible = true


func _on_interaction_area_body_exited(body):
	areaLabel.visible = false
