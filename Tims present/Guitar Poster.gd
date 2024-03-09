extends Control

var is_opened = false
@onready var interaction_label = $Panel
@onready var in_range = false
@onready var doctor = get_parent().get_node("Male Doctor Character")

func _ready():
	$ChordChart.visible = false
	interaction_label.visible = false
	
func _process(_delta):
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


func _on_area_2d_area_entered(area):
	print ("bodied")
	interaction_label.visible = true
	in_range = true


func _on_area_2d_area_exited(area):
	print ("deBodied")
	interaction_label.visible = false
	in_range = false
