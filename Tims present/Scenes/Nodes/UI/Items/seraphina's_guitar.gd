extends Area2D

signal guitar_interacted(guitarDialogue)
@export var action_name: String = "interact"
@onready var interaction_label = $Panel
@onready var doctor = get_parent().get_node("Male Doctor Character")

#@export var item: InvItem
@onready var interaction_area = $"Interaction Area"
@onready var sprite = $Sprite2D
var player = null
var inrange = false
var is_opened = false

@onready var guitarDialogue: String = "This guitar seems to be important, I wonder if a song would unlock it."
@onready var SpeechBubble = $"Male Doctor Character/SpeechBubble"

func _ready():
	interaction_label.visible = false
	$CanvasLayer/GuitarGame.visible = false


func _on_body_entered(body):
	if body.has_method("player"):
		interaction_label.visible = true
		inrange = true
		player = body
		print("hi there")
		doctor.speak(guitarDialogue)
		
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
	$CanvasLayer/GuitarGame.visible = true
	doctor.talking = true
	is_opened = true		
func close():
	$CanvasLayer/GuitarGame.visible = false
	doctor.talking = false
	is_opened = false
		
 
signal item_collected(item_number)

func playercollect():
	emit_signal("item_collected", 1)
	visible = false
		
		
func guitar():
	pass


func _on_texture_button_pressed():
	close()
