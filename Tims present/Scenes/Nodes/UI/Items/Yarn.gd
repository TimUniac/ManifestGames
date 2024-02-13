extends Area2D

signal book_interacted(bookDialogue)
@export var action_name: String = "interact"
@onready var interaction_label = $Panel
@onready var doctor = get_parent().get_node("Male Doctor Character")
#@export var item: InvItem
@onready var interaction_area = $"Interaction Area"
@onready var sprite = $Sprite2D
@onready var talking = false

var player = null
var inrange = false
var collect = false
var is_opened = false


@onready var bookDialogue: String = "The cover of this book is so damaged I can't read the title."
@onready var SpeechBubble = $"Male Doctor Character/SpeechBubble"

func _ready():
	interaction_label.visible = false
	$CanvasLayer/BookGame.visible = false


func _on_body_entered(body):
	if body.has_method("player"):
		interaction_label.visible = true
		inrange = true
		player = body
		print("hi there")
		doctor.speak(bookDialogue)
		
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
	$CanvasLayer/BookGame/SequenceInput.clear()
	$CanvasLayer/BookGame.visible = true
	doctor.talking = true
	is_opened = true	
func close():
	$CanvasLayer/BookGame.visible = false
	doctor.talking = false
	is_opened = false
		

signal item_collected(item_number)

func playercollect():
	emit_signal("item_collected", 2)
	visible = false



func _on_texture_button_pressed():
	close()
