extends Area2D

signal necklace_interacted(necklaceDialogue)
@export var action_name: String = "interact"
@onready var interaction_label = $Panel
@onready var doctor = get_parent().get_node("Male Doctor Character")

@onready var interaction_area = $"Interaction Area"
@onready var sprite = $Sprite2D
var player = null
var inrange = false
var is_opened = false

var gamenacklace = null

@onready var objlist = $"../Objectives"
@onready var necklaceDialogue: String = "Hmm, 'ST ENDS'?...oh It's a Best Friends Necklace"
@onready var SpeechBubble = $"Male Doctor Character/SpeechBubble"

func _ready():
	interaction_label.visible = false
	

func _on_body_entered(body):
	if body.has_method("player"):
		interaction_label.visible = true
		inrange = true
		player = body
		print("hi there")
		doctor.speak(necklaceDialogue)
		
func _on_body_exited(_body):
	interaction_label.visible = false
	inrange = false
	

func _process(_delta):
	if inrange and Input.is_action_just_pressed("Interact"):
		if is_opened:
			close()
		else:
			open()

func open():

	if gamenacklace == null:
		var nacklace_game_scene = preload("res://Scenes/Nodes/UI/nacklace_game.tscn").instantiate()
		
		gamenacklace = nacklace_game_scene
		add_child(gamenacklace)
		print_tree()
	
	doctor.talking = true
	is_opened = true		
func close():
	
	if gamenacklace != null:
		remove_child(gamenacklace)
		gamenacklace.queue_free()
		gamenacklace = null
	
	doctor.talking = false
	is_opened = false
	
signal item_collected(item_number)

func playercollect():
	emit_signal("item_collected")
	visible = false
	$'.'.queue_free()
	objlist.foundnacklace()

func _on_texture_button_pressed():
	close()
