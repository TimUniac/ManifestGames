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

@onready var objlist = $"../Objectives"
@onready var guitarDialogue: String = "This guitar seems to be important, I wonder if a song would unlock it."
@onready var SpeechBubble = $"Male Doctor Character/SpeechBubble"

var gameGuitar = null

func _ready():
	interaction_label.visible = false
	


func _on_body_entered(body):
	if body.has_method("player"):
		interaction_label.visible = true
		inrange = true
		player = body
		print("hi there")
		doctor.speak(guitarDialogue)
		
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
	if gameGuitar == null:
		var guitar_game_scene = preload("res://Scenes/Nodes/UI/guitar_game.tscn").instantiate()
		
		gameGuitar = guitar_game_scene
		add_child(gameGuitar)
	doctor.talking = true
	is_opened = true
	
func close():
	if gameGuitar != null:
		remove_child(gameGuitar)
		gameGuitar.queue_free()
		gameGuitar = null
	doctor.talking = false
	is_opened = false
	
		
 
signal item_collected(item_number)

func playercollect():
	emit_signal("item_collected")
	visible = false
	$'.'.queue_free()
	objlist.foundguitar()
		
func guitar():
	pass

signal playGame




func _on_texture_button_pressed():
	close()
