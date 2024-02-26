extends Area2D

signal necklace_interacted(necklaceDialogue)
@export var action_name: String = "interact"
@onready var interaction_label = $Panel
@onready var doctor = get_parent().get_node("Male Doctor Character")
#@export var item: InvItem
@onready var interaction_area = $"Interaction Area"
@onready var sprite = $Sprite2D
var player = null
var inrange = false
var is_opened = false

@onready var necklaceDialogue: String = "Hmm, 'ST ENDS'?...oh It's a Best Friends Necklace"
@onready var SpeechBubble = $"Male Doctor Character/SpeechBubble"

func _ready():
	interaction_label.visible = false
	$CanvasLayer/NacklaceGame.visible = false

func _on_body_entered(body):
	if body.has_method("player"):
		interaction_label.visible = true
		inrange = true
		player = body
		print("hi there")
		doctor.speak(necklaceDialogue)
		
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
	$CanvasLayer/NacklaceGame/NecklaceSequenceInput.clear()
	$CanvasLayer/NacklaceGame.visible = true
	WindowCounter.openWindow()
	doctor.talking = true
	is_opened = true		
func close():
	$CanvasLayer/NacklaceGame.visible = false
	WindowCounter.closeWindow()
	doctor.talking = false
	is_opened = false
	
signal item_collected(item_number)

func playercollect():
	emit_signal("item_collected", 3)
	visible = false


func _on_texture_button_pressed():
	close()
