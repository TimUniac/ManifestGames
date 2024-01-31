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
	$NacklaceGame.visible = false

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
	$NacklaceGame/NecklaceSequenceInput.clear()
	$NacklaceGame.visible = true
	doctor.talking = true
	is_opened = true		
func close():
	$NacklaceGame.visible = false
	doctor.talking = false
	is_opened = false

func playercollect():
	player.collect_item(3)
	print("player")
