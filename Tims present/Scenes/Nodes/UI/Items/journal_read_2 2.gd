extends Control
var player = null


@onready var SpeechBubble = $"Male Doctor Character/SpeechBubble"
@onready var doctor = get_parent().get_node("Male Doctor Character")


var is_opened = false
var inRange = false

func _ready():
	$"CanvasLayer/NewJournal2".visible = false




func close():
	$"CanvasLayer/NewJournal2".visible = false
	doctor.talking = false
	is_opened = false
	
func open():
	$"CanvasLayer/NewJournal2".visible = true
	doctor.talking = true
	is_opened = true



func _process(_delta):
	
	if Input.is_action_just_pressed("Journal"):
		if is_opened:
			close()
		else:
			open()
