extends Control

var is_opened = false
@onready var areaLabel = $Panel/interaction_label
@onready var in_range = false
@onready var doctor = get_parent().get_node("Male Doctor Character")

func _ready():
	$ChordChart.visible = false
	areaLabel.visible = false
	print (areaLabel)
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
	$ChordChart.visible = false
	doctor.talking = false
	is_opened = false
	
func open():
	$ChordChart.visible = true
	doctor.talking = true
	is_opened = true
	global.guitarPosterSeen = true




func _on_close_pressed():
	close()


func _on_area_2d_body_entered(body):
	print ("entered")
	areaLabel.visible = true
	print ("shown")
func _on_area_2d_body_exited(body):
	print ("exited")
	areaLabel.visible = false
	print ("not shown")
