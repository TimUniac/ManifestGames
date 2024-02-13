extends Area2D

signal tutorial_interacted(tutorialDialogue)
@export var action_name: String = "interact"
@onready var interaction_label = $Panel
@onready var doctor = get_parent().get_node("Male Doctor Character")

@onready var interaction_area = $"Interaction Area"
@onready var sprite = $Sprite2D
var player = null
var inrange = false
var collect = false
var is_opened = false

@onready var tutorialDialogue: String = "These files are new to my memories, I'll need to unlock them."
@onready var SpeechBubble = $"Male Doctor Character/SpeechBubble"

func _ready():
	interaction_label.visible = false
	
	




func _on_body_entered(body):
	if body.has_method("player"):
		interaction_label.visible = true
		inrange = true
		player = body
		print("hi there")
		doctor.speak(tutorialDialogue)
		
func _on_body_exited(body):
	interaction_label.visible = false
	inrange = false

func _process(delta):
	if inrange and Input.is_action_just_pressed("Interact"):
		if is_opened:
			close()
		else:
			
			open()
func open():
	emit_signal("playGame")
	doctor.talking = true
	is_opened = true
	
func close():

	doctor.talking = false
	is_opened = false
	

		
		
signal item_collected(item_number)
signal playGame
func playercollect():
	emit_signal("item_collected", 6)
	visible = false
