extends Control

var is_opened = false
@onready var areaLabel = $Panel
@onready var in_range = false
@onready var doctor = get_parent().get_node("Male Doctor Character")



func _ready():
	interactionnotvisible()
	$CanvasLayer/ChordChart.visible = false
	areaLabel.visible = false
	
	print (areaLabel)
	
func _process(_delta):

			
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
	global.guitarPosterSeen = true

func interactionnotvisible():
	areaLabel.visible = false




func _on_area_2d_body_entered(body):
	print (body)
	areaLabel.visible = true
	in_range = true
	print ("shown")
func _on_area_2d_body_exited(body):
	print ("exited")
	areaLabel.visible = false
	in_range = false
	print ("not shown")


func _on_texture_button_pressed():
	close()
