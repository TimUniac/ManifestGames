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
var hint1 = false
var hintsshown = false

@onready var objlist = $"../Objectives"
@onready var guitarDialogue: String = "This guitar seems to be important, I wonder if a song would unlock it."
@onready var SpeechBubble = $"Male Doctor Character/SpeechBubble"

var gameGuitar = null
signal chordsSeen
func _ready():
	interaction_label.visible = false
	$"CanvasLayer/Help Box".visible = false
	$"CanvasLayer/Help Box/Hint1".visible = false
	$"CanvasLayer/Help Box/Hint2".visible = false
	


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
	if is_opened and Input.is_action_just_pressed("Help"):
		if hint1:
			close_hint()
		else:
			open_hint()
			
func open():
	if gameGuitar == null:
		var guitar_game_scene = preload("res://Scenes/Nodes/UI/guitar_game.tscn").instantiate()
		
		gameGuitar = guitar_game_scene
		add_child(gameGuitar)
	doctor.talking = true
	is_opened = true
	
func close():
	if gameGuitar != null:
		print("Close Guitar")
		remove_child(gameGuitar)
		gameGuitar.queue_free()
		gameGuitar = null
	doctor.talking = false
	is_opened = false
	
		
func open_hint():
	$"CanvasLayer/Help Box".visible = true
	$"CanvasLayer/Help Box/Hint1".visible = true
	$"CanvasLayer/Help Box/Hint2".visible = true
	hint1 = true
			
		
func close_hint():
	$"CanvasLayer/Help Box".visible = false
	hint1 = false
	
signal item_collected(item_number)

func playercollect():
	var parent = get_parent()
	parent.guitarSong()
	emit_signal("item_collected")
	visible = false
	$'.'.queue_free()
	objlist.foundguitar()
		
func guitar():
	pass

signal playGame

		
func _on_texture_button_pressed():
	close_hint()

func showChords():
	if gameGuitar and gameGuitar.has_method("displayChords"):
		gameGuitar.displayChords()
	else:
		print("Guitar game is not open or does not have the displayChords method.")
